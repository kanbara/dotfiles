#!/bin/sh
#
# format colors from #FFAA33 => FFAA33FF for i3lock format
echo "Modifying " $@
sed -i 's/#\([0-9a-fA-F]\{6\}\)/\1/g' $@
