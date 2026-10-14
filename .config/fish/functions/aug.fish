function aug --description 'Drop into the augmento dev container (fish)'
    # --project-directory keeps the automatic compose.override.yaml merge, which
    # carries the personal mounts; an explicit -f would drop it.
    docker compose --project-directory /home/nini/augmento exec dev fish $argv
end
