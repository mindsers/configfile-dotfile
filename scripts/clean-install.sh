#!/bin/sh

declare -r TAPS=(caskroom/fonts)
declare -r BREWS=(git neovim wget nvm "yarn --without-node" tree zsh zsh-completions antigen)
declare -r CASKS=(hyper visual-studio-code font-fira-code)
declare -r NODES=(npm configfile)
declare -r VSCODES=(
    angular.ng-template
    msjsdiag.debugger-for-chrome
    peterjausovec.vscode-docker
    editorconfig.editorconfig
    dbaeumer.vscode-eslint
    eamodio.gitlens
    kumar-harsh.graphql-for-vscode
    pkief.material-icon-theme
    eg2.vscode-npm-script
    christian-kohler.npm-intellisense
    zhuangtongfa.material-theme
    ms-python.python
    robinbentley.sass-indented
    wayou.vscode-todo-highlight
    eg2.tslint
    vscodevim.vim
    ms-vsliveshare.vsliveshare
)



main() {
  # xcode
  title 'Installing Xcode Command Line Tools'
  case "$(xcode-select -p)" in
    */CommandLineTools)
      echo 'Xcode Command line tool is alrady installed.'
      ;;
    *)
      xcode-select --install
      read -sp 'Press any key to continue. (Xcode Command Line Tools must be installed) '
      echo ''
      ;;
  esac

  # brew
  title 'Installing Homebrew'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # homebrew
  brew update
  install_brews
  tset

  # node
  title 'Installing node'
  export NVM_DIR="$HOME/.nvm"
  mkdir -p $NVM_DIR
  . '/usr/local/opt/nvm/nvm.sh'

  nvm install node
  install_nodes

  # vscode
  title 'Setting up vscode'
  install_vscodes

  # zsh
  title 'Setting up zsh'
  case "$SHELL" in
    */zsh)
      if [ "$(command -v zsh)" != '/usr/local/bin/zsh' ] ; then
        update_shell
      fi
      ;;
    *)
      update_shell
      ;;
  esac
}

# utils
title() {
  echo '\033[34;1;4m'$1'\033[0m'
}

update_shell() {
  local shell_path;
  shell_path="$(command -v zsh)"

  echo "Changing your shell to zsh ..."
  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    echo "Adding '$shell_path' to /etc/shells"
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  sudo chsh -s "$shell_path" "$USER"
}

install_brews() {
  title 'Installing brew packages'
  for i in ${TAPS[@]}; do
    brew tap ${i}
  done

  for i in ${BREWS[@]}; do
    brew install ${i}
  done

  for i in ${CASKS[@]}; do
    brew cask install ${i}
  done
}

install_nodes() {
  for i in ${NODES[@]}; do
    npm install -g "${i}@latest"
  done
}

install_vscodes() {
    for i in ${VSCODES[@]}; do
        code --install-extension ${i}
    done
}
main "$@"
