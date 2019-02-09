
# GIT

alias git-amend='git stage -A && git commit --amend --no-edit'
alias git-rollback='git fetch origin && git reset --hard origin/$(git symbolic-ref --short HEAD)'
alias git-rollback-tree='git reset --hard && git clean -nfd'

# PULL REQUESTS

function git-pr () {
  local pr_number="$1"
  local pr_branch="$2"
  if [ -z "$pr_number" ]; then
    hub pr list
  else
    hub pr checkout $pr_number $pr_branch
  fi
}

alias git-pr-list='git-pr'
alias git-pr-checkout='git-pr'

function git-unpr () {
  local branch=${1:-$(git rev-parse --abbrev-ref HEAD)}
  git checkout master
  echo -n "Are you sure you want to permanently delete \"$branch\"? (Y/n)"
  read response
  if [[ $response =~ ^(yes|Yes|YES|y|Y| ) ]] || [[ -z $response ]]; then
    git branch -D $branch
  fi
}

# OTHERS

function git-merge () {
  local branch=${1:-$(git symbolic-ref --short HEAD)}
  git checkout master
  git pull origin master || true
  git merge $branch
}

function git-merge-squash () {
  local branch=${1:-$(git symbolic-ref --short HEAD)}
  echo -n "Write a commit message: "
  read message
  git checkout master
  git pull origin master || true
  git merge --squash $branch
  git commit --no-edit -m $message
}

function git-diff () {
  local from=${1:-1}
  local to=${2:-$(echo "$from - 1" | bc)}
  git --no-pager diff HEAD~$from..HEAD~$to
}

function git-history () {
  local nr=${1:-$(echo "$LINES - 2" | bc)}
  git --no-pager log --oneline -n $nr
}
