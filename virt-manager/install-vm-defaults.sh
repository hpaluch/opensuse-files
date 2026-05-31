#!/bin/bash
# install my defaults for virt-manager:
# 1. disable scaling
# 2. enable auto resize
set -euo pipefail

cd `dirname $0`
errx () { echo "ERROR: $*" >&2; exit 1; }

d=/usr/share/glib-2.0/schemas
[ -d "$d" ] || errx "No directory '$d'"

xml=$d/org.virt-manager.virt-manager.gschema.xml
[ -f "$xml" ] || errx "Schema file '$xml' does not exists - is virt-manager installed?"

o=90_virt-manager.gschema.override
t="$d/$o"
should_copy=0
if [ -f "$t" ]; then
	diff "$t" "$o" || {
		echo -n "Target file '$t' is different from '$o' - overwrite [y/N]? "
		read ans
		case "$ans" in
			[yY]|[yY][eE][sS]) should_copy=1 ;;
			*) errx "Overwrite canceled by user" ;;
		esac
	}
else
	should_copy=1
fi

[ "$should_copy" -eq 0 ] || {
	set -x
	sudo cp -v $o $t
	sudo glib-compile-schemas /usr/share/glib-2.0/schemas
	set +x
	echo "OK: Override installed and compiled"
	exit 0
}
echo "OK: Already installed - nothing to do."
exit 0


