# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python2_6 python2_7)

inherit distutils-r1

DESCRIPTION="An efficient configuration file manager"
HOMEPAGE="http://uconf.xelnor.net/ http://pypi.python.org/pypi/uconf"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
	dev-python/tdparser
	>=dev-python/fs-0.4.0
	>=dev-python/confutils-0.3.2"
