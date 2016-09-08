
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
set fish_color_autosuggestion 008751
set fish_color_command 29adff
set fish_color_comment 008751
set fish_color_cwd 00e756
set fish_color_cwd_root ff004d
set fish_color_end 00e756
set fish_color_error ff004d
set fish_color_escape 29adff
set fish_color_history_current 29adff
set fish_color_host '-o'  '29adff'
set fish_color_match 29adff
set fish_color_normal 5f574f
set fish_color_operator 29adff
set fish_color_param ff77a8
set fish_color_quote 83769c
set fish_color_redirection 00e756
set fish_color_search_match --background=ff77a8
set fish_color_selection --background=ff77a8
set fish_color_status ff004d
set fish_color_user '-o'  '00e756'
set fish_color_valid_path --underline

set fish_prompt_pwd_dir_length 4

# base16 shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/pico.sh
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

