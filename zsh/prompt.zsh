
# Prompt

if [[ -n $TMUX ]]; then
  local is_tmux=1
  local session_name=`tmux display-message -p '#S'`
fi
if [[ $SSH_CONNECTION != '' ]]; then
  local is_ssh=1
fi
if [[ $UID -eq 0 ]]; then # Root user
  local user='%{$fg[red]%}%n%{$reset_color%}'
  local hostname='%{$fg[red]%}@%m%{$reset_color%}'
elif [[ -n $is_ssh ]]; then
  local user='%{$fg[yellow]%}%n%{$reset_color%}'
  local hostname='%{$fg[yellow]%}@%m%{$reset_color%}'
fi
if [[ -n $session_name ]]; then
  local tmux='%{$fg[magenta]%}tmux@$session_name%{$reset_color%}'
else
  local tmux='%{$fg[magenta]%}tmux%{$reset_color%}'
fi
local command='%(?.%{$fg[yellow]%}.%{$fg[red]%})❯%{$reset_color%}'
local directory='%{$fg[cyan]%}%~%{$reset_color%}'
PROMPT="${user}${hostname} ${directory} ${command} "
if [[ -n $is_tmux ]]; then
  PROMPT="${tmux} ${PROMPT}"
fi
