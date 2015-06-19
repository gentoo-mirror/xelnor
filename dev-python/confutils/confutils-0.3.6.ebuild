# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python2_6 python2_7 python3_1 python3_2)

inherit distutils-r1

DESCRIPTION="Advanced config file utilities"
HOMEPAGE="http://github.com/rbarrois/confutils
http://pypi.python.org/pypi/confutils"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/setuptools"
RDEPEND=""

python_test() {
	"${PYTHON}" setup.py test || die
}
