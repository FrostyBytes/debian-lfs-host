# debian-lfs-host

The `debian-lfs-host.sh` script itself is released under "The
Unlicense". Note however that the generated filesystems contain free
software programs that are licensed under their own respective
licenses that may be less permissive than "The Unlicense".

The filesystems released are signed with the below key, which has also
been submitted to the `pgp.mit.edu` keyserver. Each binary file has a
corresponding signature file, and checksums have also been included in
a clearsigned message below.

Status:

Version `v002`: Tested up to LFS step gcc pass 2. Binaries available
here:
<https://github.com/FrostyBytes/debian-lfs-host/releases/tag/v001>. The
`-with-sources` archives contain package sources as well for improved
license compliance.

Version `v001`: The assembled filesystems pass the LFS "Host System
Requirements", but it has not been tested whether they are sufficient
for building LFS. The `v001` binaries have been removed as it was
realized that is technically in volation of GPL to distribute without
sources, even if the sources are widely available elsewhere.

```
205D9A3C
```

```
Key fingerprint = 3119 A3C6 DF9E 8C74 E324  EBCF BF52 ACDB 205D 9A3C
```

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

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
dsFbl2KIdNFI15PMeWA3tQdVnQwgk4WEYgg=
=VwlJ
-----END PGP PUBLIC KEY BLOCK-----
```

`v002`:

```
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

sha256sums:
bf6a681730acddc8545c60dd5888bfdc6402bc55cc33131b0f540c8503c062eb  debian-lfs-host-jessie-amd64-1479677148.tar.gz
e74f5f8d8a1a29fe6663ea8048fcb29d565ff8979986f8e4ac836cc8f6701b21  debian-lfs-host-jessie-amd64-1479677148-with-sources.tar.gz
e0669a17dab613c6afd79ce8b73e87557cc8c6e0ca71be920cb958fdbd81231b  debian-lfs-host-jessie-i386-1479677148.tar.gz
fcc237d317cd3aa410ef00f59a586c62a95b457206d43f8b0b82d9eda29d6ac9  debian-lfs-host-jessie-i386-1479677148-with-sources.tar.gz
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYMijTAAoJEL9SrNsgXZo8j10P/jCo3fXBgSN3Tc+4CtWPUEV6
4Zk2HavJjurJIg/L5tAeeil7pHaEGfyNzaWjie9vINzukil8yjcYSCkhCMV8ckBP
7pAUrDGE5wjdsZcU1SDVqwu6hzB3pWP6hi2bHL2FmKBbzAYu9Y8hLnbyPdqmlioe
+MGPhrxaDyWI5FWmyOY3OyaG3CSqkIIQY1DcHjNY8KJmYLc7vUD17FJr2dBFvTrM
zOHtwbzl0HI43/w/kQ94YOi9bxFxowb/Wwh5Jh2PR9vHiGqHEHmJCBPGSL+Er0um
xI2Yix8hY0yFzlez5YibwWC7bLZIkg/GkeMnnyKTn2nZWUdLMsc8Xn61ByyO0sPV
bjXt0VO/j/KU9mgmzgXIPn/RsdfDjwMMYBe3OYFukT/8KHziZdhqB8MpAmgc1m3l
W9ikoBXMNZNB+VmAezGwdFgEt0kul0HJO5tdBNDbt8jF7+r+z/D+OG/yrDZcXnXO
uvJBEz+Tzwnx+1R3PjhONXAE+4rhwCHwcHk+nPGoGMveFTtrXJJuaMpAkOyOf03z
LaxF8GvbAOaZyEzC0Ayk6JNLy36z4fqaJh7beXZgx+6/apN/DjIdY3jItXlntF/7
NXY4hffvgC78N7liG+DjiFDNCxU1tNr7aMbfFOiPf1uk2T9NbcEEXv6/n11RwM1N
zdv8fhYSbrLr9blkttYw
=ky1P
-----END PGP SIGNATURE-----
```
