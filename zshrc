export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/home/amir/.oh-my-zsh"

source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle pip
antigen bundle python
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle django
antigen bundle copyfile
antigen bundle pip

antigen theme lambda
antigen apply

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#2aa198"

pfetch

alias toryay='https_proxy=socks5://127.0.0.1:9050 yay'
alias restor='sudo systemctl restart tor'
alias stator='systemctl status tor'
alias systemctl='sudo systemctl'
alias lsc='ls --color'
alias netping='ping 4.2.2.4'
alias SetX='setxkbmap -option grp:alt_shift_toggle us,ir'
alias PacmanClean='sudo pacman -R $(pacman -Qdtq)'