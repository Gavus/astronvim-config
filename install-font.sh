#!/bin/bash -e

VERSION="v3.4.0"
ZIP="SourceCodePro.zip"
FONTPREFIX="SauceCodeProNerdFontMono"
FONTS=()
DESTDIR="$HOME/.local/share/fonts"

for boldness in "Regular" "Bold" "Medium" "SemiBold"; do
    FONTS+=("$FONTPREFIX-$boldness.ttf")
done

if [ ! -f "$ZIP" ] ; then
    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/$ZIP"
fi

mkdir -p "$DESTDIR"
unzip -j "$ZIP" "${FONTS[@]}" -d "$DESTDIR"

echo "Done."
