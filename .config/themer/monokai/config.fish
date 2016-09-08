
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
set fish_color_autosuggestion 75715e
set fish_color_command a1efe4
set fish_color_comment 75715e
set fish_color_cwd a6e22e
set fish_color_cwd_root f92672
set fish_color_end a6e22e
set fish_color_error f92672
set fish_color_escape a1efe4
set fish_color_history_current a1efe4
set fish_color_host '-o'  'a1efe4'
set fish_color_match a1efe4
set fish_color_normal f8f8f2
set fish_color_operator a1efe4
set fish_color_param ae81ff
set fish_color_quote 66d9ef
set fish_color_redirection a6e22e
set fish_color_search_match --background=ae81ff
set fish_color_selection --background=ae81ff
set fish_color_status f92672
set fish_color_user '-o'  'a6e22e'
set fish_color_valid_path --underline

set fish_prompt_pwd_dir_length 4

# base16 shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/monokai.sh
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

