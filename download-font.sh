#!/bin/bash -e

VERSION="v3.0.2"
DIR="fonts"
ZIP="SourceCodePro.zip"
FONT="Sauce Code Pro Nerd Font Complete Mono.ttf"

mkdir -p "$DIR"
cd "$DIR"
if test ! -f "$ZIP"; then
    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/$ZIP"
fi
unzip -j "$ZIP" "$FONT" -d .
mv "$FONT" ./scpnfcm.ttf
cd -

echo "Done."
