status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# Base16 Shell
#  if status --is-interactive
#      base16-manager set-random
# end

 set -Ux LESSOPEN '|-~/.config/highlight-less-wrapper "%s"'
 set -Ux LESS -FMRXis
