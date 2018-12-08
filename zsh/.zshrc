#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

function virtualenv_info {
  [[ -n "$VIRTUAL_ENV" ]] && echo '(%F{yellow}'${VIRTUAL_ENV:t}'%f) '
}

export VISUAL="vim"
export PROMPT_LEAN_COLOR="7" PROMPT_LEAN_COLOR2="4"
export PROMPT_LEAN_LEFT=virtualenv_info
export RANGER_LOAD_DEFAULT_RC=false
export FZF_DEFAULT_COMMAND="fd --type f"

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
