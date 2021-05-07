
function td --description 'Daily scratch directory manager'
    argparse --name=td 'h/help' 'q/quiet' 'd#' -- $argv
    or return

    if set -q _flag_help
        echo "td [-h|--help] [-q|--quiet] [-<days>]"
        return 0
    end

    set td $TD

    if set -q _flag_d
        set -l past_date (command date -d "-$_flag_d days" +'%Y.%m.%d')
        set td $HOME/scratch/$past_date
        if test ! -d $td
            if ! set -q _flag_quiet
                echo "No scratch entry for $past_date"
            end
            return
        end
    else
        command ln -s -f -T $td "$HOME/desktop"
    end
    mkdir -p $td
    if ! set -q _flag_quiet
        cd $td
    end
end
