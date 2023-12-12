#!/bin/bash -e
# shellcheck disable=2068,2046

REMOVE=0
ASTRONVIM_VERSION="v3.39.0"
NVIM_VERSION="v0.9.4"

help() {
    cat << EOF
usage: $0 [-h|--help] [-r|--remove]

optional arguments:
  -h, --help              Show this help message and exit.
  -r, --remove            Remove AstroNvim before installing.
  -v, --version [$ASTRONVIM_VERSION] Specify AstroNvim version.
  --nvim-version [$NVIM_VERSION] Specify Nvim version.
EOF
}


parse-args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -r|--remove)
                REMOVE=1
                shift
                ;;
            -v|--version)
                ASTRONVIM_VERSION="$2"
                shift; shift
                ;;
            --nvim-version)
                NVIM_VERSION="$2"
                shift; shift
                ;;
            *)
                help
                exit 1
                ;;
        esac
    done
}


install-nvim() {
    local version="$NVIM_VERSION"
    local dirname="nvim-linux64"
    local share="$HOME/.local/share"
    local installpath="$share/$dirname-$version"
    local tarfile="$dirname.tar.gz"
    local url="https://github.com/neovim/neovim/releases/download/$version/$tarfile"
    local binpath="$HOME/.local/bin"

    mkdir -p "$binpath" "$share"

    if test -d "$installpath"; then
        echo "Nvim $version is already installed"
        ln -srf "$installpath/bin/"* "$binpath"
        return
    fi

    if test ! -d "$dirname"; then
        if [ ! -f "$tarfile" ]; then
            echo "Downloading nvim"
            wget "$url"
        fi
        echo "Extracting nvim"
        tar -xzvf "$tarfile"
        rm "$tarfile"
    fi

    mv "$dirname" "$installpath"
    ln -srf "$installpath/bin/"* "$binpath"
    echo "Nvim Installed"
}


remove-astronvim() {
    echo "Removing old nvim configuration"
    rm \
        "$HOME/.cache/nvim" \
        "$HOME/.local/share/nvim" \
        "$HOME/.local/state/nvim" \
        "$HOME/.local/site/nvim" \
        "$HOME/.config/nvim" \
        -rf
}


install-astronvim() {
    local astrourl="https://github.com/astronvim/AstroNvim.git"
    local confurl="https://github.com/Gavus/astronvim-config.git"
    local tag="$ASTRONVIM_VERSION"
    local configpath="$HOME/.config"
    local nvimpath="$configpath/nvim"
    local userpath="$nvimpath/lua/user"
    local githome

    githome=$(basename "$(git rev-parse --show-toplevel)")

    mkdir -p "$configpath"
    if test ! -d "$nvimpath"; then
        echo "Cloning astronvim"
        git clone "$astrourl" "$nvimpath"
    else
        echo "Astronvim already downloaded"
        git -C "$nvimpath" fetch origin
    fi
    echo "Fetching astronvim version: $tag"
    git -C "$nvimpath" reset --hard "$tag"
    rm -rf "$userpath"
    if test "$githome" = "astronvim-config"; then
        ln -srf "$PWD" "$userpath"
    else
        git clone "$confurl" "$userpath"
    fi

    "$HOME/.local/bin/nvim" --headless -c AstroUpdatePackages -c qall
    echo "Astronvim installed"
}


# Only run if executed, not sourced.
if test "$0" = "${BASH_SOURCE[0]}"; then
    parse-args $@
    if test $REMOVE -eq 1; then
        remove-astronvim
    fi
    install-nvim
    install-astronvim
fi
