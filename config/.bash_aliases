# ~/.bash_aliases

# cd aliases
alias ..='cd ..'
alias ...='cd ../..'


#alias with args as func
alias tail_ls='_tail_ls() { ls -l "$1" | tail ;}; _tail_ls'

# fast ping
alias ping='ping -c 5'

# git aliases
alias ga='git add .'
alias gb='git rev-parse --abbrev-ref HEAD'
alias gc='git commit'
alias gd='git diff'
alias gl='git log'
alias gp='git pull'
alias gs='git status'

# lazygit & lazydocker aliases
alias lzg='lazygit'
alias lzd='lazydocker'