#!/bin/sh

echo ">>> Calling egencache"
egencache --repo xelnor --update

echo ">>> Calling repoman"
repoman manifest && repoman full
