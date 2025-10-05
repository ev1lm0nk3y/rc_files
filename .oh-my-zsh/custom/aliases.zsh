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

for a in  $(git la | cut -d"=" -f1); do alias g${a}="git ${a}"; done

eval $(thefuck --alias)

# Teleport shortcuts
alias tlp="tsh login --proxy=tp-prod.alembic.team:443 --user=ev1lm0nk3y --auth twothinkinc"
alias tls="tsh login --proxy=entry.low.alembic.team:443 --user=ev1lm0nk3y --auth twothinkinc"
alias tpk="tsh kube login --proxy=tp-prod.alembic.team:443 --user=ev1lm0nk3y --auth twothinkinc production-eks"
alias tsk="tsh kube login --proxy=entry.low.alembic.team:443 --user=ev1lm0nk3y --auth twothinkinc staging-eks"
alias tlpa="tsh apps login --aws-role AlembicAdmin production-aws-teleport"
alias tlsa="tsh apps login --aws-role AlembicAdmin staging-aws-teleport"
alias tap="tsh aws"
alias tas="tsh aws"
