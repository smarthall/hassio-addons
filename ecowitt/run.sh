#!/usr/bin/with-contenv bashio

# Get configuration
bashio::log.info "Fetching configuration..."

# Defaults
MQTT_HOST=""
MQTT_PORT=1883
MQTT_USER=""
MQTT_PASS=""
ADDL_PARAMS=()

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

# Get the Unit systems
if bashio::config.has_value 'output_unit_system'; then
  OUTPUT_UNIT_SYSTEM=$(bashio::config 'output_unit_system')
else
  OUTPUT_UNIT_SYSTEM="imperial"
fi

if bashio::config.has_value 'input_unit_system'; then
  INPUT_UNIT_SYSTEM=$(bashio::config 'input_unit_system')
else
  INPUT_UNIT_SYSTEM="imperial"
fi

if bashio::config.has_value 'hass_discovery_prefix'; then
  HASS_DISCOVERY_PREFIX=$(bashio::config 'hass_discovery_prefix')
else
  HASS_DISCOVERY_PREFIX="homeassistant"
fi

if bashio::config.has_value 'hass_entity_id_prefix'; then
  ADDL_PARAMS+=(--hass-entity-id-prefix="$(bashio::config 'hass_entity_id_prefix')")
fi

# Check for MQTT config
if [[ -z "${MQTT_HOST}" || -z "${MQTT_PORT}" || -z "${MQTT_USER}" || -z "${MQTT_PASS}" ]]; then
  bashio::log.fatal "MQTT Configuration not found, cannot continue."
  exit 1
fi

# Boot up
bashio::log.info "Starting Ecowitt2MQTT"
ecowitt2mqtt \
    --mqtt-broker="${MQTT_HOST}" \
    --mqtt-port="${MQTT_PORT}" \
    --mqtt-username="${MQTT_USER}" \
    --mqtt-password="${MQTT_PASS}" \
    --input-unit-system "${INPUT_UNIT_SYSTEM}" \
    --output-unit-system "${OUTPUT_UNIT_SYSTEM}" \
    --hass-discovery \
    --hass-discovery-prefix="${HASS_DISCOVERY_PREFIX}" \
    --port=8000 "${ADDL_PARAMS[@]}"
