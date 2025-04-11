alias zshconfig="nvim ~/.zshrc && . ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias v="nvim"
alias n="nvr --remote-wait"
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"
alias vim="nvim"
alias ca="cd ~/src/alembic/${1}"
alias sp="ssh -fNq -D 1080 bastion.production.getalembic.com"
alias ss="ssh -fNq -D 1081 bastion.staging.getalembic.com"
alias sd="ssh -fNq -D 1082 bastion.dc2.getalembic.com"
alias less="less --use-color --mouse -F -L -Q"
alias asl="aws sso login"
alias pg="pgrep -fl"

# https://github.com/ahmetb/kubectl-aliases?tab=readme-ov-file
[ -f ${HOME}/.kubectl_aliases ] && source ${HOME}/.kubectl_aliases

eval $(thefuck --alias)


