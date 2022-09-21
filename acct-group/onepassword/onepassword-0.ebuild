# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-group

DESCRIPTION="Group for app-admin/1password"
# NOTE: acct-group.eclass states overlays should set this to -1 hower 1password refuses
# NOTE: to work with group IDs less than 1000.
# NOTE: ID derived via following Python: int(b"onepassword".hex(), 16) % 32768:
ACCT_GROUP_ID="29284"
