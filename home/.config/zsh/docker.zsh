#!/usr/bin/env zsh

# Select a running docker container to stop
dst() {
  local cid
  cid=$(docker ps | sed 1d | fzf --border --height 50% -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# Start a stopped docker container
ds() {
  local cid
  cid=$(docker ps -a --filter "status=exited" | sed 1d | fzf --border --height 50% -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid"
}

# Select a docker container or containers to remove
drm() {
  docker ps -a | sed 1d | fzf --border --height 50% -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs -r docker rm
}

# Select a docker image or images to remove
drmi() {
  docker images | sed 1d | fzf --border --height 50% -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
}