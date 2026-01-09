#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Run migrations
echo "Applying database migrations..."
python manage.py migrate

# Exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
