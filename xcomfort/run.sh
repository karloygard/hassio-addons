#!/usr/bin/env bashio

set -e

CONFIG_PATH=/config

MQTT_CLIENT_ID="$(bashio::config 'mqtt_client_id')"
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_PORT=$(bashio::services mqtt "port")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

DATAPOINTS_FILE="$(bashio::config 'datapoints_file')"
EPROM="$(bashio::config 'eprom')"
DEVICE_NUMBER="$(bashio::config 'device_number')"
HA_DISCOVERY="$(bashio::config 'ha_discovery')"
HA_DISCOVERY_PREFIX="$(bashio::config 'ha_discovery_prefix')"
VERBOSE="$(bashio::config 'verbose')"
LIBUSB="$(bashio::config 'use_libusb')"

set -- xcomfortd \
    --client-id ${MQTT_CLIENT_ID} \
    --server "tcp://${MQTT_USER}:${MQTT_PASSWORD}@${MQTT_HOST}:${MQTT_PORT}" \
    --hadiscoveryprefix ${HA_DISCOVERY_PREFIX}

if [ "$EPROM" = "true" ]; then
    set -- "$@" --eprom
fi

if [ "$DATAPOINTS_FILE" != "" ]; then
    set -- "$@" --file "${CONFIG_PATH}/${DATAPOINTS_FILE}"
fi

if [ "$HA_DISCOVERY" = "true" ]; then
    set -- "$@" --hadiscovery
fi

if [ "$VERBOSE" = "true" ]; then
    set -- "$@" --verbose
fi

COMM_MODE=usb
if [ "$LIBUSB" = "false" ]; then
    COMM_MODE=hid
fi

set -- ${COMM_MODE} \
    --device-number ${DEVICE_NUMBER} \

bashio::log.info "Starting $(xcomfortd --version)"
bashio::log.info "$(echo $@ | sed s/${MQTT_USER}:${MQTT_PASSWORD}/*****/g)"

exec "$@"
