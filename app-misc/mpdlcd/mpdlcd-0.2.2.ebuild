# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Display MPD status on a lcdproc server"
HOMEPAGE="https://github.com/rbarrois/mpdlcd"
SRC_URI="mirror://pypi/m/mpdlcd/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/lcdproc
dev-python/python-mpd"
DEPEND="${RDEPEND}
dev-python/setuptools"

PYTHON_MODNAME="mpdlcd"
DOCS="README"

src_install() {
	distutils_src_install

	doinitd initd/mpdlcdd

	insinto /etc
	doins mpdlcd.conf
}
