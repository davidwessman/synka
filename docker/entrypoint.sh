#!/bin/bash
set -e
cd /home/user/development && yarn &&
rm /home/user/development/tmp/pids/server.pid && \
exec "$@"
