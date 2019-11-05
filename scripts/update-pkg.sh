#!/bin/zsh

[ -s "$HOME/.config/zsh/vars.sh" ] && \. "$HOME/.config/zsh/vars.sh"
[ -s "$HOME/.config/zsh/sourcing-tools.sh" ] && \. "$HOME/.config/zsh/sourcing-tools.sh"

title() {
  echo '\033[34;1;4m'$1'\033[0m'
}

# clean dev
title 'Cleaning'
rm -fv ~/Developer/**/.DS_Store

# antigen
title 'Angigen'
command -v antigen > /dev/null && antigen update

# composer (PHP)
title 'Composer'
command -v composer > /dev/null && composer global update

# nodejs
title 'NodeJS'
command -v nvm > /dev/null && nvm install node --latest-npm --reinstall-packages-from=node
command -v npm > /dev/null && npm install npm@latest -g
command -v npm > /dev/null && npm update -g

# homebrew
title 'Homebrew'
brew update
brew upgrade
brew cleanup
brew prune
brew doctor

echo '\n:: Packages is now up to date. You need to reload your terminal ::\n'
