#!/bin/sh
# Base16 Atelier Dune - Shell color setup script
# Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/dune)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="1b/18/18"
color01="ca/49/49"
color02="4b/8b/8b"
color03="a0/6e/3b"
color04="72/72/ca"
color05="84/64/c4"
color06="54/85/b6"
color07="8a/85/85"
color08="65/5d/5d"
color09="ca/49/49"
color10="4b/8b/8b"
color11="a0/6e/3b"
color12="72/72/ca"
color13="84/64/c4"
color14="54/85/b6"
color15="f4/ec/ec"
color16="b4/5a/3c"
color17="bd/51/87"
color18="29/24/24"
color19="58/50/50"
color20="7e/77/77"
color21="e7/df/df"
color_foreground="8a/85/85"
color_background="1b/18/18"
color_cursor="8a/85/85"

if [ -n "$TMUX" ]; then
  # tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg a6a28c # forground
  printf $printf_template_custom Ph 20201d # background
  printf $printf_template_custom Pi a6a28c # bold color
  printf $printf_template_custom Pj 6e6b5e # selection color
  printf $printf_template_custom Pk a6a28c # selected text color
  printf $printf_template_custom Pl a6a28c # cursor
  printf $printf_template_custom Pm 20201d # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_var 12 $color_cursor
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
unset color_cursor
