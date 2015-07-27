#!/bin/sh
set -ex

TYPE="$1"
SOURCE="$2"
TARGET="$3"

case "${TYPE}"
in
    fs)
        echo "I: Source rsync'd to ${TARGET}/src" 
        rsync -avh /vagrant/* ${TARGET}/src
    ;;
    git)
        sudo apt-get -yq install git
        echo "I: Checking out sources from git (source: ${SOURCE}, target: ${TARGET})..."
        git clone "${SOURCE}" "${TARGET}"
    ;;
    *)
        echo "E: Unsupported source type: ${TYPE}"
        exit 1
esac

