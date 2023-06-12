# Astronvim-config

## Dependencies

### Debian: Bullseye

``` sh
apt-get update && apt-get install \
  curl \
  wget \
  git \
  unzip \
  npm \
  golang \
  python3-pip \
  -y
pip install pynvim tree-sitter
npm install -g neovim
```

## Install without cloning

``` sh
curl -s https://raw.githubusercontent.com/Gavus/astronvim-config/main/install.sh | bash /dev/stdin -r
```
