#!/usr/bin/env bash

ROOTCLEAN="$ROOTCLEAN"

set -o errexit
set -o nounset
set -o pipefail

set -x

HARDPATH=/usr/sbin:/usr/bin:/sbin:/bin

if [ "$ROOTCLEAN" != "y" ]
then
  exec sudo env -i PATH="$HARDPATH" ROOTCLEAN=y bash --norc --noprofile "$0" "$@"
fi

which debootstrap || apt-get -y install debootstrap
[ -f /usr/share/keyrings/debian-archive-keyring.gpg ] || apt-get -y install debian-archive-keyring

BUILDDIR=/tmp/build-debian-lfs-host
mkdir -p "$BUILDDIR"
while mountpoint -q "$BUILDDIR"
do
  umount "$BUILDDIR"/root/{dev/pts,dev,proc} "$BUILDDIR" || sleep 1
done
mount -t tmpfs none "$BUILDDIR"
cd "$BUILDDIR"

function f()
{
  ARCH="$1"
  SUITE="$2"
  WITHSOURCE="$3"
  debootstrap --arch="$ARCH" "$SUITE" root http://ftp.us.debian.org/debian
  mount --bind /proc ./root/proc
  mount --bind /dev ./root/dev
  mount --bind /dev/pts ./root/dev/pts
  function g()
  {
    env -i PATH="$HARDPATH" chroot ./root bash --norc --noprofile -c "$1"
  }
  g '
export DEBIAN_FRONTEND=noninteractive
export LANG=C
apt-get -y install locales
echo en_US.UTF-8 UTF-8 >/etc/locale.gen
locale-gen
export LANG=en_US.UTF-8
cat >/etc/apt/sources.list <<EOF
deb     http://ftp.us.debian.org/debian '"$SUITE"' main
deb-src http://ftp.us.debian.org/debian '"$SUITE"' main
EOF
apt-get update
apt-get -y install build-essential bison gawk m4 texinfo file
'
  if [ "$WITHSOURCE" == "y" ]
  then
    g '
mkdir /deb-src
cd /deb-src
dpkg -l | sed -e "s/[ \t]\+/ /g" | egrep "^ii[ ]" | cut -d " " -f 2 | xargs apt-get --download-only -y source
'
  fi
  umount ./root/dev/pts ./root/dev ./root/proc
  FN=./debian-lfs-host-"$SUITE"-"$ARCH"-"$STAMP"
  if [ "$WITHSOURCE" == "y" ]
  then
    FN="$FN""-with-sources"
  fi
  tar -zf ./"$FN".tar.gz -C ./root -c .
}

STAMP="`date +%s`"

for w in n y
do
  for a in amd64 i386
  do
    f "$a" jessie "$w"
  done
done
