function av
    aws-vault exec $argv[1] -- $argv[2..-1]
end

