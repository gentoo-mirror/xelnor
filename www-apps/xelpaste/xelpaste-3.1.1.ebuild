# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 python3_5 python3_6 )

inherit distutils-r1

DESCRIPTION="Django-based pastebin with image support."
HOMEPAGE="https://github.com/rbarrois/xelpaste"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-python/django-2.0[${PYTHON_USEDEP}]
	>=dev-python/getconf-1.3.0[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	>=dev-python/django-appconf-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/django-sendfile-0.3.9[${PYTHON_USEDEP}]
	>=dev-python/django-mptt-0.9.1[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	net-libs/nodejs"

python_prepare_all() {
	emake update-js
	emake build
	distutils-r1_python_prepare_all
}

src_install() {
	distutils-r1_src_install

	insinto /etc/xelpaste
	newins "${FILESDIR}/xelpaste.ini" 00_base.ini

	insinto /etc/cron.daily
	newins "${FILESDIR}/xelpaste.cron.daily" xelpaste_cleanup

	dodir /var/lib/xelpaste
	dodir /var/tmp/xelpaste
}
