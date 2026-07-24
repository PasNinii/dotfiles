function martiboot --description 'Re-run the martivent container bootstrap (venv, node_modules, git hooks) without a rebuild'
    # Runs the entrypoint script one-shot: `true` becomes its exec target so it
    # sets up and exits instead of handing off to `sleep infinity`.
    docker compose \
        -f /home/nini/martigua/martivent/docker-compose.dev.yml \
        exec dev bash docker/dev/bootstrap.sh true
end
