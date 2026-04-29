function pme --wraps='gh pr list' --description 'alias pme=gh pr list --author=@me'
  gh pr list --author=@me $argv
end
