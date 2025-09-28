#!/usr/bin/env zsh

## Autoload vcs and colors
autoload -Uz vcs_info
autoload -U colors && colors

# Enable only git
zstyle ':vcs_info:*' enable git

# Setup a hook that runs before every prompt
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git_untracked

git_untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}%s:(%{$fg[magenta]%}%b%{$fg[blue]%}) %{$fg[red]%}%m%u%c%{$fg[white]%}"

PROMPT="%F{2}%n@%m%F{7}:%F{97}%~%F{7}\$vcs_info_msg_0_
$ "
