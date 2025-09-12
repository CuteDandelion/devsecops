#!/bin/bash

# Run as root initially (set via user: root in compose)
set -e

# Optional: Fix docker.sock if mounted (from earlier discussion)
if [ -S /var/run/docker.sock ]; then
  chown 1000:1000 /var/run/docker.sock
fi


# Original Jenkins entrypoint
exec /usr/local/bin/jenkins.sh "$@"
