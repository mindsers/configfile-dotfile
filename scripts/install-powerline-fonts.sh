#!/bin/sh

git clone https://github.com/powerline/fonts.git --depth=1 "$HOME/fonts"
"$HOME/fonts/install.sh"
rm -rf "$HOME/fonts"
