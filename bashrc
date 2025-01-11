export PATH=$HOME/bin:/usr/local/bin:$HOME/.dotnet/tools:$HOME/.local/bin:$HOME/.local/share/uv/tools:$HOME/go/bin:$HOME/.cargo/bin:$PATH

[[ $- != *i* ]] && return

alias ls='ls --color=none'
alias vi='nvim'

PS1='[\u@\h:\W]\$ '
