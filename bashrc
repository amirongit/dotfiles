[[ $- != *i* ]] && return

PS1='\u@\h:\w$ '

export VENV=/home/amir/Dev/VirtualEnvironments
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin

alias ls='ls --color=none'
alias SetX='setxkbmap -option grp:alt_shift_toggle us,ir'
alias EJECT='udisksctl power-off -b'
alias vpnc='sudo chattr -i /etc/resolv.conf && sudo protonvpn c'
alias vpnd='sudo protonvpn d && sudo chattr +i /etc/resolv.conf'
alias vi='nvim'
alias wplan='nvim ~/Plan/$(date --date=tomorrow +"%Y-%m-%d")'
alias rplan='cat ~/Plan/$(date --date=today +"%Y-%m-%d")'
