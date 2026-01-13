#!/usr/bin/env zsh

function zsh_source() {
    local file="$1"
    [ -f "${file}" ] && source "${file}"
}
