# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="A top-down parser for Python"
HOMEPAGE="http://github.com/rbarrois/tdparser
http://pypi.python.org/pypi/tdparser"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"
RDEPEND=""

python_compile_all() {
	distutils-r1_python_compile

	if use doc; then
		einfo "Generation of documentation"
		emake -C doc html
	fi
}

python_test() {
	"${PYTHON}" setup.py test
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/_build/html/. )

	distutils-r1_python_install_all
}
