# Changelog

## 0.67

 - Mark CDWA-01/3x as battery operated

## 0.66

 - Adding extended status support for shutters (@docstalek)

## 0.65

 - Ensure strict ordering of USB devices.
 - Remove unused parameter.
 - Update modules.

## 0.64

 - Set retained=false when a pushbutton event is triggered (@docstalek)

## 0.63

 - Adding support for CJAU-01/04 Shutter Actuator (@docstalek)

## 0.62

 - Attempt to fix HA entity name issues.  BREAKING CHANGE: this change may cause existing automations on switches, etc. to stop working.  Deleting and recreating the automations will resolve the issue.

## 0.61

 - Use sensor instead of number for pulses

## 0.60

 - Attempt to support pulses

## 0.59

 - Change unit of measurement for signal strength

## 0.58

 - Attempt to make the code work better on RF < 90

## 0.57

 - Don't overwrite last dimmer value when switching off
 - Add name to Power and Battery entities

## 0.56

 - Ignore unexpected input

## 0.55

 - Update go modules
 - Prevent a buffer overflow

## 0.54

 - Add log redaction for libusb brokenness.

## 0.53

 - Test changing names of entities.

## 0.52

 - Attempt to support analog sensors.

## 0.51

 - Attempt to extract name for device.

## 0.50

 - Fix bug where lost messages wouldn't be detected.

## 0.49

 - Use correct unit of measurement for temperature.

## 0.48

 - Fix bug causing MQTT birth message not to be received and autodiscovery not to be restarted.

## 0.47

 - Add stopped state to shutters

## 0.46

 - Tweak DIMPLEX commands for CHAZ-01/01

## 0.45

 - Add support for CHAZ-01/01

## 0.44

 - Resend extended commands if no response is received within 5 seconds

## 0.43

 - Support CDWA-01/3x

## 0.42

 - MQTT discovery: add state_class to sensors

## 0.41

 - Prevent lost temperature commands to heating actuators
 - Add power reporting to devices that support it via extended messages

## 0.40

 - Initial (broken) support for heating actuators

## 0.39.1

 - Log correct name for heating actuators

## 0.38

 - Add logging for extended commands

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
