About
=====

This project was created to allow to test programs on different architectures.
Project generates image that the only purpose is to run buildboot-slave to
accept remote job requests. Native toolchain and buildbot-worker configuration
is provided externally via opkg. It is meant to run in **qemu**

Usage
=====

Create config for desired architecture with ./create-config.sh and then simply
make it.

~~~
$ ./create-config.sh
usage: ./create-config.sh <config_number> <host>

host is friendly pc name where images will be hosted in qemu.
hostname of generated images will be {arch}-{host}-{linux}-{libc}

Supported configs are:
        0) aarch64-builder-linux-gnu
        1) armv5te926-builder-linux-gnueabihf
        2) armv6j1136-builder-linux-gnueabihf
        3) armv7a15-builder-linux-gnueabihf
        4) armv7a9-builder-linux-gnueabihf
        5) i686-builder-linux-gnu
        6) i686-builder-linux-musl
        7) i686-builder-linux-uclibc
        8) mips-builder-linux-gnu
        9) nios2-builder-linux-gnu
        10) x86_64-builder-linux-gnu
        11) x86_64-builder-linux-musl
        12) x86_64-builder-linux-uclibc
$ ./create-config.sh 1 kurwik
#
# configuration written to /home/mlyszczek/projekty/bofc/builder-br/.config
#
$ make
~~~

Output directory for files is standard *output/images*

toolchain
---------

You need proper toolchain to build each images. Toolchains can be build with
[builder-tc](http://git.kurwinet.pl/builder-tc) project.

What image does at startup
==========================

1. configures network using 4 last octets of MAC as IP
2. start sshd server
3. run update-system.sh script, that checks for new version of native-toolchain
   and buildbot-slaves configuration. It is simple script that read packages
   names from /etc/packages and executes opkg install on every package.
4. run buildbot-slaves

Files of interests
==================

* overlay/etc/opkg/opkg.conf

  to change url for opkg (for downloading buildbot-slaves and native-toolchains)

* overlay/etc/resolv.conf

  set nameserver

* overlay/root/.ssh/authorized_keys

  you can set here your public key to be able to log in into machine without
  password

Rest of files should not make much of a difference

Connected projects
==================

* [builder-tc](http://git.kurwinet.pl/builder-tc/)

  Toolchain collection both cross (to build image for qemu) and native (to build
  software natively inside qemu image)

* [builder-init](http://git.kurwinet.pl/builder-init/)

  init scripts to run qemu images

* [builder-slaves](http://git.kurwinet.pl/builder-slaves/)

  generator of buildbot-slaves to be run in qemu images

Used software
=============

* [buildbot](https://github.com/buildbot/buildbot)

  used to run CI tests on qemu machines

* [buildroot](https://buildroot.org/)

  creation of qemu images is based on this awestome tool
