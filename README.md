# Astronvim-config

## Dependencies

### Debian: Bookworm

``` sh
sudo apt-get update && sudo apt-get install \
  cargo \
  curl \
  fzf \
  git \
  golang \
  npm \
  python3-pip \
  python3-pynvim \
  python3-venv \
  unzip \
  wget \
  -y
sudo pip3 install tree-sitter
sudo npm install -g neovim
sudo npm install -g tree-sitter-cli
```

## Install without cloning

``` sh
curl -s https://raw.githubusercontent.com/Gavus/astronvim-config/main/install.sh | bash /dev/stdin -r
```
