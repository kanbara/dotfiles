
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
set fish_color_autosuggestion 655d5d
set fish_color_command 5485b6
set fish_color_comment 655d5d
set fish_color_cwd 4b8b8b
set fish_color_cwd_root ca4949
set fish_color_end 4b8b8b
set fish_color_error ca4949
set fish_color_escape 5485b6
set fish_color_history_current 5485b6
set fish_color_host '-o'  '5485b6'
set fish_color_match 5485b6
set fish_color_normal 8a8585
set fish_color_operator 5485b6
set fish_color_param 8464c4
set fish_color_quote 7272ca
set fish_color_redirection 4b8b8b
set fish_color_search_match --background=8464c4
set fish_color_selection --background=8464c4
set fish_color_status ca4949
set fish_color_user '-o'  '4b8b8b'
set fish_color_valid_path --underline


# base16 shell
eval sh $HOME/.config/base16-shell/base16-atelierplateau.dark.sh

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

