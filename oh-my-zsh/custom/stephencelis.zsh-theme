PROMPT=$'%2~$(git_prompt_info)$(git_prompt_ahead) %% '

RPROMPT=$'%{${fg[white]}%}\$RUBY_VERSION%{${reset_color}%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$bold_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{${fg[yellow]}%}!%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_CLEAN=""
