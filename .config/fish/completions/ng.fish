# Angular CLI ships bash/zsh completion only, but it is yargs-based underneath:
# `ng --get-yargs-completions <argv...>` returns the candidates for the last token.
# Spoofing SHELL=zsh makes yargs emit "value:description" instead of bare values.

function __ng_complete
    set -l tokens (commandline -xpc)
    set -l cur (commandline -ct)
    test (count $cur) -eq 0; and set cur ""

    set -l raw (env SHELL=zsh ng --get-yargs-completions $tokens $cur 2>/dev/null)
    set -l results

    for line in $raw
        # yargs writes workspace/builder errors and a synthetic "$0" entry into the same stream
        string match -q -- 'Error:*' $line; and continue
        string match -q -- '$0:*' $line; and continue
        test -n "$line"; or continue

        set -l parts (string split -m 1 ':' -- $line)
        if test (count $parts) -eq 2
            set -a results (printf '%s\t%s' $parts[1] (string sub -l 70 -- $parts[2]))
        else
            set -a results $line
        end
    end

    if test (count $results) -eq 0
        __fish_complete_path $cur
    else
        printf '%s\n' $results
    end
end

complete -c ng -f -a '(__ng_complete)'
