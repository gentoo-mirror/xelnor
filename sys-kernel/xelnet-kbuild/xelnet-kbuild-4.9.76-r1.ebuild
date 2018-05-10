# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Compiled kernel object tree"
HOMEPAGE="https://git.xelnor.net/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0/${PVR}"
KEYWORDS="~amd64"
IUSE=""

KSOURCE_FLAVOR="gentoo"
KV_DIR="/usr/src/linux-${PV}-${KSOURCE_FLAVOR}${PVR#${PV}}"
KBUILD_OUTPUT="/usr/src/kbuild/linux-${PVR}-${KSOURCE_FLAVOR}"

# foo-kbuild depends on foo-sources
DEPEND="sys-kernel/${KSOURCE_FLAVOR}-sources:${PVR}
app-arch/cpio"
RDEPEND=""

inherit toolchain-funcs

# This ebuild install some temporary build code;
# Don't warn on W/X sections in binaries, don't remove debug symbols
RESTRICT="binchecks strip"

# TODO: handle cross-compilation
KARCH=$(tc-arch-kernel)


src_unpack() {
    mkdir -p "${S}"
    cp "${FILESDIR}/${PV}.config" "${S}/.config"
}

src_configure() {
    # TODO: Build .config from jinja
    emake -j1 -C "${KV_DIR}" O="${S}" ARCH="${KARCH}" olddefconfig
}

src_compile() {
    emake -C "${KV_DIR}" O="${S}" ARCH="${KARCH}" modules_prepare bzImage
}

src_install() {
    dodir "${KBUILD_OUTPUT}"
    cd "${S}"
    # Export a stripped-down version of the kernel build tree.
    # - Neat find trick: files matches without a "print" action won't be displayed
    # - Use cpio to copy the selected filenames to the target (we could also use
    #   find -exec install.sh)
    find . \
        -name '*.o' \
        -o -name '*.cmd' \
        -o -name '.tmp*' \
        -o -path '*/.tmp*' \
        -o -type f -print0 \
        -o -type l -print0 \
    | \
    cpio \
        --pass-through --null \
        --make-directories --preserve-modification-time \
        --verbose \
        "${D}/${KBUILD_OUTPUT}"
}
