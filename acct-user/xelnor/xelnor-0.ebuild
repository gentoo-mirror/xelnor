# Copyright 2020 Raphaël Barrois
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="Xelnor user account"
ACCT_USER_ID=1000
ACCT_USER_ENFORCE_ID=1
ACCT_USER_SHELL=/bin/zsh
ACCT_USER_HOME=/home/xelnor
ACCT_USER_HOME_OWNER=xelnor:xelnet
ACCT_USER_HOME_PERMS=0770
ACCT_USER_GROUPS=( xelnet wheel portage audio video cdrom cdrw usb scanner wireshark tcpdump docker vboxusers )

RDEPEND="app-shells/zsh"

acct-user_add_deps
