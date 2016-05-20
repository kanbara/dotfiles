
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
set fish_color_autosuggestion 665c54
set fish_color_command 8ba59b
set fish_color_comment 665c54
set fish_color_cwd 95c085
set fish_color_cwd_root fb543f
set fish_color_end 95c085
set fish_color_error fb543f
set fish_color_escape 8ba59b
set fish_color_history_current 8ba59b
set fish_color_host '-o'  '8ba59b'
set fish_color_match 8ba59b
set fish_color_normal a89984
set fish_color_operator 8ba59b
set fish_color_param 8f4673
set fish_color_quote 0d6678
set fish_color_redirection 95c085
set fish_color_search_match --background=8f4673
set fish_color_selection --background=8f4673
set fish_color_status fb543f
set fish_color_user '-o'  '95c085'
set fish_color_valid_path --underline


# base16 shell
eval sh $HOME/.config/base16-shell/base16-darktooth.dark.sh

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

