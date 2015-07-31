# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Bitlbee plugin for facebook"
HOMEPAGE="https://github.com/jgeboski/bitlbee-facebook"
SRC_URI=""
EGIT_REPO_URI="https://github.com/jgeboski/${PN}.git"
inherit autotools git-r3

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=net-im/bitlbee-3.2.1[plugins]
	${DEPEND}"
DEPEND="${RDEPEND}
	dev-libs/glib:2"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --enable-minimal-flags
}

src_install() {
	default
	prune_libtool_files
}
