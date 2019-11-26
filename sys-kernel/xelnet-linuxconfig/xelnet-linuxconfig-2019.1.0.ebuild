# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Xelnet Linux configuration"
HOMEPAGE="https://git.xelnor.net/?p=xelnet-linuxconfig.git"
SRC_URI="https://git.xelnor.net/?p=xelnet-linuxconfig.git;a=snapshot;h=v${PV};sf=tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

KSOURCE_FLAVOR="gentoo"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-kernel/${KSOURCE_FLAVOR}-sources
sys-kernel/kconfgen"

src_compile() {
	kconfgen assemble \
		--root="${S}" \
		--output=defconfig \
		--kernel-source=/usr/src/linux \
		anoth
}

src_install() {
	dodir "/usr/src/linux-config"
	insinto "/usr/src/linux-config"
	newins "${S}/defconfig" defconfig
}
