PROMPT='%n@%m%(1j. %{$fg_bold[magenta]%}%j%{$reset_color%}%{$fg[magenta]%}&%{$reset_color%}.) %{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info)$(git_prompt_ahead)%(?.. ?%{$fg[red]%}%?%{$reset_color%}) \$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" git:%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%},%{$fg[yellow]%}dirty%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD=",%{$fg[red]%}unpushed%{$reset_color%}"
