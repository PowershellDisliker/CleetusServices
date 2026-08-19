#!/bin/bash
set -e

echo "Syncing missing game files to mounted drive..."
# -a: archive mode (preserves permissions/times)
# -v: verbose
# --ignore-existing: skip updating files that already exist in target
rsync -av --ignore-existing /game_files/ /data/

echo "Starting server..."
# Execute the start script passing any CMD arguments
exec /data/start-server.sh "$@"