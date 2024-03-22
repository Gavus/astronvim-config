#!/bin/bash

apt_pkgs=( \
        cargo \
        curl \
        fzf \
        git \
        golang \
        python3-pip \
        python3-pynvim \
        python3-venv \
        silversearcher-ag \
        unzip \
        wget \
        gdu \
    )

pip_pkgs=( \
        tree-sitter \
        lazygit \
    )

npm_pkgs=( \
        neovim \
        tree-sitter-cli \
    )

echo "Running apt-get update quietly"
sudo apt-get -qq update

echo "Running apt-get install quietly"
sudo apt-get -qq install -y "${apt_pkgs[@]}"

echo "Running pip install"
pip3 install -q "${pip_pkgs[@]}"

echo "Running npm install"
# apt installs a too old version of node. Install it manually.
sudo env PATH="$PATH" npm install -g "${npm_pkgs[@]}"
