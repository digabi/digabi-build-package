#!/bin/sh
set -ex

cd "$1/src"

echo "I: Installing build-dependencies..."
mk-build-deps -i -r --tool="apt-get --no-install-recommends -y" debian/control

echo -n "I: Check if we're building multiarch..."
egrep -q "^Architecture: (any|i386)" debian/control && echo "yes" && dpkg-buildpackage -us -uc -ai386 || echo "no"

echo "I: Building the package..."
dpkg-buildpackage -us -uc
