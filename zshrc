export VENV=/home/amir/Dev/VirtualEnvironments
export ZSH=/home/amir/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin
export GPG_TTY=$(tty)

source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle python
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen theme evan
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4e5165"
antigen apply

alias toryay='https_proxy=socks5://127.0.0.1:9050 yay'
alias ls='ls --color=none'
alias SetX='setxkbmap -option grp:alt_shift_toggle us,ir'
alias EJECT='udisksctl power-off -b'
alias vpnc='sudo chattr -i /etc/resolv.conf && sudo protonvpn c'
alias vpnd='sudo protonvpn d && sudo chattr +i /etc/resolv.conf'
alias vi='nvim'
