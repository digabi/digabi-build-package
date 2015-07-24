#!/bin/sh
set -ex

SOURCE="$1"
TARGET="$2"

echo "I: Checking out sources from git (source: ${SOURCE}, target: ${TARGET})..."
git clone "${SOURCE}" "${TARGET}"

