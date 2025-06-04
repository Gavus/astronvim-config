#!/bin/bash -e

apt_pkgs=( \
        cargo \
        curl \
        fuse \
        fzf \
        gdu \
        git \
        golang \
        python3-pip \
        python3-pynvim \
        python3-venv \
        silversearcher-ag \
        unzip \
        wget \
    )

npm_pkgs=( \
        neovim \
    )

install_tree_sitter() {
    local version="0.25.3"
    local name="tree-sitter"
    local tgz="${name}-linux-x64.gz"
    local url="https://github.com/tree-sitter/tree-sitter/releases/download/v${version}/${tgz}"
    local installpath="$HOME/.local/bin"
    mkdir -p "$installpath"

    if [[ ! -f "$installpath/$name" ]]; then
        wget -O - "$url" | gunzip -dc > "$installpath/$name"
        chmod +x "$installpath/$name"
        echo "installed $name"
    fi
}

install_nodejs() {
    version=v22.11.0
    dirname=node-$version-linux-x64
    installpath=$HOME/.local/share/$dirname
    tarfile=$dirname.tar.xz
    url=https://nodejs.org/dist/$version/$tarfile
    binpath=$HOME/.local/bin

    mkdir -p "$binpath"

    if [ ! -f ./"$tarfile" ] && [ ! -d ./"$dirname" ]; then
        wget "$url"
        tar -xvf "$tarfile"
        rm "$tarfile"
    fi

    mv "$dirname" "$installpath"
    ln -srf "$installpath/bin/"* "$binpath"
}

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

install_tree_sitter
