
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
set fish_color_autosuggestion 65737e
set fish_color_command 5fb3b3
set fish_color_comment 65737e
set fish_color_cwd 99c794
set fish_color_cwd_root ec5f67
set fish_color_end 99c794
set fish_color_error ec5f67
set fish_color_escape 5fb3b3
set fish_color_history_current 5fb3b3
set fish_color_host '-o'  '5fb3b3'
set fish_color_match 5fb3b3
set fish_color_normal c0c5ce
set fish_color_operator 5fb3b3
set fish_color_param c594c5
set fish_color_quote 6699cc
set fish_color_redirection 99c794
set fish_color_search_match --background=c594c5
set fish_color_selection --background=c594c5
set fish_color_status ec5f67
set fish_color_user '-o'  '99c794'
set fish_color_valid_path --underline

set fish_prompt_pwd_dir_length 4

# base16 shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/oceanicnext.sh
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

