#!/bin/bash

# Run as root initially (set via user: root in compose)
set -e

# Optional: Fix docker.sock if mounted (from earlier discussion)
# Fix docker.sock if mounted (using env-injected DOCKER_GID)
if [ -S /var/run/docker.sock ]; then
  echo "Socket check (no chown needed with group_add): $(ls -ln /var/run/docker.sock)"
fi

# Original Jenkins entrypoint
exec gosu jenkins /usr/local/bin/jenkins.sh "$@"
