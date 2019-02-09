
# Autoload
autoload -U compinit && compinit
autoload -U colors && colors
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Exports
export CLICOLOR=1
export EDITOR=nano
export KEYTIMEOUT=1
export QUOTING_STYLE=literal
export TERM=xterm-256color

# Options
unsetopt flowcontrol
unsetopt menu_complete
setopt always_to_end
setopt append_history
setopt auto_cd
setopt auto_menu
setopt auto_pushd
setopt complete_in_word
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt interactivecomments
setopt long_list_jobs
setopt multios
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushdminus
setopt share_history

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# Keybindings

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

# Imports
source ~/termux-env/zsh/aliases.zsh
source ~/termux-env/zsh/functions.zsh
source ~/termux-env/zsh/fzf.zsh
source ~/termux-env/zsh/git.zsh
source ~/termux-env/zsh/node.zsh
source ~/termux-env/zsh/prompt.zsh
source ~/termux-env/zsh/tmux.zsh
