#!/bin/bash -e

apt_pkgs=( \
        curl \
        fuse \
        fzf \
        gdu \
        git \
        golang \
        luarocks \
        python3-pip \
        python3-pynvim \
        python3-venv \
        ripgrep \
        silversearcher-ag \
        unzip \
        wget \
    )

npm_pkgs=( \
        neovim \
    )

install_tree_sitter() {
    local version="0.26.8"
    if [ "$(tree-sitter --version)" = "tree-sitter $version" ]; then
        return
    fi
    cargo install tree-sitter-cli --version "$version"
}

install_nodejs() {
    local version="v25.9.0"
    local dirname="node-$version-linux-x64"
    local installpath="$HOME/.local/$dirname"
    local tarfile="$dirname.tar.xz"
    local url="https://nodejs.org/dist/$version/$tarfile"
    local binpath="$HOME/.local/bin"

    mkdir -p "$binpath"

    if [ ! -f ./"$tarfile" ] && [ ! -d ./"$dirname" ]; then
        wget "$url"
        tar -xvf "$tarfile"
        rm "$tarfile"
    fi

    mv "$dirname" "$installpath"
    ln -srf "$installpath/bin/"* "$binpath"
}

install_cargo() {
    if command -v cargo >/dev/null; then
        return
    fi
    curl https://sh.rustup.rs -sSf | sh
    rustup component add rust-analyzer
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Running apt-get update quietly"
    sudo apt-get -qq update

    echo "Running apt-get install quietly"
    sudo apt-get -qq install -y "${apt_pkgs[@]}"

    if ! command -v npm > /dev/null; then
        echo "nodejs not found, installing."
        install_nodejs
    fi

    echo "Running npm install quietly"
    sudo env PATH="$PATH" npm install -g "${npm_pkgs[@]}" > /dev/null

    install_cargo
    install_tree_sitter
fi
