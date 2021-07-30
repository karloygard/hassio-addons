# Changelog

## 0.37

 - Handle CI that doesn't support extended commands

## 0.36

- Attempt to expose wheel temperature offset for RCT

## 0.35

- Some extra logging for MQTT
- Let new commands to actuators discard older waiting commands
- Fix for TX commands that are silently lost

## 0.34

- Attempt to support CKOZ-00/03

## 0.33

- Support energy messages
- Expose battery status for CTEU-02/0x devices

## 0.32

- Make all MQTT messages retained
- Bump to alpine 3.13

## 0.31

- Resubscribe every time MQTT disconnects, add more error reporting
- Back off to one TX at a time, to prevent lost messages

## 0.30

- Tweak autodiscovery for CRCA-00/0x devices

## 0.29

- WIP code for NG heating actuator
- Abstract extended status message

## 0.28.1

- Update config.json

## 0.28

- Make --verbose log version number.

## 0.27

- Make switching actuator autodetect as light if name is prepended with 'LI_'.
- Make verbose log tx packets

## 0.26

- Add motion detector support
- Make MQTT discovery autoremove optional and default false
- Omit '-0' from mqtt client 0

## 0.25

- Fix start/stop byte reading

## 0.24

- Log short packets
- Add extra error types
