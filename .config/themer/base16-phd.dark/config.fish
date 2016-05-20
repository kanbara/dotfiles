
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
set fish_color_autosuggestion 717885
set fish_color_command 72b9bf
set fish_color_comment 717885
set fish_color_cwd 99bf52
set fish_color_cwd_root d07346
set fish_color_end 99bf52
set fish_color_error d07346
set fish_color_escape 72b9bf
set fish_color_history_current 72b9bf
set fish_color_host '-o'  '72b9bf'
set fish_color_match 72b9bf
set fish_color_normal b8bbc2
set fish_color_operator 72b9bf
set fish_color_param 9989cc
set fish_color_quote 5299bf
set fish_color_redirection 99bf52
set fish_color_search_match --background=9989cc
set fish_color_selection --background=9989cc
set fish_color_status d07346
set fish_color_user '-o'  '99bf52'
set fish_color_valid_path --underline


# base16 shell
eval sh $HOME/.config/base16-shell/base16-phd.dark.sh

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

