#!/bin/sh

antigen use oh-my-zsh

antigen bundle git
antigen bundle git-flow
antigen bundle vi-mode
antigen bundle osx
antigen bundle npm
antigen bundle yarn
antigen bundle ng
antigen bundle docker
antigen bundle brew
antigen bundle command-not-found
antigen bundle kubectl

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

antigen apply
