function root-prep-terminfo
   if test $argv != ""
      echo "scp /usr/share/terminfo/r/rxvt-unicode-256color $argv[1]:/usr/share/terminfo/r/"
      scp /usr/share/terminfo/r/rxvt-unicode-256color $argv[1]:/usr/share/terminfo/r/
   end
end

