
# TMUX

alias tmux-list="tmux ls"
alias tmux-clean="tmux ls | grep attached | cut -d: -f1 | xargs -t -n1 tmux kill-session -t"
alias tmux-switch="tmux-new"

# FUNCTIONS

function tmux-kill () {
  tmux kill-session -t $1
}

function tmux-new () {
  tmux attach -t $1 || tmux new -s $1
}
