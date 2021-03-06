# Allow us to use Ctrl-s and Ctrl-q as keybinds
stty -ixon

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/pabloa/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, asdf)

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit
autoload -Uz bashcompinit
bashcompinit -i

source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Required by maximum awesome
export PATH="~/bin:$PATH"

export PATH="/usr/local/opt/ruby/bin:$PATH"

# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh

# EVM
# source "$HOME/.evm/scripts/evm"

export PATH="/usr/local/sbin:$PATH"

# Load z.sh https://github.com/rupa/z
. ~/z-master/z.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# git alias
alias g=git

export PATH="/usr/local/opt/erlang@21/bin:$PATH"

export GOPATH=$HOME/go

export PATH="$GOPATH/bin:$PATH"
# allow go get to fetch all private repositories from cabify org
export GOPRIVATE=github.com/cabify/*,gitlab.otters.xyz/*

export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pabloa/Documents/Projects/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pabloa/Documents/Projects/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pabloa/Documents/Projects/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pabloa/Documents/Projects/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add help bash command since zsh does not include it
# this is helpful for built-in bash commands like 'read' that don't have
# a man page but instead u can use 'help read' to get docu
function help(){
  bash -c "help $@"
}
