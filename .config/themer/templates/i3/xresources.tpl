{# belongs in .themer/templates/i3/xresources.tpl #}
! vim: set ft=xdefaults:

URxvt.*font: xft:{{ xrsFont.title() }}:size={{ fontSize }}
! hintstyle hintfull
URxvt.*cursorColor: {{ white }}

URxvt.*scrollBar: False
URxvt.*iso14755: False
URxvt.*iso14755_52: False

URxvt.*background: {% if transparency %}[{{ transparency }}]{% endif %}{% if background %}{{ background }}{% else %}{{ black }}{% endif %}
URxvt.*foreground: {% if foreground %}{{ foreground }}{% else %}{{ white }}{% endif %}
! black
URxvt.*color0: {{ black }}
URxvt.*color8: {{ alt_black }}
! red
URxvt.*color1: {{ red }}
URxvt.*color9: {{ alt_red }}
! green
URxvt.*color2: {{ green }}
URxvt.*color10: {{ alt_green }}
! yellow
URxvt.*color3: {{ yellow }}
URxvt.*color11: {{ alt_yellow }}
! blue
URxvt.*color4: {{ blue }}
URxvt.*color12: {{ alt_blue }}
! magenta
URxvt.*color5: {{ magenta }}
URxvt.*color13: {{ alt_magenta }}
! cyan
URxvt.*color6: {{ cyan }}
URxvt.*color14: {{ alt_cyan }}
! white
URxvt.*color7: {{ white }}
URxvt.*color15: {{ alt_white }}
! underline when default
URxvt.*colorUL: {% if underline %}{{ underline }}{% else %}{{ white }}{% endif %}

URxvt*.perl-lib: /usr/lib64/URxvt/perl
URxvt*.perl-ext-common: default,matcher,searchable-scrollback
URxvt*.urlLauncher: /usr/bin/google-chrome
URxvt*.matcher.button: 1

URxvt*.matcher.rend.0: Uline Bold fg4

