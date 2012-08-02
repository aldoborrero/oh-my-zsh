# wild-hearted-son.zsh-theme
#
# Author: Aldo Borrero (@axold)
# URL: http://aldoborrero.com/
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/wild-hearted-son.zsh-theme
#
# Created on:       August 1, 2012
#
# Note: I decided to divide each part of the prompt in functions in order to keep sanity!

# FUNCTIONS {{{

function hostname {
    echo '%m: '
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo 'venv:'`basename $VIRTUAL_ENV`
}

function rbenv_info {
  local ruby_version
  ruby_version=$(rbenv version-name 2> /dev/null) || return
  echo "rbenv:$ruby_version"
}

function hg_prompt {
    hg prompt "hg:{branch}{status}" 2>/dev/null
}

ZSH_THEME_GIT_PROMPT_PREFIX="git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="+"
ZSH_THEME_GIT_PROMPT_CLEAN=""
function git_prompt {
    [ $(git_prompt_info) ] && echo "$(git_prompt_info)"
}

# Prompt status (red when something goes wrong, green otherwise)
# Inspired by: https://github.com/topfunky/zsh-simple/blob/master/.zshrc
local prompt_status="%(?,%{$fg[green]%}→%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

# }}}

PROMPT='
%{$fg[blue]%}$(hostname)%{$fg[yellow]%}%~%{$reset_color%}
${prompt_status} %{$reset_color%}'

RPROMPT='$(virtualenv_info) $(rbenv_info) $(hg_prompt) $(git_prompt)'