
set FLINE_PATH $HOME/.config/fish/fishline
source $FLINE_PATH/init.fish
source ~/.fishmarks/marks.fish

set -g -x PATH ~/bin ~/bin/AnypointStudio $PATH
set -g -x MULE_HOME ~/pl/mule/mule-standalone-3.7.0
set -g -x JAVA_HOME /usr/lib/jvm/oracle_jdk8
set -g -x ECLIPSE_HOME ~/pl/eclipse

set -x LESS -R
set -x LESSOPEN '|~/.lessfilter %s'
set -x EDITOR vim

# colors
set fish_color_autosuggestion 5f5a60
set fish_color_command afc4db
set fish_color_comment 5f5a60
set fish_color_cwd 8f9d6a
set fish_color_cwd_root cf6a4c
set fish_color_end 8f9d6a
set fish_color_error cf6a4c
set fish_color_escape afc4db
set fish_color_history_current afc4db
set fish_color_host '-o'  'afc4db'
set fish_color_match afc4db
set fish_color_normal a7a7a7
set fish_color_operator afc4db
set fish_color_param 9b859d
set fish_color_quote 7587a6
set fish_color_redirection 8f9d6a
set fish_color_search_match --background=9b859d
set fish_color_selection --background=9b859d
set fish_color_status cf6a4c
set fish_color_user '-o'  '8f9d6a'
set fish_color_valid_path --underline

set fish_prompt_pwd_dir_length 4

# base16 shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/twilight.sh
end

source $FLINE_PATH/themes/jay.fish

function fish_prompt
   fishline -s $status USERHOST PWD WRITE SIGSTATUS N ARROW
end

function fish_right_prompt
    fishline -s 0 -r GIT VFISH CLOCK
end

set -g -x PATH ~/.pyenv/bin $PATH
set -g -x VIRTUAL_ENV_DISABLE_PROMPT 1
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

