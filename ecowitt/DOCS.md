# Ecowitt 2 MQTT

Once you have installed this Add On you should configure it to use a port that is not yet allocated on your Home Assistant server. You should also make sure that the port is not available to the outside world, either by firewalling it off, or making sure it is not included in port forwarding rules. Note down the port number you are using.

These are the configuration options you can use:

`output_unit_system` - Set to `metric` or `imperial` depending on the unit system preferred.

`input_unit_system` - Set to `metric` or `imperial` depending on the the values coming from your weather sensors.

`mqtt_host` - Set the hostname/ip of the MQTT server.

`mqtt_port` - Set the port of the MQTT server.

`mqtt_user` - Set the username to use when connecting to MQTT.

`mqtt_pass` - Set the password for the MQTT user.

`hass_discovery_prefix` - The Home Assistant discovery prefix to use.

`hass_entity_id_prefix` - The prefix to use for Home Assistant entity IDs.


Use the following settings in the custom weather provider page of the 'WS View' app.
Protocol Type: Ecowitt
Server IP / Hostname: the IP address/hostname of your Home Assistant server
Path: /data/report (make sure to remove the trailing slash that is there by default)
Port: 8000 (or the port you chose)
Upload Interval: 60 (can be as low as 16 seconds depending on your needs)

