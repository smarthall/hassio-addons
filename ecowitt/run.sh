#!/usr/bin/with-contenv bashio

# Get configuration
bashio::log.info "Fetching configuration..."
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

if bashio::config.has_value 'unit_system'; then
  UNIT_SYSTEM=$(bashio::config 'unit_system')
else
  UNIT_SYSTEM="imperial"
fi

# Boot up
bashio::log.info "Starting Ecowitt2MQTT"
ecowitt2mqtt \
    --mqtt-broker=${MQTT_HOST} \
    --mqtt-username=${MQTT_USER} \
    --mqtt-password=${MQTT_PASSWORD} \
    --unit-system ${UNIT_SYSTEM} \
    --hass-discovery \
    --port=8000

