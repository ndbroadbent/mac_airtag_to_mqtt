#!/bin/bash
set -euo pipefail

bundle install

sed -e "s%/path/to/mac_airtag_to_mqtt%$PWD%g" mac_airtag_to_mqtt.plist \
  | sudo tee /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist
sudo launchctl load /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist
