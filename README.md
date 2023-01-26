# mac\_airtag\_to\_mqtt

Fetches AirTag data from `~/Library/Caches/com.apple.findmy.fmipcore/Items.data`, creates entities in Home Assistant with location data via [MQTT Discovery](https://www.home-assistant.io/integrations/mqtt/#mqtt-discovery).

## Running in the background

You will probably need to adjust the shebang at the top of `mac_airtag_to_mqtt.rb` to point to your Ruby installation. (It was tricky to get rbenv to work with launchd.)

### fdautil

You will need ```fdautil``` which is part of [LaunchControl](https://www.soma-zone.com/LaunchControl/)

* Install LaunchControll
* Settings, Utilities, Install fdautils (follow the instructions to allow full disk access)

### plist

Run

    install.sh
    
to setup and install ```mac_airtag_to_mqtt.plist``` to ```/Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist```

Then run:

    sudo launchctl load /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist

To stop you need to run 

    sudo launchctl unload /Library/LaunchDaemons/com.ndbroadbent.mac_airtag_to_mqtt.plist
