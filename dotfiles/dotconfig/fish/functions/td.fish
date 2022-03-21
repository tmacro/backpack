function td --description 'Daily scratch directory manager'
    if test (count $argv) -eq 0
<<<<<<< HEAD
        cd (command today dir show)
=======
        cd (command td show)
>>>>>>> trunk
        return
    end
    command td $argv    
end
