# Fish port of the git/shell aliases from ~/.aliases (zsh). Sourced from
# config.fish, so it loads both on the host and inside the martivent dev
# container (whose config sources this repo's config.fish).
#
# Aliases that already have dedicated function files in ./functions/ (gaa, gc,
# gco, gd, gmm, gph, gpl, pme, rme) are intentionally NOT redefined here.

# ── generic ──────────────────────────────────────────────────────────────
alias rm 'rm -i'
alias mv 'mv -i'
alias cp 'cp -i'

# ── docker ───────────────────────────────────────────────────────────────
alias dcs "docker ps -a --format '{{.Names}}'"

# ── git: diff ────────────────────────────────────────────────────────────
alias gd. 'git diff -M --color-words="."'
alias gdc 'git diff --cached -M'
alias gdc. 'git diff --cached -M --color-words="."'

# ── git: add / commit ────────────────────────────────────────────────────
alias ga 'git add'
alias gap 'git add -p'
alias gca 'git commit --amend'
alias gcm 'git commit -m "merge(master)"'

# ── git: branch / checkout ───────────────────────────────────────────────
alias gcb 'git checkout -b'
alias gcop 'git checkout -'
alias gbd 'git branch -d'
alias gbm 'git branch -m'
alias gbr 'git branch -v'

# ── git: fetch / remote / cherry-pick / copilot ──────────────────────────
alias gf 'git fetch'
alias grv 'git remote -v'
alias gch 'git cherry-pick'
alias ghc 'gh copilot explain'

# ── git: show ────────────────────────────────────────────────────────────
alias gs 'git show'
alias gs. 'git show --color-words="."'

# ── git: stash ───────────────────────────────────────────────────────────
alias gst 'git stash'
alias gstp 'git stash pop'
alias gsi 'git stash --include-untracked'
alias gsp 'git stash pop'

# ── git: merge ───────────────────────────────────────────────────────────
alias gm 'git merge --no-ff'
alias gmf 'git merge --ff-only'

# ── git: rebase ──────────────────────────────────────────────────────────
alias grb 'git rebase -p'
alias grba 'git rebase --abort'
alias grbc 'git rebase --continue'
alias grbi 'git rebase -i'

# ── git: reset ───────────────────────────────────────────────────────────
alias gr 'git reset'
alias grh 'git reset --hard'
alias grsh 'git reset --soft HEAD~'

# ── pull many repos in the current directory ─────────────────────────────
alias pullall "ls | xargs -I{} git -C {} pull"

# ── git helpers that need real logic ─────────────────────────────────────
function git_current_branch --description 'name of the current branch'
    git rev-parse --abbrev-ref HEAD 2>/dev/null
end

function s --description 'short git status'
    git status -sb $argv
    return 0
end

function glog --description 'pretty one-line git log'
    git log --date-order \
        --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset" $argv
end

function gl --description 'pretty git log, graph'
    glog --graph $argv
end

function gla --description 'pretty git log, graph, all refs'
    gl --all $argv
end

function gls --description 'search history for a regex (git pickaxe)'
    set -l query $argv[1]
    set -e argv[1]
    glog --pickaxe-regex "-S$query" $argv
end

function gpthis --description 'push the current branch to origin'
    git push origin (git_current_branch) $argv
end

function gpthisu --description 'push the current branch to origin, set upstream'
    git push --set-upstream origin (git_current_branch) $argv
end

function git-new --description 'mkdir + git init + empty .gitignore commit'
    set -l dir $argv[1]
    if test -z "$dir"
        echo "usage: git-new <dir>"
        return 1
    end
    test -d $dir; or mkdir $dir
    and cd $dir
    and git init
    and touch .gitignore
    and git add .gitignore
    and git commit -m "Add .gitignore."
end

function k --description 'kill the process listening on PORT (default 4200)'
    set -l port 4200
    test -n "$argv[1]"; and set port $argv[1]
    set -l pids (lsof -ti "tcp:$port" 2>/dev/null)
    if test -n "$pids"
        kill $pids
    else
        echo "nothing listening on port $port"
    end
end
