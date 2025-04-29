# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[ -f ~/.p10k.zsh ] || source ~/.p10k.zsh

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
EXTRA_PLUGINS=""
[ which terraform &>/dev/null ] && EXTRA_PLUGINS="${EXTRA_PLUGINS} terraform"
[ which kubectl &>/dev/null ] && EXTRA_PLUGINS="${EXTRA_PLUGINS} kubectl"
plugins=(colorize common-aliases git git-extras fzf vi-mode zsh-navigation-tools ${EXTRA_PLUGINS})

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
[ which brew &>/dev/null ] && export HAS_BREW=1

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

[ $EXTRA_PLUGINS =~ "kubectl" ] && compdef k="kubectl"
[ $EXTRA_PLUGINS =~ "terraform" ] && compdef tf="terraform"
[ which aws &>/dev/null ] && compdef a="aws"

# GCloud things
if [[ $HAS_BREW = "1" ]]; then
  export HOMEBREW_NO_ENV_HINTS=true
  export PATH="/opt/homebrew/opt/curl/bin:$PATH"

  # Created by `pipx` on 2024-05-16 07:24:46
  export PATH="$PATH:/Users/ryanshatford/.local/bin"
  export PATH="/opt/homebrew/bin:$PATH"

  [ -f "$(brew --prefix)/bin/kubectl-krew" ] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

  # nvm setup
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

  if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then
    export CLOUDSDK_PYTHON_SITEPACKAGES=1
    export CLOUDSDK_PYTHON="$(brew --prefix)/opt/python@3.11/bin/python3"
    export CLOUDSDK_ACTIVE_CONFIG_NAME="default"
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
  fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

export PATH="/Users/ryanshatford/.cargo/bin:/Users/ryanshatford/.local/bin:$PATH"

## Custom functions
[ -s "${HOME}/bin/functions" ] && source ${HOME}/bin/functions
set -ex
eval $(git config -l | grep alias | sed -e 's/^alias\./alias g/;s/=/="/;s/$/"/' || true)
unset -ex
