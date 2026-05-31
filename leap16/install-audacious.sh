#!/bin/bash
# installs Audacious on LEAP 16.0 from Henryk's repo
# see https://build.opensuse.org/project/show/home:hpaluch-pil:audio
# see https://code.opensuse.org/leap/features/issue/317
set -xeuo pipefail
( source /etc/os-release && sudo zypper ar -f obs://home:hpaluch-pil:audio/$VERSION_ID hp-audio )
sudo zypper in hp-audio:audacious
exit 0
