#!/bin/bash

while read -r line; do
  volume_state=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
  volume=$(echo $volume_state | cut -d' ' -f2)
  muted=$(echo $volume_state | cut -d' ' -f3)

  if [[ "$muted" == '[MUTED]' ]]; then
    is_muted='true'
  else
    is_muted='false'
  fi

  printf "{ \"volume\": \"%s\", \"isMuted\": %s, \"headphones\": %s }\n" "$volume" "$is_muted" "false"
done < <({
  echo
  pactl subscribe | grep -i --line-buffered 'sink #'
})
