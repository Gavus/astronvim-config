#!/bin/bash -e

docker run --rm --user "$(id -u):$(id -g)" -v "$(pwd)":/src:z -w /src fnichol/stylua sh -c "stylua ."
