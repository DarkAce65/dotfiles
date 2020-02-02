# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install

function virtualenv_info {
  [[ -n "$VIRTUAL_ENV" ]] && echo '(%F{yellow}'${VIRTUAL_ENV:t}'%f) '
}

fpath=(~/.zsh/completion $fpath)
export VISUAL="vim"
export PROMPT_LEAN_COLOR="7" PROMPT_LEAN_COLOR2="4"
export PROMPT_LEAN_LEFT=virtualenv_info
export RANGER_LOAD_DEFAULT_RC=false
export FZF_DEFAULT_COMMAND="fd --type f"
