{# belongs in .themer/templates/i3/xresources.tpl #}
! vim: set ft=xdefaults:

xterm*faceName: {{xrsFont.title() }}:size={{ fontSize }}
*.font: xft:{{ xrsFont.title() }}:size={{ fontSize }}
! hintstyle hintfull
*.cursorColor: {{ white }}

*.scrollBar: False
*.iso14755: False
*.iso14755_52: False

*.background: {% if transparency %}[{{ transparency }}]{% endif %}{% if background %}{{ background }}{% else %}{{ black }}{% endif %}
*.foreground: {% if foreground %}{{ foreground }}{% else %}{{ white }}{% endif %}
! black
*.color0: {{ black }}
*.color8: {{ alt_black }}
! red
*.color1: {{ red }}
*.color9: {{ alt_red }}
! green
*.color2: {{ green }}
*.color10: {{ alt_green }}
! yellow
*.color3: {{ yellow }}
*.color11: {{ alt_yellow }}
! blue
*.color4: {{ blue }}
*.color12: {{ alt_blue }}
! magenta
*.color5: {{ magenta }}
*.color13: {{ alt_magenta }}
! cyan
*.color6: {{ cyan }}
*.color14: {{ alt_cyan }}
! white
*.color7: {{ white }}
*.color15: {{ alt_white }}
! underline when default
*.colorUL: {% if underline %}{{ underline }}{% else %}{{ white }}{% endif %}

.*perl-lib: /usr/lib64/URxvt/perl
.*perl-ext-common: default,matcher,searchable-scrollback
.*urlLauncher: /usr/bin/google-chrome
.*matcher.button: 1

.*matcher.rend.0: Uline Bold fg4

