function martisetup --description 'Build/start the martivent dev stack, wait for bootstrap, then drop into the container'
    set -l compose /home/nini/martigua/martivent/docker-compose.dev.yml
    docker compose -f $compose up -d --build; or return
    # The container entrypoint bootstraps the venv, node_modules and git hooks
    # asynchronously, so `up -d` returns before they're ready. Wait for the marker
    # (capped at 180s) so the shell lands in a prepared environment.
    echo "Waiting for dev container bootstrap…"
    for i in (seq 180)
        docker compose -f $compose exec -T dev test -f /tmp/martivent-bootstrap-ready 2>/dev/null; and break
        sleep 1
    end
    docker compose -f $compose exec dev fish $argv
end
