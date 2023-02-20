export OKTA_PW="${HOME}/.config/.okta"

alias v=mvim
alias k=kubectl
alias tf=/usr/local/opt/terraform/bin/terraform
alias gd="cd ~/git"
alias ls="ls -G"
alias c="/bin/cat"
alias cat="ccat"
alias cak="comm-admin kubectl"
alias occa="expect_okta comm-admin ${OKTA_PW} && . ~/.okta/comm-admin"
alias occd="expect_okta comm-dev ${OKTA_PW} && . ~/.okta/comm-dev"
alias ocfa="expect_okta fed-admin-east ${OKTA_PW} && . ~/.okta/fed-admin-east"
alias ocht="expect_okta health-tools ${OKTA_PW} && . ~/.okta/health-tools"
alias ad="cd ~/git/k8s-comm-app-configs"
alias bt="cd ~/git/bits-tools"
