if [ $UID -eq 0 ]; then
  local hostcolor="red"
else
  local hostcolor="blue"
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

local decorator_top="%{$fg[$hostcolor]%}%B┌─%{$reset_color%}"
local decorator_btm="%{$fg[$hostcolor]%}%B└─%{$reset_color%}"
local bracket_left="%{$fg[$hostcolor]%}%B[%{$reset_color%}"
local bracket_right="%{$fg[$hostcolor]%}%B]%{$reset_color%}"
local username="%{$fg_bold[green]%}%n%{$reset_color%}"
local at="%{$fg_bold[blue]%}@%{$reset_color%}"
local hostname="%{$fg_bold[cyan]%}%m%{$reset_color%}"
local current_dir="%{$fg_bold[white]%}%~%{$reset_color%}"
local return_code="%(?.%{$fg_bold[magenta]%}$.%{$fg[red]%}%?)%{$reset_color%}"

local prompt_hostinfo="${bracket_left}${username}${at}${hostname}${bracket_right}"
local prompt_dirinfo="${bracket_left}${current_dir}${bracket_right}"
local prompt_current_time="${bracket_left}%*${bracket_right}"
local prompt_prompt="${bracket_left}${return_code}${bracket_right}"

PROMPT="${decorator_top}${prompt_hostinfo} - ${prompt_dirinfo} "'$(git_prompt_info)'"
${decorator_btm}${prompt_prompt} "
RPROMPT="${prompt_current_time}"
PS2=" %{$fg[blue]%}%B>%{$reset_color%}%b "
