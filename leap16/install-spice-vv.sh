#!/bin/bash
# installs virt-viewer/remote-viewer with restored SPICE support on LEAP 16.0 from Henryk's repo
# see https://forums.opensuse.org/t/leap-16-0-workaround-for-unsupported-graphic-type-spice/193895/8
# see https://build.opensuse.org/project/show/home:hpaluch-pil:test
set -xeuo pipefail
( source /etc/os-release && sudo zypper ar -f obs://home:hpaluch-pil:test/$VERSION_ID hp-test )
sudo zypper in --oldpackage hp-test:virt-viewer
exit 0
