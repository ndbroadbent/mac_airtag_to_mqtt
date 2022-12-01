# mac_airtag_to_mqtt

Fetches AirTag data from `~/Library/Caches/com.apple.findmy.fmipcore/Items.data`, creates entities in Home Assistant with location data via [MQTT Discovery](https://www.home-assistant.io/integrations/mqtt/#mqtt-discovery).

## Running in the background

You will probably need to adjust the shebang at the top of `mac_airtag_to_mqtt.rb` to point to your Ruby installation. (It was tricky to get rbenv to work with launchd.)

Create launchctl plist at `/Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist`:

```
sed -e "s%/path/to/mac_airtag_to_mqtt%$PWD%g" mac_airtag_to_mqtt.plist | sudo tee /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist
```

Then run:

    sudo launchctl load /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist

(To stop you need to run `launchctl unload /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist`)
