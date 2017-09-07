function git_branch {
    branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (*\([^)]*\))*/\1/')
    if [[ -n $branch ]]; then
        if [[ -z $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
            echo -e " \[\e[32m\](${branch})\[\e[0m\]"
        else
            echo -e " \[\e[31m\](${branch}*)\[\e[0m\]"
        fi  
    fi  
}

function pre_prompt {
    code=$?
    shell_char="\[\e[32m\]%\[\e[0m\]"
    if [[ $code != 0 ]]; then
        shell_char="\[\e[35m\]%\[\e[0m\]"
    fi  
    export PS1="\[\e[33m\]taha@\h\[\e[0m\] \[\e[34m\][\w]\[\e[0m\]$(git_branch)\n${shell_char} "
}

PROMPT_COMMAND=pre_prompt
export TERM=xterm-256color

