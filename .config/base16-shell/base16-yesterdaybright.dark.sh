#!/bin/sh
# Base16 3024 - Shell color setup script
# Jan T. Sott (http://github.com/idleberg)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="34/3d/46"
color01="d5/4e/53"
color02="b9/ca/4a"
color03="e7/c5/47"
color04="7a/a6/da"
color05="c3/97/d8"
color06="70/c0/b1"
color07="df/e1/e8"
color08="a7/ad/ba"
color09="d5/4e/53"
color10="b9/ca/4a"
color11="e7/c5/47"
color12="7a/a6/da"
color13="c3/97/d8"
color14="70/c0/b1"
color15="ff/ff/ff"
color16="e7/8c/45"
color17="9a/80/6d"
color18="4f/5b/66"
color19="65/73/7e"
color20="c0/c5/ce"
color21="ef/f1/f5"
color_foreground="df/e1/e8"
color_background="34/3d/46"
color_cursor="df/e1/e8"

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
  printf $printf_template_custom Pg a5a2a2 # forground
  printf $printf_template_custom Ph 090300 # background
  printf $printf_template_custom Pi a5a2a2 # bold color
  printf $printf_template_custom Pj 4a4543 # selection color
  printf $printf_template_custom Pk a5a2a2 # selected text color
  printf $printf_template_custom Pl a5a2a2 # cursor
  printf $printf_template_custom Pm 090300 # cursor text
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
