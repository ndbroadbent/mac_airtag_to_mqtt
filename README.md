# mac_airtag_to_mqtt

Fetches AirTag data from `~/Library/Caches/com.apple.findmy.fmipcore/Items.data`, creates entities in Home Assistant with location data via [MQTT Discovery](https://www.home-assistant.io/integrations/mqtt/#mqtt-discovery).

## Running in the background

You will probably need to adjust the shebang at the top of `mac_airtag_to_mqtt.rb` to point to your Ruby installation. (It was tricky to get rbenv to work with launchd.)

Create file at `/Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.ndbroadbent.mac_airtag_to_mqtt</string>
	      <key>Program</key>
		    <string>/Users/USERNAME/code/mac_airtag_to_mqtt/mac_airtag_to_mqtt.rb</string>
        <key>WorkingDirectory</key>
	      <string>/Users/USERNAME/code/home-assistant/mac_airtag_to_mqtt/</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
    </dict>
</plist>
```

And run:

    sudo launchctl load /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist

(To stop you need to run `launchctl unload /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist`)
