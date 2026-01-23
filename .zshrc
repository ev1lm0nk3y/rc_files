if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="${HOME}/bin:${HOME}/go/bin:/opt/homebrew/bin:/opt/homebrew/Cellar:${PATH}"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
# # Homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

[ -d ${HOME}/.oh-my-zsh/completions ] && FPATH=${HOME}/.oh-my-zsh/completions:$FPATH

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

DISABLE_AUTO_TITLE="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(1password colorize common-aliases git git-extras fluxcd fzf kubectl k9s terraform vi-mode zsh-navigation-tools)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export HOMEBREW_NO_ENV_HINTS=true

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# neovim remote setup
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
fi

# Preferred editor for local and remote sessions
export EDITOR='nvim'
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
fi

# GOPATH
export GOPATH="${HOME}/go"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Completions
autoload -U compinit && compinit

compdef k="kubectl"
compdef tf="terraform"
compdef a="aws"

[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# GCloud things
if [ -d "$(brew --prefix)/share/google-cloud-sdk" ]; then
  export CLOUDSDK_PYTHON_SITEPACKAGES=1
  export CLOUDSDK_PYTHON="$(brew --prefix)/opt/python@3.11/bin/python3"
  export CLOUDSDK_ACTIVE_CONFIG_NAME="default"
  export CLOUDSDK_CORE_DISABLE_PROMPTS=1
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

setopt autopushd
setopt pushdignoredups

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ryanshatford/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ryanshatford/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ryanshatford/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ryanshatford/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Created by `pipx` on 2024-05-16 07:24:46
export PATH="$PATH:/Users/ryanshatford/.local/bin"
export PATH="/opt/homebrew/bin:$PATH"

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

export PATH="/Users/ryanshatford/.cargo/bin:/Users/ryanshatford/.local/bin:$PATH"

## Custom functions
[ -f "${HOME}/bin/functions" ] && source ${HOME}/bin/functions
eval $(git config -l | grep alias | sed -e 's/^alias\./alias g/;s/=/="/;s/$/"/') 2>/dev/null || true
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ryanshatford/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
