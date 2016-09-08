
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
set fish_color_autosuggestion 969896
set fish_color_command 3e999f
set fish_color_comment 969896
set fish_color_cwd 718c00
set fish_color_cwd_root c82829
set fish_color_end 718c00
set fish_color_error c82829
set fish_color_escape 3e999f
set fish_color_history_current 3e999f
set fish_color_host '-o'  '3e999f'
set fish_color_match 3e999f
set fish_color_normal d6d6d6
set fish_color_operator 3e999f
set fish_color_param 8959a8
set fish_color_quote 4271ae
set fish_color_redirection 718c00
set fish_color_search_match --background=8959a8
set fish_color_selection --background=8959a8
set fish_color_status c82829
set fish_color_user '-o'  '718c00'
set fish_color_valid_path --underline

set fish_prompt_pwd_dir_length 4

# base16 shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/yesterday.sh
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

