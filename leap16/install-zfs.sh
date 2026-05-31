#!/bin/bash
# installs official ZFS packages on LEAP 16
# see https://software.opensuse.org/download.html?project=filesystems&package=zfs
set -xeuo pipefail
( source /etc/os-release && 
	sudo zypper addrepo https://download.opensuse.org/repositories/filesystems/$VERSION_ID/filesystems.repo)
sudo zypper in zfs
exit 0
