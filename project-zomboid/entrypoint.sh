#!/bin/bash
set -e

echo "Syncing missing game files to mounted drive..."
rsync -av --ignore-existing /game_files/ /data/

echo "Starting server..."
exec /data/start-server.sh "$@"