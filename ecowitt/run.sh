#!/usr/bin/with-contenv bashio

# Get configuration
bashio::log.info "Fetching configuration..."

# Defaults
MQTT_HOST=""
MQTT_PORT=1883
MQTT_USER=""
MQTT_PASS=""

if bashio::services.available "mqtt"; then
  MQTT_HOST=$(bashio::services "mqtt" "host")
  MQTT_PORT=$(bashio::services "mqtt" "port")
  MQTT_USER=$(bashio::services "mqtt" "username")
  MQTT_PASS=$(bashio::services "mqtt" "password")
fi

# Override the default MQTT servers if config is set
if bashio::config.has_value 'mqtt_host'; then
  MQTT_HOST=$(bashio::config 'mqtt_host')
fi
if bashio::config.has_value 'mqtt_port'; then
  MQTT_PORT=$(bashio::config 'mqtt_port')
fi
if bashio::config.has_value 'mqtt_user'; then
  MQTT_USER=$(bashio::config 'mqtt_user')
fi
if bashio::config.has_value 'mqtt_pass'; then
  MQTT_PASS=$(bashio::config 'mqtt_pass')
fi

# Get the Unit system
if bashio::config.has_value 'unit_system'; then
  UNIT_SYSTEM=$(bashio::config 'unit_system')
else
  UNIT_SYSTEM="imperial"
fi

# TODO: Check if the MQTT vars are set, and throw a nice error if not

# Boot up
bashio::log.info "Starting Ecowitt2MQTT"
ecowitt2mqtt \
    --mqtt-broker=${MQTT_HOST} \
    --mqtt-port=${MQTT_PORT} \
    --mqtt-username=${MQTT_USER} \
    --mqtt-password=${MQTT_PASS} \
    --unit-system ${UNIT_SYSTEM} \
    --hass-discovery \
    --port=8000
