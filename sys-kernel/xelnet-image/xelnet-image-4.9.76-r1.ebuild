# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Compiled linux kernel"
HOMEPAGE="https://git.xelnor.net/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0/${PVR}"
KEYWORDS="~amd64"
IUSE=""

KSOURCE_FLAVOR="gentoo"
KV_DIR="/usr/src/linux-${PV}-${KSOURCE_FLAVOR}${PVR#${PV}}"
KBUILD_OUTPUT="/usr/src/kbuild/linux-${PVR}-${KSOURCE_FLAVOR}"

DEPEND="sys-kernel/xelnet-kbuild:0/${PVR}
=sys-kernel/${KSOURCE_FLAVOR}-sources-${PVR}
sys-apps/debianutils"
RDEPEND=""

inherit toolchain-funcs

# TODO: handle cross-compilation
KARCH=$(tc-arch-kernel)

src_unpack() {
	echo "Injecting ${KBUILD_OUTPUT} to ${S}"
	cp --archive "${KBUILD_OUTPUT}" "${S}"
}

src_compile() {
	# Recompile the modules; somehow, required intermediate files are lost
	# by the xelnet-kbuild cleanup.
	emake -C "${KV_DIR}" O="${S}" ARCH="${KARCH}" modules
}

src_install() {
	mkdir -p "${D}/boot"
	emake -C "${KV_DIR}" O="${S}" ARCH="${KARCH}" INSTALL_MOD_PATH="${D}" INSTALL_PATH="${D}/boot" modules_install install
}
