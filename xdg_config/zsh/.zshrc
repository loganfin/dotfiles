source "${ZSH_CONFIG_DIR}/general.zshrc"
source "${ZSH_CONFIG_DIR}/prompt.zshrc"
source "${ZSH_CONFIG_DIR}/history.zshrc"
source "${ZSH_CONFIG_DIR}/completion.zshrc"
source "${ZSH_CONFIG_DIR}/highlighting.zshrc"

if [ -e "${ZSH_CONFIG_DIR}/work.zshrc" ]; then
    source "${ZSH_CONFIG_DIR}/work.zshrc"
fi
