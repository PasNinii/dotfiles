function dkb --wraps='docker exec -it spinapp env TERM=xterm-256color script -q -c "cd /app/spinapp && /bin/zsh"' --description 'alias dkb=docker exec -it spinapp env TERM=xterm-256color script -q -c "cd /app/spinapp && /bin/zsh"'
  docker exec -it spinapp env TERM=xterm-256color script -q -c "cd /app/spinapp && /bin/zsh" $argv
        
end
