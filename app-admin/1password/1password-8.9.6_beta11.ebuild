# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CHROMIUM_LANGS="am ar bg bn ca cs da de el en-GB es es-419 et fa fi fil fr gu he
	hi hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr
	sv sw ta te th tr uk vi zh-CN zh-TW"

inherit chromium-2 desktop pax-utils verify-sig xdg

MY_P="${P/_beta/-}.BETA"

DESCRIPTION="1Password - Password Manager and Secure Wallet"
HOMEPAGE="https://1password.com"
SRC_URI="
	amd64? (
		https://downloads.1password.com/linux/tar/beta/x86_64/${MY_P}.x64.tar.gz
		https://downloads.1password.com/linux/tar/beta/x86_64/${MY_P}.x64.tar.gz.sig
	)
	arm64? (
		https://downloads.1password.com/linux/tar/beta/aarch64/${MY_P}.arm64.tar.gz
		https://downloads.1password.com/linux/tar/beta/aarch64/${MY_P}.arm64.tar.gz.sig
	)
"
S="${WORKDIR}"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"
RESTRICT="bindist mirror splitdebug test"
IUSE="appindicator policykit wayland"
CONFIG_PROTECT="/etc/${PN} /usr/share/polkit-1/actions"

DEPEND="acct-group/onepassword"

BDEPEND="
	${DEPEND}
	verify-sig? ( sec-keys/openpgp-keys-1password )
"

VERIFY_SIG_OPENPGP_KEY_PATH=${BROOT}/usr/share/openpgp-keys/1password.com.asc

# NOTE: These dependencies are based on dependencies listed in the Debian package.
RDEPEND="
	${DEPEND}

	appindicator? ( dev-libs/libappindicator )
	policykit? ( sys-auth/polkit )

	app-accessibility/at-spi2-atk:2
	app-accessibility/at-spi2-core:2
	app-crypt/gnupg
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/mesa
	net-misc/curl
	virtual/libudev
	x11-libs/libdrm
	x11-libs/libnotify
	x11-libs/libxcb
	x11-libs/libxshmfence
	x11-libs/gtk+:3
	x11-themes/hicolor-icon-theme
"

QA_PREBUILT="*"

MY_PKG_HELPER="1Password-KeyringHelper"
MY_PKG_BROWSER_SUPPORT="1Password-BrowserSupport"

pkg_setup() {
	if use amd64; then
		MY_P="${MY_P}.x64"
	elif use arm64; then
		MY_P="${MY_P}.arm64"
	else
		die "${PN} only supports amd64 and arm64"
	fi
}

src_prepare() {
	default

	pushd ${WORKDIR}/${MY_P} > /dev/null || die

	rm ./LICENSE.electron.txt ./LICENSES.chromium.html || die
	rm ./after-install.sh ./after-remove.sh || die
	rm ./install_biometrics_policy.sh || die

	pushd ./locales > /dev/null || die
	chromium_remove_language_paks
	popd > /dev/null || die

	sed -i "s/\(Exec=.*\)1Password\(.*\)/\1${PN}\2/g" ./resources/${PN}.desktop || die

	if use policykit; then
		# NOTE: is there a better way to do this?
		# Fill in policy kit file with a list of (the first 10) human users of the system.
		local policy_owners="$(cut -d: -f1,3 /etc/passwd | grep -E ':[0-9]{4}$' | cut -d: -f1 | head -n 10 | sed 's/^/unix-user:/' | tr '\n' ' ')"
		sed -i "s/\${POLICY_OWNERS}/${policy_owners}/g" ./com.${PN}.1Password.policy.tpl || die
	fi

	if use wayland; then
		cp ./resources/${PN}.desktop ./resources/${PN}-wayland.desktop || die
		sed -i 's/Name=.*/\0 Wayland/g' ./resources/${PN}-wayland.desktop || die
		sed -i 's/Exec=.*/\0 --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto/g' ./resources/${PN}-wayland.desktop || die
	fi

	popd > /dev/null || die
}

src_install() {
	pushd ${WORKDIR}/${MY_P} > /dev/null || die

	if use policykit; then
		insinto /usr/share/polkit-1/actions
		newins ./com.${PN}.1Password.policy.tpl com.${PN}.1Password.policy
	fi
	rm ./com.${PN}.1Password.policy.tpl || die

	insinto /etc/${PN}
	doins ./resources/custom_allowed_browsers
	rm ./resources/custom_allowed_browsers || die

	domenu ./resources/${PN}.desktop
	rm ./resources/${PN}.desktop || die

	if use wayland; then
		domenu ./resources/${PN}-wayland.desktop || die
		rm ./resources/${PN}-wayland.desktop || die
	fi

	local size
	for size in 32 64 256 512 ; do
		doicon -s ${size} ./resources/icons/hicolor/${size}x${size}/apps/${PN}.png
	done
	unset size
	rm -r ./resources/icons || die

	insinto "/opt/${PN}"
	doins -r *

	pax-mark m ${PN}
	fperms +x /opt/${PN}/${PN}
	fperms +x /opt/${PN}/chrome_crashpad_handler
	fowners 0:onepassword /opt/${PN}/${MY_PKG_HELPER}
	fowners 0:onepassword /opt/${PN}/${MY_PKG_BROWSER_SUPPORT}
	dosym "../../opt/${PN}/${PN}" "usr/bin/${PN}"

	popd > /dev/null || die
}

pkg_postinst() {
	xdg_pkg_postinst

	# NOTE: Why do the permissions change for these when using fperms in src_install?
	chmod 4755 ${EROOT}/opt/${PN}/chrome-sandbox
	# The binary requires setuid so it may interact with the Kernel keyring facilities
	chmod 6755 ${EROOT}/opt/${PN}/${MY_PKG_HELPER}
	chmod 2755 ${EROOT}/opt/${PN}/${MY_PKG_BROWSER_SUPPORT}

	elog "Browser integration can be controlled via /etc/${PN}/custom_allowed_browsers."
	elog "A commented example file has been installed."
	elog

	if ! use policykit; then
		ewarn 'Installed with USE="-policykit"!'
		ewarn 'System / biometric authentication may not be available.'
		ewarn 'Reinstall with USE="+policykit" to install policykit authentication profile.'
	else
		elog "${PN} policykit file installed to /usr/share/polkit-1/actions/."
		elog "This file is configured with the first ten human users of the system."
		elog "If additional users are needed this file will need to be modified."
	fi
}
