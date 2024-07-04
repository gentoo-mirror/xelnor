# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="Display MPD status on a lcdproc server"
HOMEPAGE="http://pypi.python.org/pypi/mpdlcd"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/python-mpd2[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS="README.rst"

src_install() {
	distutils-r1_src_install

	newinitd initd/${PN}.gentoo ${PN}

	doman man/*

	insinto /etc
	doins ${PN}.conf
}
