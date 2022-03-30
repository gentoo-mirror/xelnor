# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="Binary Package system account"
ACCT_USER_ID=1100
ACCT_USER_ENFORCE_ID=1
ACCT_USER_HOME=/data/binpkg
ACCT_USER_HOME_OWNER=binpkg:binpkg
ACCT_USER_HOME_PERMS=0755
ACCT_USER_SHELL=/bin/bash
ACCT_USER_GROUPS=( binpkg )

acct-user_add_deps
