#!/usr/bin/env bash

PS1="\n\w \[\033[0;32m\]$\[\033[0m\] "

case $- in
  *i*) ;;
    *) return;;
esac

pfetch

alias toryay='https_proxy=socks5://127.0.0.1:9050 yay'
alias restor='sudo systemctl restart tor'
alias stator='systemctl status tor'
alias systemctl='sudo systemctl'
alias lsc='ls --color'
alias netping='ping 4.2.2.4'
alias SetX='setxkbmap -option grp:alt_shift_toggle us,ir'
alias PacmanClean='sudo pacman -R $(pacman -Qdtq)'
