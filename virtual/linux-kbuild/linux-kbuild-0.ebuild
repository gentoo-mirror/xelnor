# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Virtual for Linux prebuilt kernel"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	|| (
		sys-kernel/xelnet-kbuild
	)"
