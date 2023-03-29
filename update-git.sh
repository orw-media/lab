#!/bin/bash

# script by sh

# configure in Crontab with */10 * * * *

# List of Git repositories
git_repos=(
  "/usr/share/nginx/octopus-report.de/lab"
  "/mnt/git/maintenance"
  "/mnt/git/linktree"
  "/mnt/git/orw-media"
)

# Loop through the Git repositories and update them
for repo in "${git_repos[@]}"
do
  cd $repo
  git pull
done

# healthcheck pings
curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/2548dd59-73d1-4282-94af-2569e4892d6a
curl -G -m 10 --retry 5 https://betteruptime.com/api/v1/heartbeat/7nHKhSgWw9uRhNSWR7xvUHLp
