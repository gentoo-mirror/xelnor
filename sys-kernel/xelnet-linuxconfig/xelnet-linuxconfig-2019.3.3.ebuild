# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Xelnet Linux configuration"
HOMEPAGE="https://git.xelnor.net/?p=xelnet-linuxconfig.git"
SRC_URI="https://git.xelnor.net/?p=xelnet-linuxconfig.git;a=snapshot;h=v${PV};sf=tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dev laptop multimedia"

KSOURCE_FLAVOR="gentoo"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-kernel/${KSOURCE_FLAVOR}-sources
dev-lang/python
dev-util/kconfgen"

src_unpack() {
	default
	mv "${WORKDIR}/${PN}-v${PV}"-* "${S}"
}

src_configure() {
	econf \
		$(use_enable dev) \
		$(use_enable laptop) \
		$(use_enable multimedia)
}
