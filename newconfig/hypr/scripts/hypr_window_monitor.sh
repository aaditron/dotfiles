#!/bin/bash
# ~/.config/eww/scripts/hypr_window_monitor.sh

# Get active workspace ID
active_ws=$(hyprctl activeworkspace -j | jq '.id')

# Count windows in active workspace
window_count=$(hyprctl clients -j | jq --argjson ws "$active_ws" 'map(select(.workspace.id == $ws)) | length')

if [ "$window_count" -eq 0 ]; then
  eww update sidebar-visible=true
else
  eww update sidebar-visible=false
fi
