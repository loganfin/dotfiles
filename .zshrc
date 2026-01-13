# Export XDG variables, which might be used in ZSH config
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}"

# Export ZSH config variables
export ZSH_CONFIG_DIR="${XDG_CONFIG_HOME}/zsh"

export ZSH_DATA_DIR="${XDG_DATA_HOME}/zsh"
[ ! -d "$ZSH_DATA_DIR" ] && mkdir -p "$ZSH_DATA_DIR"

export ZSH_STATE_DIR="${XDG_STATE_HOME}/zsh"
[ ! -d "$ZSH_STATE_DIR" ] && mkdir -p "$ZSH_STATE_DIR"

export ZSH_PLUGIN_DIR="${ZSH_DATA_DIR}/plugins"
[ ! -d "$ZSH_PLUGIN_DIR" ] && mkdir -p "$ZSH_PLUGIN_DIR"

# Load ZSH config
source "${ZSH_CONFIG_DIR}/zshrc"
