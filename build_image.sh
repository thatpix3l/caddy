#!/bin/bash

set -e

. ./version.env

var_exists () {
    [[ -v "$1" ]] || (echo "variable \`$1\` has not been set" >&2 && exit 1)
}

var_exists MAJOR
var_exists MINOR
var_exists PATCH

podman build \
    --tag=caddy:latest \
    --tag=caddy:"$MAJOR" \
    --tag=caddy:"$MAJOR"."$MINOR" \
    --tag=caddy:"$MAJOR"."$MINOR"."$PATCH" \
    --build-arg major="$MAJOR"\
    --build-arg minor="$MINOR"\
    --build-arg patch="$PATCH"\
    --pull=always \
    .