#!/usr/bin/with-contenv bashio

# Get configuration
bashio::log.info "Fetching configuration..."
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

# Boot up
bashio::log.info "Starting Ecowitt2MQTT"
ecowitt2mqtt \
    --mqtt-broker=$MQTT_HOST \
    --mqtt-username=$MQTT_USER \
    --mqtt-password=$MQTT_PASSWORD \
    --hass-discovery \
    --port=8000

