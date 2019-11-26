# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Prepared kernel sources, suitable for out-of-tree modules"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+linux-handbuild"

DEPEND="!linux-handbuild? ( sys-kernel/xelnet-kbuild )"
