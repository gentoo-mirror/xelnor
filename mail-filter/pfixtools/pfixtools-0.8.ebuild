inherit eutils

DESCRIPTION="Tools for postfix"
HOMEPAGE="http://pfixtools.mymind.fr"
SRC_URI="http://pfixtools.org/trac/raw-attachment/wiki/Download/${P}.tar.gz"

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
	unpack ${A}
	cd "${PN}"
	epatch "${FILESDIR}/${PF}.install-doc.patch"
}

src_compile() {
	cd "${PN}"
	emake DESTDIR="${D}" prefix=/usr all || die
	if use doc
	then
		emake DESTDIR="${D}" prefix=/usr doc || die
	fi
}

src_install() {
	cd "${PN}"
	emake -j1 DESTDIR="${D}" prefix=/usr install || die
	if use doc
	then
		emake DESTDIR="${D}" prefix=/usr install-doc || die
	fi
	newinitd "${FILESDIR}"/postlicyd-initd postlicyd
	dodir /var/run/postlicyd
	dodir /var/spool/postlicyd
}
