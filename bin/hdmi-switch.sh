#!/bin/bash

# Set up the following udev rule un /etc/udev/rules.d/90-hdmi.rules
#SUBSYSTEM=="drm", ACTION=="change", RUN+="/etc/acpi/hdmi-switch.sh"

set -x
export DISPLAY=:0

#hdmi_status="$(cat /sys/class/drm/card0-HDMI-A-1/status)"
hdmi_status="$(cat /sys/class/drm/card*-HDMI-A-1/status | head -n1)"


change-display() {
local user="$(w -h | grep tty | head -n1 | awk '{print $1}')"
export XAUTHORITY="/home/$user/.Xauthority"

LOG="/home/$user/hdmi-switch.sh.log"


if [[ $hdmi_status == "disconnected" ]]; then
  echo $(date +"%Y%m%d-%H:%M:%S") "HDMI-1 $hdmi_status" >> "$LOG"
  [[ $(pgrep X) -gt 0 ]] && xrandr --output HDMI-1 --off --output eDP-1 --auto
else
  echo $(date +"%Y%m%d-%H:%M:%S") "HDMI-1 $hdmi_status" >> "$LOG"
  [[ $(pgrep X) -gt 0 ]] && xrandr --output eDP-1 --auto --output HDMI-1 --auto --above eDP-1 >> "$LOG"
fi
}

change-display

exit 0
