#!/bin/sh
# Base16 Ocean - Shell color setup script
# Chris Kempson (http://chriskempson.com)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="1B/2B/34"
color01="EC/5f/67"
color02="99/C7/94"
color03="FA/C8/63"
color04="66/99/CC"
color05="C5/94/C5"
color06="5F/B3/B3"
color07="C0/C5/CE"
color08="65/73/7E"
color09="EC/5f/67"
color10="99/C7/94"
color11="FA/C8/63"
color12="66/99/CC"
color13="C5/94/C5"
color14="5F/B3/B3"
color15="D8/DE/E9"
color16="F9/91/57"
color17="AB/79/67"
color18="34/3D/46"
color19="4F/5B/66"
color20="A7/AD/BA"
color21="CD/D3/DE"
color_foreground="C0/C5/CE"
color_background="1B/2B/34"
color_cursor="C0/C5/CE"

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
  printf $printf_template_custom Pg c0c5ce # forground
  printf $printf_template_custom Ph 2b303b # background
  printf $printf_template_custom Pi c0c5ce # bold color
  printf $printf_template_custom Pj 4f5b66 # selection color
  printf $printf_template_custom Pk c0c5ce # selected text color
  printf $printf_template_custom Pl c0c5ce # cursor
  printf $printf_template_custom Pm 2b303b # cursor text
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
