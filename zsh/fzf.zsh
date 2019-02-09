
# EXPORTS

export FZF_DEFAULT_COMMAND='fd --hidden --follow --no-ignore --exclude .git --exclude node_modules --exclude releases'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_COMMAND="$FZF_DEFAULT_COMMAND"

# FZF

if [[ ! "$PATH" == */share/fzf/bin* ]]; then
  export PATH="$PATH:/share/fzf/bin"
fi

source "/data/data/com.termux/files/usr/share/fzf/completion.zsh"
source "/data/data/com.termux/files/usr/share/fzf/key-bindings.zsh"

# HELPERS

_fzf_compgen_path () {
  fd --hidden --follow --no-ignore --exclude .git --exclude node_modules --exclude releases . "$1"
}

_fzf_compgen_dir() {
  fd --hidden --follow --no-ignore --exclude .git --exclude node_modules --exclude releases . "$1"
}
