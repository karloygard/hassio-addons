#!/usr/bin/env bashio

set -e

CONFIG_PATH=/config

MQTT_CLIENT_ID="$(bashio::config 'mqtt_client_id')"
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_PORT=$(bashio::services mqtt "port")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

DATAPOINTS_FILE="$(bashio::config 'datapoints_file')"
DEVICE_NUMBER="$(bashio::config 'device_number')"
HA_DISCOVERY="$(bashio::config 'ha_discovery')"
HA_DISCOVERY_PREFIX="$(bashio::config 'ha_discovery_prefix')"
VERBOSE="$(bashio::config 'verbose')"

set -- xcomfortd-go usb \
    --client-id ${MQTT_CLIENT_ID} \
    --server "tcp://${MQTT_USER}:${MQTT_PASSWORD}@${MQTT_HOST}:${MQTT_PORT}" \
    --device-number ${DEVICE_NUMBER} \
    --file "${CONFIG_PATH}/${DATAPOINTS_FILE}" \
    --hadiscoveryprefix ${HA_DISCOVERY_PREFIX}

if [ "$HA_DISCOVERY" = "true" ]; then
    set -- "$@" --hadiscovery
fi

if [ "$VERBOSE" = "true" ]; then
    set -- "$@" --verbose
fi

bashio::log.info "Starting $(xcomfortd --version)"
bashio::log.debug "$(echo $@ | sed s/${MQTT_USER}:${MQTT_PASSWORD}/*****/g)"

exec "$@"
