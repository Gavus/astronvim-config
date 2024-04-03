#!/bin/bash -e
# shellcheck disable=2068,2046


main() {
    init

    parse_args "$@"

    if [[ $REMOVE == 1 ]]; then
        remove_astronvim
    fi

    install_nvim
    install_astronvim
}

init() {
    REMOVE=0
    NVIM_VERSION="v0.9.5"
}

help() {
    cat << EOF
usage: $0 [-h|--help] [-r|--remove]

optional arguments:
  -h, --help              Show this help message and exit.
  -r, --remove            Remove old nvim config and cached files.
  --nvim-version [$NVIM_VERSION] Specify Nvim version.
EOF
}


parse_args() {
    while (( $# > 0 )); do
        case $1 in
            -r|--remove)
                REMOVE=1
                shift
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


install_nvim() {
    local version="$NVIM_VERSION"
    local dirname="nvim-linux64"
    local share="$HOME/.local"
    local installpath="$share/$dirname-$version"
    local tarfile="$dirname.tar.gz"
    local url="https://github.com/neovim/neovim/releases/download/$version/$tarfile"
    local url="https://github.com/neovim/neovim/releases/download/$version/$tarfile"
    local binpath="$HOME/.local/bin"

    mkdir -p "$binpath" "$share"

    if [[ -d "$installpath" ]]; then
        echo "Nvim $version is already installed"
        ln -srf "$installpath/bin/"* "$binpath"
        return
    fi

    if [[ ! -d "$dirname" ]]; then
        if [[ ! -f "$tarfile" ]]; then
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


remove_astronvim() {
    echo "Removing old nvim configuration"
    rm \
        "$HOME/.cache/nvim" \
        "$HOME/.local/share/nvim" \
        "$HOME/.local/state/nvim" \
        "$HOME/.local/site/nvim" \
        "$HOME/.config/nvim" \
        -rf
}


install_astronvim() {
    local confurl="https://github.com/Gavus/astronvim-config.git"
    local configpath="$HOME/.config"
    local nvimpath="$configpath/nvim"
    local githome

    mkdir -p "$configpath"

    if [[ -d "$nvimpath" ]]; then
        rm -rf "$nvimpath";
    fi

    githome=$(basename "$(git rev-parse --show-toplevel 2>/dev/null)")
    if [[ "$githome" == "astronvim-config" ]]; then
        ln -srf "$PWD" "$nvimpath"
    else
        git clone "$confurl" "$nvimpath"
    fi

    "$HOME/.local/bin/nvim" --headless +q
    echo "Astronvim installed"
}

### Call main ###
main "$@"
#################
