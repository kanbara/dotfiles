#!/bin/sh
# Base16 3024 - Shell color setup script
# Jan T. Sott (http://github.com/idleberg)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="1d/1f/21"
color01="c8/28/29"
color02="71/8c/00"
color03="ea/b7/00"
color04="42/71/ae"
color05="89/59/a8"
color06="3e/99/9f"
color07="d6/d6/d6"
color08="96/98/96"
color09="c8/28/29"
color10="71/8c/00"
color11="ea/b7/00"
color12="42/71/ae"
color13="89/59/a8"
color14="3e/99/9f"
color15="ff/ff/ff"
color16="f5/87/1f"
color17="7f/2a/1d"
color18="28/2a/2e"
color19="4d/4d/4c"
color20="8e/90/8c"
color21="ef/ef/ef"
color_foreground="d6/d6/d6"
color_background="1d/1f/21"
color_cursor="d6/d6/d6"

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