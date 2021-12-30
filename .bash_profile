# Add the GOROOT to PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$HOME/bin:$HOME/go/bin
export GOPATH=$HOME/go

# Add the tf linter to the path
export PATH=$PATH:~/.vim_runtime/my_plugins/vim-terraform-completion/bin

# More bash completions with git alias aliases created
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -f "/usr/local/etc/bash-completion" ]] && . /usr/local/etc/bash_completion

function_exists() {
  declare -f -F $1 > /dev/null
  return $?
}

if [ -f ~/bin/functions.sh ]; then
  source "${HOME}"/bin/functions.sh
fi

for al in `__git_get_config_variables "alias"`; do
  alias g$al="git $al"
        
  complete_func=_git_$(__git_aliased_command $al)
  function_exists $complete_fnc && __git_complete g$al $complete_func
done

if [ -f "/usr/local/opt/kube-ps1/share/kube-ps1.sh" ]; then
  source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
  export KUBE_PS1_SYMBOL_ENABLE=false
fi

export PS1="\$(nonzero_return)\$(echo $_LAST_STATUS_PREFIX_)\$(echo $_LAST_STATUS_SYMBOL_)\[\033[0;0m\] \$(kube_ps1) \W\n\[\033[0;34m\]\$(timeprompt)\[\033[0;0m\] $ "

# Git and kubectl bash prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  export __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
  export GIT_PROMPT_ONLY_IN_REPO=1
  export GIT_PROMPT_SHOW_UPSTREAM=1
  export GIT_PROMPT_THEME=Solarized
  export GIT_PROMPT_END="\n\$(kube_ps1) \[\033[0;34m\]\$(timeprompt)\[\033[0;0m\]$ "
fi

# start up virtualenv (maybe)
#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Get those aliases!
if [ -f ~/.bash_aliases ]; then source ~/.bash_aliases; fi

# AWS Aliases
if [ -f ~/.aws_aliases ]; then source ~/.aws_aliases; fi

# ncurses settings
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"

# use VI keybindings on the bash prompt
#set -o vi

# vault hunter from anywhere
export PATH="$PATH:~/git/vault-scripts"

# agnoster-bash
#export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
#if [[ -f $THEME ]]; then
#    export DEFAULT_USER=`whoami`
#    source $THEME
#fi

if [ -f /usr/local/Cellar/minikube/1.11.0/bin/minikube ]; then
  export PATH="${PATH}:/usr/local/Cellar/minikube/1.11.0/bin/"
fi

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
