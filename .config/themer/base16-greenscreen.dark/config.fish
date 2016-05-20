
set FLINE_PATH $HOME/.config/fish/fishline
source $FLINE_PATH/fishline.fish
#source $FLINE_PATH/themes/tty-compatible.fish
source ~/.fishmarks/marks.fish

set -g -x PATH ~/bin ~/bin/AnypointStudio $PATH
set -g -x MULE_HOME ~/mule/mule-standalone-3.7.0
#set -g -x JAVA_HOME /usr/java/jdk1.8.0_05/jre
#set FLCLR_USERHOST_FG cyan
set -g -x JAVA_HOME /usr/lib64/jvm/java-1.7.0-openjdk-1.7.0/jre

set -x LESS -R
set -x LESSOPEN '|~/.lessfilter %s'
set -x EDITOR vim

# colors
set fish_color_autosuggestion 007700
set fish_color_command 005500
set fish_color_comment 007700
set fish_color_cwd 00bb00
set fish_color_cwd_root 007700
set fish_color_end 00bb00
set fish_color_error 007700
set fish_color_escape 005500
set fish_color_history_current 005500
set fish_color_host '-o'  '005500'
set fish_color_match 005500
set fish_color_normal 00bb00
set fish_color_operator 005500
set fish_color_param 00bb00
set fish_color_quote 009900
set fish_color_redirection 00bb00
set fish_color_search_match --background=00bb00
set fish_color_selection --background=00bb00
set fish_color_status 007700
set fish_color_user '-o'  '00bb00'
set fish_color_valid_path --underline


# base16 shell
eval sh $HOME/.config/base16-shell/base16-greenscreen.dark.sh

source $FLINE_PATH/themes/jay.fish

function fish_prompt
   fishline -s $status USERHOST HYBRIDPWD WRITE SIGSTATUS N ARROW
end

function fish_right_prompt
    fishline -s 0 -r GIT VFISH CLOCK
end

set -x PATH "/home/BLACKBRIDGE/jay.morrow/.pyenv/bin" $PATH
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

