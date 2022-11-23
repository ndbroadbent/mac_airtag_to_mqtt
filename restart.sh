#!/bin/bash
sudo launchctl unload /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist
sudo launchctl load /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist
