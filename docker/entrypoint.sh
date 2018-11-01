#!/bin/bash
set -e
cd /home/user/development && yarn &&
rm -f /home/user/development/tmp/pids/server.pid ||: && \
exec "$@"
