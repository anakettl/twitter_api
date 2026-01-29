#!/bin/bash
set -e

# Remove um possível pid antigo do Rails
rm -f /rails_app/tmp/pids/server.pid

# Executa o comando principal (o que estiver no CMD do Dockerfile)
exec "$@"
