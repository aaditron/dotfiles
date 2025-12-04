#!/usr/bin/env bash

launch_dashboard() {
  if [[ ! $(pidof eww) ]]; then
    eww daemon
    sleep 1
    eww open sidebar --arg revealer-duration=300
    eww update sidebar-visible=true
  else
    eww update sidebar-visible=true
  fi
}

if hyprctl activeworkspace 2>/dev/null | grep -v "lastwindowtitle" | grep -q "windows: 0" &&
  hyprctl activeworkspace 2>/dev/null | grep -v "lastwindowtitle" | grep -q "monitorID: 0"; then
  launch_dashboard &
fi

if ! (hyprctl activeworkspace 2>/dev/null | grep -v "lastwindowtitle" | grep -q "windows: 0") &&
  hyprctl activeworkspace 2>/dev/null | grep -v "lastwindowtitle" | grep -q "monitorID: 0"; then
  eww update sidebar-visible=false &
fi

#sleep 0.7 # seems to be best

if ! (hyprctl activeworkspace 2>/dev/null | grep -v "lastwindowtitle" | grep -q "windows: 0") &&
  hyprctl activeworkspace 2>/dev/null | grep -v "lastwindowtitle" | grep -q "monitorID: 0"; then
  eww update sidebar-visible=false &
fi
