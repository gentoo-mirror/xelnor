# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..11} )
inherit python-any-r1

DESCRIPTION="Send messages to all users on a system, both graphical and tty-based."
HOMEPAGE="https://git.xelnor.net/?p=syswide-notify.git"
SRC_URI="https://dist.xelnor.net/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="${PYTHON_DEPS}"
DEPEND=""
RDEPEND="x11-libs/libnotify"
