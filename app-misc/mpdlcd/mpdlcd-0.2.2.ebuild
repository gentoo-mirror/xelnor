# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Display MPD status on a lcdproc server"
HOMEPAGE="https://github.com/rbarrois/mpdlcd"
SRC_URI="http://pypi.python.org/packages/source/m/mpdlcd/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/python-mpd dev-python/lcdproc"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="mpdlcd"
DOCS="README"

src_install() {
	distutils_src_install

	doinitd initd/mpdlcdd

	insinto /etc
	doins mpdlcd.conf
}
