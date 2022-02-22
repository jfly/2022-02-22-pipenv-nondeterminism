#!/usr/bin/env bash

set -e

i=0
while true; do
    i=$((i + 1))
    pipenv lock --dev &> /dev/null
    echo "attempt $i: greenlet markers=$(jq '.default.greenlet.markers' Pipfile.lock)"
done
