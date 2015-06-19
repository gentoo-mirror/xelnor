# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3,3_4} pypy{1_9,2_0} )

inherit distutils-r1

DESCRIPTION="Python Env Wrapper is a pure python wrapper around virtualenv"
HOMEPAGE="https://crate.io/packages/pew/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/virtualenv
	dev-python/virtualenv-clone"
DEPEND="${RDEPEND}
	dev-python/setuptools"
