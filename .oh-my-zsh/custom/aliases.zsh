alias zshconfig="nvim ~/.zshrc && . ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias v="nvim"
alias n="nvr --remote-wait"
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"
alias vim="nvim"
alias pg="pgrep -fl"

# https://github.com/ahmetb/kubectl-aliases?tab=readme-ov-file
[ -f ${HOME}/.kubectl_aliases ] && source ${HOME}/.kubectl_aliases

for a in  $(git la | cut -d"=" -f1); do alias g${a}="git ${a}"; done

eval $(thefuck --alias)

# Teleport shortcuts
alias tsh_login="tsh login --proxy=${TELEPORT_PROXY}:443 --user=${TELEPORT_USER} ${TELEPORT_PROXY}"
alias tkl="tsh kube login"

# tmux
alias tm="tmux --CC"
alias tma="tmux attach --CC"
