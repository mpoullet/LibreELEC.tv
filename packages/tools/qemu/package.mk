# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="qemu"
PKG_VERSION="7.1.0"
PKG_SHA256="a0634e536bded57cf38ec8a751adb124b89c776fe0846f21ab6c6728f1cbbbe6"
PKG_LICENSE="GPL"
PKG_SITE="https://www.qemu.org"
PKG_URL="https://download.qemu.org/qemu-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_HOST="toolchain:host glib:host pixman:host Python3:host zlib:host"
PKG_LONGDESC="QEMU is a generic and open source machine emulator and virtualizer."
PKG_TOOLCHAIN="configure"

pre_configure_host() {
  HOST_CONFIGURE_OPTS="\
    --bindir=${TOOLCHAIN}/bin \
    --extra-cflags=-I${TOOLCHAIN}/include \
    --extra-ldflags=-L${TOOLCHAIN}/lib \
    --libexecdir=${TOOLCHAIN}/lib \
    --localstatedir=${TOOLCHAIN}/var \
    --prefix=${TOOLCHAIN} \
    --sbindir=${TOOLCHAIN}/sbin \
    --sysconfdir=${TOOLCHAIN}/etc \
    --enable-tools \
    --enable-malloc=system \
    --disable-attr \
    --disable-auth-pam \
    --disable-blobs \
    --disable-capstone \
    --disable-curl \
    --disable-debug-info \
    --disable-debug-mutex \
    --disable-debug-tcg \
    --disable-docs \
    --disable-gcrypt \
    --disable-gnutls \
    --disable-system \
    --disable-user \
    --disable-vnc \
    --disable-werror \
    --disable-xkbcommon \
    --disable-zstd"
}

makeinstall_host() {
  mkdir -p ${TOOLCHAIN}/bin
    cp ${PKG_BUILD}/.${HOST_NAME}/qemu-img ${TOOLCHAIN}/bin
}
