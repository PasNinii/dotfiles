function martisetup --description 'Build/start the martivent dev stack, then drop into the container'
    set -l compose /home/nini/martigua/martivent/docker-compose.dev.yml
    docker compose -f $compose up -d --build
    and docker compose -f $compose exec dev fish $argv
end
