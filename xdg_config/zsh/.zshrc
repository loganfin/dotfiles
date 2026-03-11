source "${ZSH_CONFIG_DIR}/util.zshrc"

# Completions
autoload -Uz compinit
compinit -d "${ZSH_CACHE_DIR}/compinit-${ZSH_VERSION}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist

# Options
setopt \
    alwaystoend \
    autocd \
    autopushd \
    completeinword \
    extendedhistory \
    noflowcontrol \
    interactivecomments \
    login \
    longlistjobs \
    monitor \
    pushdignoredups \
    pushdminus \
    zle

unsetopt BEEP

# Enable editing the current command line with an editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Autocomplete on up/down arrow
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Keycodes are different on different terminal emulators
if uname -r | grep "microsoft-standard-WSL2" >> /dev/null; then
    UP_KEY="^[OA"
    DOWN_KEY="^[OB"
else
    UP_KEY="^[[A"
    DOWN_KEY="^[[B"
fi

# Key binds
bindkey "${UP_KEY}" up-line-or-beginning-search
bindkey "${DOWN_KEY}" down-line-or-beginning-search

# Fix delete key emitting tilde
bindkey "^[[3~" delete-char

# Other configurations
zsh_source "${ZSH_CONFIG_DIR}/aliases.zshrc"
zsh_source "${ZSH_CONFIG_DIR}/exports.zshrc"
zsh_source "${ZSH_CONFIG_DIR}/history.zshrc"
zsh_source "${ZSH_CONFIG_DIR}/prompt.zshrc"
zsh_source "${ZSH_CONFIG_DIR}/work.zshrc"
zsh_source "${ZSH_CONFIG_DIR}/devtools.zshrc"
zsh_source "${ZSH_CONFIG_DIR}/plugins.zshrc"
