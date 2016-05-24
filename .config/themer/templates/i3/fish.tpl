
set FLINE_PATH $HOME/.config/fish/fishline
source $FLINE_PATH/fishline.fish
source ~/.fishmarks/marks.fish

set -g -x PATH ~/bin ~/bin/AnypointStudio $PATH
set -g -x MULE_HOME ~/mule/mule-standalone-3.7.0
set -g -x JAVA_HOME /usr/lib/jvm/java-9-openjdk-amd64/

set -x LESS -R
set -x LESSOPEN '|~/.lessfilter %s'
set -x EDITOR vim

# colors
set fish_color_autosuggestion {{ alt_black }}
set fish_color_command {{ cyan }}
set fish_color_comment {{ alt_black }}
set fish_color_cwd {{ green }}
set fish_color_cwd_root {{ red }}
set fish_color_end {{ secondary }}
set fish_color_error {{ red }}
set fish_color_escape {{ cyan }}
set fish_color_history_current {{ cyan }}
set fish_color_host '-o'  '{{ cyan }}'
set fish_color_match {{ cyan }}
set fish_color_normal {{ white }}
set fish_color_operator {{ cyan }}
set fish_color_param {{ magenta }}
set fish_color_quote {{ blue }}
set fish_color_redirection {{ alt_green }}
set fish_color_search_match --background={{ magenta }}
set fish_color_selection --background={{ magenta }}
set fish_color_status {{ red }}
set fish_color_user '-o'  '{{ green }}'
set fish_color_valid_path --underline


# base16 shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/{{ themeName }}.sh
end

source $FLINE_PATH/themes/jay.fish

function fish_prompt
   fishline -s $status USERHOST HYBRIDPWD WRITE SIGSTATUS N ARROW
end

function fish_right_prompt
    fishline -s 0 -r GIT VFISH CLOCK
end

set -g -x PATH ~/.pyenv/bin $PATH
set -g -x VIRTUAL_ENV_DISABLE_PROMPT 1
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)


