# export ZSH=/home/amir/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$HOME/.dotnet/tools:$HOME/.local/bin:$PATH
export GPG_TTY=$(tty)

source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen theme frisk
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4e5165"
antigen apply

alias ls='ls --color=none'
alias EJECT='udisksctl power-off -b'
alias vi='nvim'

# gpg-connect-agent updatestartuptty /bye >/dev/null
