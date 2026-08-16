#!/bin/sh

# Download the latest server.jar directly into the volume directory on every container boot.
# Overwrites any old server.jar while keeping your world/configs untouched.
echo "Fetching latest server.jar..."
curl -o /data/server.jar $(curl -s https://piston-meta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release as $ver | .versions[] | select(.id == $ver).url' | xargs curl -s | jq -r '.downloads.server.url')

# Hand off control to the CMD instruction (starts the Java server)
exec "$@"