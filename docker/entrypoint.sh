#!/bin/bash
set -e
cd /home/user/development && yarn
exec "$@"
