#!/bin/sh
set -ex

TYPE="$1"
SOURCE="$2"
TARGET="$3"

case "${TYPE}"
in
    fs)
        echo "I: Source rsync'd to ${TARGET}/src"
        mkdir -p ${TARGET}/src
        rsync -avh --exclude=dist/* /vagrant/* ${TARGET}/src
    ;;
    git)
        sudo apt-get -yq install git
        echo "I: Checking out sources from git (source: ${SOURCE}, target: ${TARGET}/src)..."
        git clone "${SOURCE}" "${TARGET}/src"
    ;;
    *)
        echo "E: Unsupported source type: ${TYPE}"
        exit 1
esac

