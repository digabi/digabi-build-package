#!/bin/sh
set -e

#
# Build Debian package(s) (.deb) in Vagrant environment
#

SOURCE="$1"
if [ -z "${SOURCE}" ]
then
    echo "E: No source specified!"
    echo "usage: $0 <source>"
    exit 1
fi

cleanup() {
    vagrant destroy -f
}

vinit() {
    vagrant up --provision
}

vrun() {
    vagrant ssh -c "$*"
}

vtemp() {
    vrun mktemp -d
}

vsource() {
    vrun /tools/source.sh "$1" "$2"
}

vbuild() {
    vrun sudo /tools/build.sh "$1"
}

trap cleanup EXIT

echo "I: Initializing VM..."
vinit

TEMPDIR="$(vtemp)"
echo "D: Using ${TEMPDIR} as temporary directory."

echo "I: Getting sources..."
vsource "$1" "${TEMPDIR}"

echo "I: Building..."
vbuild "${TEMPDIR}"
