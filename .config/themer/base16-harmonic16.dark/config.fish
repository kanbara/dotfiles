
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
set fish_color_autosuggestion 627e99
set fish_color_command 568bbf
set fish_color_comment 627e99
set fish_color_cwd 56bf8b
set fish_color_cwd_root bf8b56
set fish_color_end 56bf8b
set fish_color_error bf8b56
set fish_color_escape 568bbf
set fish_color_history_current 568bbf
set fish_color_host '-o'  '568bbf'
set fish_color_match 568bbf
set fish_color_normal cbd6e2
set fish_color_operator 568bbf
set fish_color_param bf568b
set fish_color_quote 8b56bf
set fish_color_redirection 56bf8b
set fish_color_search_match --background=bf568b
set fish_color_selection --background=bf568b
set fish_color_status bf8b56
set fish_color_user '-o'  '56bf8b'
set fish_color_valid_path --underline


# base16 shell
eval sh $HOME/.config/base16-shell/base16-harmonic16.dark.sh

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

