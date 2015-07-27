#!/bin/sh
set -e

rsync -avh --exclude=src/* $1/* /dist/
