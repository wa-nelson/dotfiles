alias v='vim'

## Colorize ls output
alias ls='ls --color=auto'

## Colorize grep output
alias grep='grep --color=auto'

## Commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

## Control ping
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'

## Updates
alias uu='sudo apt update && sudo apt upgrade'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .4='cd ../../../../..'
alias .5='cd ../../../../../..'

## sudo support
alias sudo='sudo '
