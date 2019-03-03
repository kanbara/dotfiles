function k
    set -lx KUBECONFIG ~/.kube/moia-$argv[1]
    eval $argv[2..-1]
end

