function ld --wraps='sudo sysctl -w net.ipv4.ip_forward=1' --description 'alias ld=sudo sysctl -w net.ipv4.ip_forward=1'
  sudo sysctl -w net.ipv4.ip_forward=1 $argv
        
end
