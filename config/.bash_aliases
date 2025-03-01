# ~/.bash_aliases

# cd aliases
alias ..='cd ..'
alias ...='cd ../..'


#alias with args as func
alias tail_ls='_tail_ls() { ls -l "$1" | tail ;}; _tail_ls'

# fast ping
alias ping='ping -c 5'

# git aliases
alias gs='git status'
alias gp='git pull'
alias gb='git branch'
alias gd='git diff'

# lazygit & lazydocker aliases
alias lzg='lazygit'
alias lzd='lazydocker'


