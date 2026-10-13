#!/usr/bin/env bash

window=$(hyprctl activewindow -j)

class=$(echo "$window" | jq -r '.class')
title=$(echo "$window" | jq -r '.title')

echo "Window class: $class"
echo "Window title: $title"

if [[ "$class" =~ ^(firefox|Navigator)$ ]]; then
    echo "Firefox detected! Sending Ctrl+Tab..."
    hyprctl dispatch sendshortcut CTRL TAB activewindow
else
    echo "Not Firefox. Shortcut not sent."
fi