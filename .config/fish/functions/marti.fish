function marti --description 'Drop into the martivent dev container (fish)'
    # Absolute -f path so this works from any directory on the host.
    docker compose \
        -f /home/nini/martigua/martivent/docker-compose.dev.yml \
        exec dev fish $argv
end
