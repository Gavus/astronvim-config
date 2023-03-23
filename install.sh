#!/bin/bash -e


install-nvim() {
	local version="v0.8.3"
	local dirname="nvim-linux64"
	local installpath="$HOME/.local/share/$dirname-$version"
	local tarfile="$dirname.tar.gz"
	local url="https://github.com/neovim/neovim/releases/download/$version/$tarfile"
	local binpath="$HOME/.local/bin"

	mkdir -p "$binpath"

	if test -d "$installpath"; then
		echo "nvim $version is already installed"
		ln -srf "$installpath/bin/"* "$binpath"
		return
	fi

	if test ! -d "$dirname"; then
		if [ ! -f "$tarfile" ]; then
			wget "$url"
		fi
		tar -xzvf "$tarfile"
		rm "$tarfile"
	fi

	mv "$dirname" "$installpath"
	ln -srf "$installpath/bin/"* "$binpath"
}


remove-astronvim() {
	rm -rf "$HOME/.cache/nvim"
	rm -rf "$HOME/.local/share/nvim"
	rm -rf "$HOME/.local/site/nvim"
	rm -rf "$HOME/.config/nvim"
}


install-astronvim() {
	local url="https://github.com/kabinspace/AstroNvim"
	local tag="v3.5.1"
	local configpath="$HOME/.config"
	local nvimpath="$configpath/nvim"
	local userpath="$nvimpath/lua/user"

	mkdir -p "$configpath"
	git clone "$url" "$nvimpath"
	git -C "$nvimpath" reset --hard "$tag" 
	ln -srf "." "$userpath"
	nvim --headless -c "AstroUpdatePackages" -c "qall"
}


install-treesitters() {
	local parsers=" \
		bash \
		c \
		cmake \
		cpp \
		dockerfile \
		gitcommit \
		html \
		lua \
		markdown \
		meson \
		python \
	"
	echo "installing treesitter parsers"
	nvim --headless -c "TSUpdateSync ${parsers}" -c "qall"
	echo "done"
}


install-mason-packages() {
	local packages=" \
		bash-language-server \
		clangd \
		codespell \
		grammarly-languageserver \
		misspell \
		pyright \
		shellcheck \
		sourcery \
	"
	echo "installing mason packages"
	nvim --headless -c "MasonInstall ${packages}" -c "qall"
	echo "done"
}


# Only run if executed, not sourced.
if test "$0" = "${BASH_SOURCE[0]}"; then
	remove-astronvim
	install-nvim
	install-astronvim
	install-treesitters
	install-mason-packages
fi
