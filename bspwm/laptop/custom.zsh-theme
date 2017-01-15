if [[ $UID -eq 0 ]]; then
	local user_host='%{$fg[red]%}%n%{$reset_color%}'
else
	local user_host='%{$fg[yellow]%}%n%{$reset_color%}'
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'
local battery='$(acpi -b | grep "Battery 0" | grep -o "[0-9]\+%")%'

PROMPT="${user_host} [%B%2~%b] ${git_branch}%{$fg[blue]%}─╼%{$reset_color%} "
RPROMPT="%{$fg[cyan]%}%B%m%b%{$fg[cyan]%}: [${battery}]%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
