#!/bin/bash

FILE="/tmp/hypr_last_ws"

current=$(hyprctl activeworkspace -j | jq '.id')

if [ -f "$FILE" ]; then
    prev=$(cat "$FILE")
    hyprctl dispatch workspace "$prev"
fi

echo "$current" > "$FILE"
