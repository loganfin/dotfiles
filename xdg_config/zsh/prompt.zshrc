source "${ZSH_CONFIG_DIR}/git.zshrc"

PROMPT="%F{2}%n@%m%F{7}:%F{97}%~%F{7} $(git_prompt_info)
$ "
