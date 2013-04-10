# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python2_7 python3_2)

inherit distutils-r1

MY_PV="2.0alpha2"
S="${WORKDIR}/${PN}-${MY_PV}"

DESCRIPTION="A Python XMPP (RFC 3920,3921) and Jabber implementation"
HOMEPAGE="https://github.com/Jajcus/pyxmpp2"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/setuptools
    dev-python/dnspython"
DEPEND="${RDEPEND}"
