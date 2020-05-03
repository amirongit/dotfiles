#!/usr/bin/env bash

export PATH=$PATH:~/.local/bin
export PATH=$PATH:$HOME/go/bin
export GOPATH=$HOME/go

case $- in
  *i*) ;;
    *) return;;
esac

bind 'set completion-ignore-case on'
complete -d cd

export PS1='\[ \u@\h:\w\\$ \]';
export PS2=' >';

ufetch && /opt/shell-color-scripts/colorscript.sh exec panes

alias PING='ping 4.2.2.4'
alias XLANG='setxkbmap -option grp:alt_shift_toggle us,ir'
alias VPN='sudo python -m protonvpn_cli'
alias EJECT='udisksctl power-off'
alias vi='vim'
