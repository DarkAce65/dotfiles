if [[ $UID -eq 0 ]]; then
    local user_host='%{$fg[red]%}%n%{$reset_color%}'
else
    local user_host='%{$fg[magenta]%}%n%{$reset_color%}'
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="${user_host} %{$fg[white]%}[%2~] ${git_branch}%{$fg[blue]%}─╼%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
