# Setup fzf
# ---------
if [[ ! "$PATH" == */home/niwook/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/niwook/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/niwook/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/niwook/.fzf/shell/key-bindings.zsh"
