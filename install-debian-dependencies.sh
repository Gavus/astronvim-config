#!/bin/bash -e

apt_pkgs=( \
        cargo \
        curl \
        fzf \
        gdu \
        git \
        golang \
        python3-pip \
        python3-pynvim \
        python3-venv \
        silversearcher-ag \
        tree-sitter-cli \
        unzip \
        wget \
    )

npm_pkgs=( \
        neovim \
    )

echo "Running apt-get update quietly"
sudo apt-get -qq update

echo "Running apt-get install quietly"
sudo apt-get -qq install -y "${apt_pkgs[@]}"

echo "Running npm install"
if ! command -v npm > /dev/null; then
    >&2 echo "nodejs LTS must be installed manually!"
    exit 1
fi
# apt installs a too old version of node. Install it manually.
sudo env PATH="$PATH" npm install -g "${npm_pkgs[@]}"
