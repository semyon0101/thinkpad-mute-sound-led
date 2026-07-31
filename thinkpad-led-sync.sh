#!/bin/bash


# using some code from https://github.com/putofixe67/thinkpad-led-sync/blob/main/thinkpad-led-sync.sh

SINK_LED="platform::mute"

last_sink=""


update_sink_led() {
  local state=0
  wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | grep -q MUTED && state=1
  if [ "$state" != "$last_sink" ]; then
    brightnessctl -q --device="$SINK_LED" set "$state"
    last_sink=$state
  fi
}

update_sink_led
LC_ALL=C pactl subscribe | grep --line-buffered -E "Event 'change' on (sink|server) " | while read -r line; do
  update_sink_led
done
