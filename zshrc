export LANG=en_US.UTF-8
export DOTNET_ROOT=$HOME/.dotnet
export npm_config_prefix="$HOME/.local"
export PATH=$HOME/bin:/usr/local/bin:$HOME/.dotnet/tools:$HOME/.local/bin:$HOME/.local/share/uv/tools:$HOME/go/bin:$HOME/.cargo/bin:$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH
export GPG_TTY=$(tty)
export TMUX_SESSION=RCH
export ZSH="$HOME/.oh-my-zsh"

source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen theme frisk
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4e5165"
DISABLE_MAGIC_FUNCTIONS=true
DEFAULT_USER=amir
# DISABLE_UNTRACKED_FILES_DIRTY="true"
source $ZSH/oh-my-zsh.sh


alias ls='ls --color=none'
alias vi='nvim'

setopt no_share_history
unsetopt share_history

# if [[ -z "$TMUX" ]]; then
#     tmux new -A -s RCH;
# fi

# gpg-connect-agent updatestartuptty /bye >/dev/null
