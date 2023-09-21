# export ZSH=/home/amir/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin

source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen theme frisk
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4e5165"
antigen apply

export VENV="/home/amir/VirtualEnvironments"

alias toryay='https_proxy=socks5://127.0.0.1:9050 yay'
alias ls='ls --color=none'
alias EJECT='udisksctl power-off -b'
alias vpnc='sudo chattr -i /etc/resolv.conf && sudo protonvpn c'
alias vpnd='sudo protonvpn d && sudo chattr +i /etc/resolv.conf'
alias vi='nvim'
alias wplan='nvim ~/Plans/$(date --date=today +"%Y-%m-%d")'
alias rplan='cat ~/Plans/$(ls -rt ~/Plans/ | tail -1)'
alias mplan='vim ~/Plans/$(date --date=today +"%Y-%m-%d")'
alias mvn='mvn -DsocksProxyHost=127.0.0.1 -DsocksProxyPort=10808'
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
