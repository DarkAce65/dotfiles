if [[ $UID -eq 0 ]]; then
    local user_host='%{$fg[red]%}%n@%m%{$reset_color%}'
else
    local user_host='%{$fg[green]%}%n@%m%{$reset_color%}'
fi

local current_dir='%{$fg_bold[blue]%}%2~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="${user_host}:${current_dir}${git_branch} %B$%b "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
