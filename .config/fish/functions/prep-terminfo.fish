function prep-terminfo
   if test $argv != ""
      echo "ssh $argv[1] 'mkdir -p ~/.terminfo/r/'"
      ssh $argv[1] 'mkdir -p ~/.terminfo/r/'
      echo "scp /usr/share/terminfo/r/rxvt-unicode-256color $argv[1]:.terminfo/r/"
      scp /usr/share/terminfo/r/rxvt-unicode-256color $argv[1]:.terminfo/r/
   end
end

