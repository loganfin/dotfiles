#!/usr/bin/env zsh

function zsh_source() {
    local file="$1"
    [ -f "${file}" ] && source "${file}"
}

# Add a plugin from github.
# "plugin_path": Should be of the form "{owner}/{plugin}"
function zsh_add_plugin() {
    local plugin_path="$1"

    local plugin_name="${plugin_path#*/}"
    if [ ! -d "${ZSH_CONFIG_DIR}/.plugins/${plugin_name}" ]; then
        echo "Cloning ${plugin_path}..."
        git clone "https://github.com/${plugin_path}.git" \
            "${ZSH_PLUGIN_DIR}/${plugin_name}"
    fi

    zsh_source "${ZSH_PLUGIN_DIR}/${plugin_name}/${plugin_name}.plugin.zsh"
    zsh_source "${ZSH_PLUGIN_DIR}/${plugin_name}/${plugin_name}.zsh"
}
