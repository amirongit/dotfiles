# bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

case $- in
  *i*) ;;
    *) return;;
esac

export OSH='/home/amir/.oh-my-bash'
# OSH_THEME="binaryanomaly"
OSH_THEME="half-life"
# OSH_THEME="tonka"
# OMB_THEME_RANDOM_IGNORED=("powerbash10k" "wanelo")
# OMB_CASE_SENSITIVE="true"
# OMB_HYPHEN_SENSITIVE="false"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# SCM_GIT_DISABLE_UNTRACKED_DIRTY="true"
# SCM_GIT_IGNORE_UNTRACKED="true"
# HIST_STAMPS='yyyy-mm-dd'
OMB_DEFAULT_ALIASES="check"
# OSH_CUSTOM=/path/to/new-custom-folder
OMB_USE_SUDO=false
OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
completions=(
  git
  composer
  docker
  docker-compose
)
aliases=()
plugins=(
  git
  colored-man-pages
  dotnet
  sudo
)
source "$OSH"/oh-my-bash.sh
export LANG=en_US.UTF-8
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$HOME/bin:/usr/local/bin:$HOME/.dotnet/tools:$HOME/.local/bin:$HOME/.local/share/uv/tools:$HOME/go/bin:$HOME/.cargo/bin:$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export ARCHFLAGS="-arch x86_64"

alias vi='nvim'
