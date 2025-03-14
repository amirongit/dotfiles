export LANG=en_US.UTF-8
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$HOME/bin:/usr/local/bin:$HOME/.dotnet/tools:$HOME/.local/bin:$HOME/.local/share/uv/tools:$HOME/go/bin:$HOME/.cargo/bin:$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH
export GPG_TTY=$(tty)

source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
# antigen theme frisk
antigen theme agnoster
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4e5165"
antigen apply

alias ls='ls --color=none'
alias vi='nvim'


# gpg-connect-agent updatestartuptty /bye >/dev/null
