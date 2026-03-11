# Export XDG variables, which might be used in the ZSH config
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}"

# Export our custom ZSH config variables
export ZSH_CONFIG_DIR="${XDG_CONFIG_HOME}/zsh"
export ZSH_DATA_DIR="${XDG_DATA_HOME}/zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"
export ZSH_STATE_DIR="${XDG_STATE_HOME}/zsh"
export ZSH_PLUGIN_DIR="${ZSH_DATA_DIR}/plugins"

# Create custom ZSH config directories if necessary
for directory in \
    "${ZSH_CONFIG_DIR}" \
    "${ZSH_DATA_DIR}" \
    "${ZSH_CACHE_DIR}" \
    "${ZSH_STATE_DIR}" \
    "${ZSH_PLUGIN_DIR}"
do
    [ ! -d "$directory" ] && mkdir -p "$directory"
done

# This is required to keep /etc/zsh/zshenv from running compinit for us. We do
# it ourselves so that we can write those files to a different directory.
skip_global_compinit=1

. "$HOME/.cargo/env"
