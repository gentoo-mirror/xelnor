# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Display MPD status on a lcdproc server"
HOMEPAGE="http://pypi.python.org/pypi/mpdlcd"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/lcdproc[${PYTHON_USEDEP}]
	dev-python/python-mpd[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS="README"

src_install() {
	distutils_src_install

	doinitd initd/${PN}

	doman man/*

	insinto /etc
	doins ${PN}.conf
}
