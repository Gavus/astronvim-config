# Astronvim-config

## Dependencies

### Debian: Bullseye

``` sh
sudo apt-get update && sudo apt-get install \
  curl \
  fzf \
  git \
  golang \
  npm \
  python3-pip \
  unzip \
  wget \
  -y
sudo pip install pynvim tree-sitter
sudo npm install -g neovim
sudo npm install -g tree-sitter-cli
```

## Install without cloning

``` sh
curl -s https://raw.githubusercontent.com/Gavus/astronvim-config/main/install.sh | bash /dev/stdin -r
```
