# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

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

DEPEND=""
# foo-kbuild depends on foo-sources
BDEPEND="sys-kernel/${KSOURCE_FLAVOR}-sources:${PVR}
sys-kernel/xelnet-linuxconfig:0/0
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
	cp /usr/src/linux-config/defconfig "${S}/.config"
}

src_configure() {
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

pkg_postinst() {
	# Remove the symkink
	if [[ -h "${EROOT}/usr/src/kbuild/linux" ]]; then
		rm "${EROOT}/usr/src/kbuild/linux" || die
	fi
	if [[ ! -h "${EROOT}/usr/src/kbuild/linux" ]]; then
		ln -sf linux-${PVR}-${KSOURCE_FLAVOR} "${EROOT}/usr/src/kbuild/linux";
	fi
}
