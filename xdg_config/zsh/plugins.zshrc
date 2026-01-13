#!/usr/bin/env zsh

# Add a plugin from github.
# "plugin_path": Should be of the form "{owner}/{plugin}"
function zsh_add_plugin() {
    local plugin_path="$1"

    local plugin_name="${plugin_path#*/}"

    if [ ! -d "${ZSH_PLUGIN_DIR}/${plugin_name}" ]; then
        echo "[ZSH] Installing ${plugin_path}..."
        git clone "https://github.com/${plugin_path}.git" \
            "${ZSH_PLUGIN_DIR}/${plugin_name}" \
            --quiet
    fi

    zsh_source "${ZSH_PLUGIN_DIR}/${plugin_name}/${plugin_name}.plugin.zsh"
    zsh_source "${ZSH_PLUGIN_DIR}/${plugin_name}/${plugin_name}.zsh"
}

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
