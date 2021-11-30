# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Notera Font -- Handwritten"
HOMEPAGE="https://www.mansgreback.com/font?name=notera"
SRC_URI="https://get.fontspace.co/download/family/g7m19/f83cbac6a60e4773b89d475268e05dd6/${PN}.zip"
DOWNLOAD_URI="https://www.fontspace.com/notera-font-f19141"

LICENSE="MansGreback-PUA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#RESTRICT="fetch"

FONT_SUFFIX="ttf"
FONT_CONF=( "${FILESDIR}/66-${PN}.conf" )

#pkg_nofetch() {
#	einfo "Please download the ${SRC_URI} from"
#	einfo "${DOWNLOAD_URL}"
#	einfo "and place it in ${DISTDIR}"
#}

src_unpack() {
	default
	mkdir "${WORKDIR}/${P}"
	mv info.txt *.ttf "${WORKDIR}/${P}"
}

src_prepare() {
	for f in Notera*.ttf; do
		variety=$(echo "$f" | sed -r 's/Notera2?PersonalUseOnly(\w*)-\w+.ttf/\1/')
		mv "$f" "Notera${variety}.ttf"
	done
	default
}
