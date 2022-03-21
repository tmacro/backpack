function td --description "Wrapper for today dir"
    if count $argv > /dev/null
        command td $argv
    else
        cd (command today dir show)
    end
end
