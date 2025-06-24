export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export DOTNET_ROOT=$HOME/.dotnet
export npm_config_prefix="$HOME/.local"
export PATH=$HOME/bin:/usr/local/bin:$HOME/.dotnet/tools:$HOME/.local/bin:$HOME/.local/share/uv/tools:$HOME/go/bin:$HOME/.cargo/bin:$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH
export GPG_TTY=$(tty)
export TMUX_SESSION=RCH
DEFAULT_USER=amir
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
alias vi='nvim'
setopt no_share_history
unsetopt share_history
# if [[ -z "$TMUX" ]]; then
#     tmux new -A -s RCH;
# fi
# gpg-connect-agent updatestartuptty /bye >/dev/null
# export http_proxy="http://192.168.2.172:8080"
# export https_proxy="http://192.168.2.172:8080"
# export ftp_proxy="http://192.168.2.172:8080"
