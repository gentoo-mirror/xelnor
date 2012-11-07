EAPI=4

inherit eutils vcs-snapshot

DESCRIPTION="Tools for postfix"
HOMEPAGE="http://pfixtools.mymind.fr"
SRC_URI="https://github.com/Fruneau/${PN}/archive/${P}.tar.gz
https://github.com/Fruneau/libcommon/archive/b07e6bdea3d24748e0d39783d7d817096d10cc67.tar.gz -> ${P}-libcommon.tar.gz"

LICENSE="|| ( BSD )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"
DEPEND="mail-filter/libsrs2
        dev-libs/libev
		net-dns/unbound
		dev-db/tokyocabinet
		dev-util/gperf
		doc? ( app-text/xmlto app-text/asciidoc )"

src_unpack() {
	vcs-snapshot_src_unpack
	rmdir "${P}/common"
	ln -s "../${P}-libcommon" "${P}/common"
	cd "${P}"
	epatch "${FILESDIR}/${PF}.install-doc.patch"
}

src_compile() {
	cd "${P}"
	emake DESTDIR="${D}" prefix=/usr all || die
	if use doc
	then
		emake DESTDIR="${D}" prefix=/usr doc || die
	fi
}

src_install() {
	cd "${P}"
	emake -j1 DESTDIR="${D}" prefix=/usr install || die
	if use doc
	then
		emake DESTDIR="${D}" prefix=/usr install-doc || die
	fi
	newinitd "${FILESDIR}"/postlicyd-initd postlicyd
	dodir /var/run/postlicyd
	dodir /var/spool/postlicyd
}
