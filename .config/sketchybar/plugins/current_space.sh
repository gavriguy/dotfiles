#!/bin/sh

# https://github.com/FelixKratz/SketchyBar/discussions/289#discussioncomment-4150227
SPACE_ID=$(echo "$INFO" | jq -r '."display-1"')

sketchybar --set $NAME label=$SPACE_ID
