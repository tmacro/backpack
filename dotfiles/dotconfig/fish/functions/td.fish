function td --description 'Daily scratch directory manager'
    if test (count $argv) -eq 0
        cd (command td show)
        return
    end
    command td $argv    
end
