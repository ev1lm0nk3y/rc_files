# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryan.shatford/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ryan.shatford/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ryan.shatford/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ryan.shatford/google-cloud-sdk/completion.bash.inc'; fi

# Add the GOROOT to PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$HOME/bin:$HOME/go/bin
export GOPATH=$HOME/go

# Add the tf linter to the path
export PATH=$PATH:~/.vim_runtime/my_plugins/vim-terraform-completion/bin

# More bash completions with git alias aliases created
[ -f "/usr/local/etc/bash_completion" ] && . /usr/local/etc/bash_completion
function_exists() {
  declare -f -F $1 > /dev/null
  return $?
}

if [ -f ~/bin/functions.sh ]; then
  source ~/bin/functions.sh
fi

for al in `__git_get_config_variables "alias"`; do
  alias g$al="git $al"
        
  complete_func=_git_$(__git_aliased_command $al)
  function_exists $complete_fnc && __git_complete g$al $complete_func
done

if [ -f "/usr/local/opt/kube-ps1/share/kube-ps1.sh" ]; then
  source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
  KUBE_PS1_SYMBOL_ENABLE=false
  KUBE_PS1_CLUSTER_FUNCTION=kubecontext
  KUBE_PS1_NS_ENABLE=false
fi

# Git and kubectl bash prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_SHOW_UPSTREAM=1
  GIT_PROMPT_THEME=Solarized
  GIT_PROMPT_END="\$(kube_ps1)\n\[\033[0;34m\]\$(timeprompt)\[\033[0;0m\] $ "
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# start up virtualenv (maybe)
#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# install Tapad SSH helpers
source /opt/tapad/gcp_ssh_helpers.sh

# Get those aliases!
if [ -f ~/.bash_aliases ]; then source ~/.bash_aliases; fi

# Env
export TAPAD_GCP_USER="ryan_shatford_tapad_com"
export VAULT_ADDR="https://vault.svc.tapad.com:8200"
export CLOUDSDK_PYTHON="/usr/local/bin/python2.7"

# Fuck you SBT
export SBT_CREDENTIALS="$HOME/.ivy2/.credentials"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/binutils/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Krew
export PATH=$PATH:$HOME/.krew/bin
