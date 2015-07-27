#!/bin/sh
set -e

rsync -avh $1/*.{changes,dsc,deb,xz,gz,bz2} /dist/
