# Astronvim-config

My personal astronvim v4 config. [AstroNvim](https://astronvim.com/) is an
aesthetic and feature-rich Neovim configuration that focuses on extensibility
and usability.

This config automatically installs lsps, formatters, linters, treesitters and
lots more for a smooth experience.

## Dependencies

Astronvim requires a crazy amount of other applications, which depends on the
config being used. Here are the dependencies for this config.

### Debian: Bookworm

You'll need to install latest nodejs LTS manually before proceeding.

```sh
./install-debian-dependencies.sh
```

## Installing

First install all the dependencies or face the consequences.

### Quick install

Simply run this command in the terminal to install. Beware that this removes all
old nvim config and cached files that you might have.

```sh
curl -s https://raw.githubusercontent.com/Gavus/astronvim-config/main/install.sh | bash /dev/stdin -r
```

### Regular install

1. Clone this repository.
2. Run `install.sh` from within the repository.
