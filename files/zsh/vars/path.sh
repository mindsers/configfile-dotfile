#!/bin/sh

export PATH=/usr/local/bin:/usr/bin:/bin # bin
export PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH # sbin

export PATH=$PATH:$HOME/.npm/bin
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:$HOME/.rvm/bin

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/opt/libressl/bin
export PATH=$PATH:/usr/local/share/dotnet/
export PATH=$PATH:/usr/local/opt/gettext/bin

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
