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
  umount "$BUILDDIR"/root-{i386,x86_64}/{dev/pts,dev,proc} "$BUILDDIR" || sleep 1
done
mount -t tmpfs none "$BUILDDIR"
cd "$BUILDDIR"

function farch()
{
  ARCH="$1"
  debootstrap jessie root-"$ARCH" http://ftp.us.debian.org/debian
  mount --bind /proc ./root-"$ARCH"/proc
  mount --bind /dev ./root-"$ARCH"/dev
  mount --bind /dev/pts ./root-"$ARCH"/dev/pts
  env -i PATH="$HARDPATH" chroot ./root-"$ARCH" bash --norc --noprofile -c '
export DEBIAN_FRONTEND=noninteractive
export LANG=C
apt-get -y install locales
echo en_US.UTF-8 UTF-8 >/etc/locale.gen
locale-gen
export LANG=en_US.UTF-8
apt-get -y install build-essential bison gawk m4 texinfo
'
  umount ./root-"$ARCH"/dev/pts ./root-"$ARCH"/dev ./root-"$ARCH"/proc
  tar -zf ./debian-lfs-host-"$ARCH"-`date +%s`.tar.gz -C ./root-"$ARCH" -c .
}

for i in i386 x86_64
do
  farch "$i"
done
