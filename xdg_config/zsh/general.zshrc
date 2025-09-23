# Exports
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim
export RIPGREP_CONFIG_PATH="$HOME/.config/rg/.ripgreprc"

# Fix delete key emitting tilde
bindkey "^[[3~" delete-char

# Dev tool utilities
eval "$(~/.local/bin/mise activate zsh)"
