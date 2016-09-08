
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
set fish_color_autosuggestion 6c6c66
set fish_color_command c6c5fe
set fish_color_comment 6c6c66
set fish_color_cwd a8ff60
set fish_color_cwd_root ff6c60
set fish_color_end a8ff60
set fish_color_error ff6c60
set fish_color_escape c6c5fe
set fish_color_history_current c6c5fe
set fish_color_host '-o'  'c6c5fe'
set fish_color_match c6c5fe
set fish_color_normal b5b3aa
set fish_color_operator c6c5fe
set fish_color_param ff73fd
set fish_color_quote 96cbfe
set fish_color_redirection a8ff60
set fish_color_search_match --background=ff73fd
set fish_color_selection --background=ff73fd
set fish_color_status ff6c60
set fish_color_user '-o'  'a8ff60'
set fish_color_valid_path --underline

set fish_prompt_pwd_dir_length 4

# base16 shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/irblack.sh
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

