#!/usr/bin/fish

for i in (ls *.cpp.no)
        yes "n" | themer generate $i $i
    end

