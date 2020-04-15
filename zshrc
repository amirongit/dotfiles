export ZSH="/home/amir/.oh-my-zsh"
export PATH=$PATH:$GOROOT/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/go/bin"
export GOPATH=$HOME/go

source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme jispwoso
antigen apply
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=FF0000"

pfetch && /opt/shell-color-scripts/colorscript.sh exec panes

alias toryay='https_proxy=socks5://127.0.0.1:9050 yay'
alias restor='sudo systemctl restart tor'
alias stator='systemctl status tor'
alias systemctl='sudo systemctl'
alias lsc='ls --color'
alias netping='ping 4.2.2.4'
alias SetX='setxkbmap -option grp:alt_shift_toggle us,ir'
alias protonvpn='sudo python -m protonvpn_cli'
alias q='exit'
alias eject='udisksctl power-off'

export PATH=$PATH:~/.local/bin
