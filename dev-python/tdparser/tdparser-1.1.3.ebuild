# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python2_6 python2_7 python3_1 python3_2 python3_3)

inherit distutils-r1

DESCRIPTION="A top-down parser for Python"
HOMEPAGE="http://github.com/rbarrois/tdparser
http://pypi.python.org/pypi/tdparser"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND=""

python_compile_all() {
	if use doc; then
		einfo "Generation of documentation"
		emake -C doc html
	fi
}

python_test() {
	"${PYTHON}" setup.py test || die
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/_build/html/* )

	distutils-r1_python_install_all
}
