#!/bin/bash
set -e

docker run \
  --env CIRCLE_API_MACHINE_USER_TOKEN \
  --rm \
    cyberdojofoundation/image_notifier "$@"
