function rme --wraps='gh pr list' --description 'alias rme=gh pr list --search review-requested:@me'
  gh pr list --search 'review-requested:@me' $argv
end
