function fish_prompt --description 'Write out the prompt'
    if set -l git_branch (command git symbolic-ref HEAD 2>/dev/null | string replace refs/heads/ '')
        set git_branch (set_color -o B4BEFE)"$git_branch"
        set -l git_status
        if not command git diff-index --quiet HEAD --
            if set -l count (command git rev-list --count --left-right $upstream...HEAD 2>/dev/null)
               echo $count | read -l ahead behind
                if test "$ahead" -gt 0
                    set git_status "$git_status"(set_color -o red)⬆
                end
                if test "$behind" -gt 0
                    set git_status "$git_status"(set_color -o red)⬇
                end
            end
            for i in (git status --porcelain | string sub -l 2 | sort | uniq)
                 set git_status "$git_status"(set_color -o 89B4FA)"*"
            end
        end
        set git_info "  $git_branch$git_status"
    end

    # Disable PWD shortening by default.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    printf '%s%s%s%s%s%s%s%s%s%s%s%s%s' (set_color -o ACB0BE) '  ' (set_color 89B4FA) $USER (set_color ACB0BE) ' ' (set_color F5C2E7) (prompt_pwd) (set_color B4BEFE) $git_info (set_color ACB0BE) " ≡"
    echo \n" "
end
