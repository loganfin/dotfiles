# Export XDG variables, which might be used in ZSH config
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"

# Export ZSH config variables
export ZSH_CONFIG_DIR="${XDG_CONFIG_HOME}/zsh"
export ZSH_PLUGIN_DIR="${ZSH_CONFIG_DIR}/.plugins"

# Load ZSH config
source "${ZSH_CONFIG_DIR}/zshrc"
