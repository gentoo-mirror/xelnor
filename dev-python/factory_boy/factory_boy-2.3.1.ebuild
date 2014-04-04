# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python2_6 python2_7 python3_3)

inherit distutils-r1

DESCRIPTION="A versatile test fixtures replacement"
HOMEPAGE="http://pypi.python.org/pypi/factory_boy/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND=""
DEPEND="doc? ( dev-python/sphinx )"

src_compile() {
	distutils-r1_src_compile

	if use doc; then
		einfo "Generation of documentation"
		emake -C docs html
	fi
}

src_install() {
	distutils-r1_src_install

	if use doc; then
		dohtml -r -A txt docs/_build/html/*
	fi
}

python_test() {
	esetup.py test
}
