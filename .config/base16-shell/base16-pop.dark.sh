#!/bin/sh
# Base16 Pop - Console color setup script
# Chris Kempson (http://chriskempson.com)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi


color00="00/00/00"
color01="eb/00/8a"
color02="37/b3/49"
color03="f8/ca/12"
color04="0e/5a/94"
color05="b3/1e/8d"
color06="00/aa/bb"
color07="d0/d0/d0"
color08="50/50/50"
color09="eb/00/8a"
color10="37/b3/49"
color11="f8/ca/12"
color12="0e/5a/94"
color13="b3/1e/8d"
color14="00/aa/bb"
color15="ff/ff/ff"
color16="f2/93/33"
color17="7a/2d/00"
color18="20/20/20"
color19="30/30/30"
color20="b0/b0/b0"
color21="e0/e0/e0"
color_foreground="d0/d0/d0"
color_background="00/00/00"
color_cursor="d0/d0/d0"

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
