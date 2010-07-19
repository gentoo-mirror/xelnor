# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

NEED_PYTHON="2.6"

DESCRIPTION="a simple tool for managing config files"
HOMEPAGE="http://confmgr.xelnor.net/"
SRC_URI="http://confmgr.xelnor.net/downloads/${P}.tar.gz"

LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/python-2.6"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="confmgr"
