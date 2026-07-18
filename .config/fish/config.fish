if status is-interactive
    # Strip bold (01;) and trailing ;01 from default LS_COLORS so ls output isn't bold
    set --export LS_COLORS (dircolors -b | sed -E "s/01;//g; s/;01//g" | string match -rg "'(.*)'")
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH "$HOME/.local/bin" $PATH

# Git/shell aliases. Resolved relative to this file so it works from any HOME
# (host or the martivent container, which sources this repo's config.fish).
set -l here (status dirname)
test -f $here/aliases.fish; and source $here/aliases.fish
