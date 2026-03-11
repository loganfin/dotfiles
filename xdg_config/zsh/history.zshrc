#!/usr/bin/env zsh

export HISTFILE="${ZSH_STATE_DIR}/history"
export HISTSIZE=100000
export SAVEHIST=100000

setopt append_history
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_verify
setopt hist_ignore_dups
setopt hist_ignore_space
