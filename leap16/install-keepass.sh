#!/bin/bash
# installs KeePass on LEAP 16.0 from Henryk's repo
# see https://build.opensuse.org/project/show/home:hpaluch-pil:keepass
# see https://code.opensuse.org/leap/features/issue/318
set -xeuo pipefail
( source /etc/os-release && sudo zypper ar -f obs://home:hpaluch-pil:keepass/$VERSION_ID hp-keepass )
sudo zypper in hp-keepass:keepass
exit 0
