# ! vim: ft=conf:
# i3blocks config file
#
# Please see man i3blocks for a complete reference!
# The man page is also hosted at http://vivien.github.io/i3blocks
#
# List of valid properties:
#
# align
# color
# command
# full_text
# instance
# interval
# label
# min_width
# name
# separator
# separator_block_width
# short_text
# signal
# urgent

# Global properties
#
# The top properties below are applied to every block, but can be overridden.
# Each block command defaults to the script name to avoid boilerplate.
command=$HOME/.config/i3blocks/scripts/$BLOCK_NAME
separator_block_width=5
full_text=-
color={{ white }}
# full_text=<span font="14"></span>
markup=pango


[theme]
interval=once

# Volume indicator
#
# The first parameter sets the step (and units to display)
# The second parameter overrides the mixer selection
# See the script for details.
[volume]
full_text=
label=VOL
instance=Master
interval=once
signal=10

[separator]
color={{ secondary }}

#CPU usage
#
# The script may be called with -w and -c switches to specify thresholds,
# see the script for details.
[cpu_usage]
full_text=
align=center
label=CPU
interval=10
min_width=100.00%

[separator]
full_text=+
color={{ special }}

[time]
full_text=
label=BER
command=date '+%a %d %b %R %z'
interval=5

[separator]
full_text=/
color={{ tertiary }}

[timeny]
full_text=
label=NY
interval=5

[separator]
full_text=/
color={{ tertiary }}

[timesf]
full_text=
label=SF
interval=5

