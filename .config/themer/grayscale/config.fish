
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
set fish_color_autosuggestion 525252
set fish_color_command 868686
set fish_color_comment 525252
set fish_color_cwd 8e8e8e
set fish_color_cwd_root 7c7c7c
set fish_color_end 8e8e8e
set fish_color_error 7c7c7c
set fish_color_escape 868686
set fish_color_history_current 868686
set fish_color_host '-o'  '868686'
set fish_color_match 868686
set fish_color_normal b9b9b9
set fish_color_operator 868686
set fish_color_param 747474
set fish_color_quote 686868
set fish_color_redirection 8e8e8e
set fish_color_search_match --background=747474
set fish_color_selection --background=747474
set fish_color_status 7c7c7c
set fish_color_user '-o'  '8e8e8e'
set fish_color_valid_path --underline

set fish_prompt_pwd_dir_length 4

# base16 shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/grayscale.sh
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

