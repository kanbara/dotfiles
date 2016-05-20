
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
set fish_color_autosuggestion 5c5855
set fish_color_command b5e4f4
set fish_color_comment 5c5855
set fish_color_cwd 01a252
set fish_color_cwd_root db2d20
set fish_color_end 01a252
set fish_color_error db2d20
set fish_color_escape b5e4f4
set fish_color_history_current b5e4f4
set fish_color_host '-o'  'b5e4f4'
set fish_color_match b5e4f4
set fish_color_normal a5a2a2
set fish_color_operator b5e4f4
set fish_color_param a16a94
set fish_color_quote 01a0e4
set fish_color_redirection 01a252
set fish_color_search_match --background=a16a94
set fish_color_selection --background=a16a94
set fish_color_status db2d20
set fish_color_user '-o'  '01a252'
set fish_color_valid_path --underline


# base16 shell
eval sh $HOME/.config/base16-shell/base16-3024.dark.sh

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

