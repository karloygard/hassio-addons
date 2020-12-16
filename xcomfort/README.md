# Home Assistant Addon: xComfort

Enable communication with the Eaton xComfort CKOZ-00/14 USB and CCIA-0x/01 Ethernet Communication Interfaces.

## BREAKING CHANGES PART II

**Due to support for for multiple simulateous devices, the configuration schema had to be reworked and will prevent the daemon from starting if not updated.  Suggested solution is to reset to defaults.**

## About

xComfort is a wireless European home automation system, using the 868,3MHz band. The system is closed source. This code was reverse engineered from a variety of sources, without documentation from Eaton, and may not follow their specifications.

This code supports both extended and regular status messages. Older devices only send the latter, which are not routed and have no delivery guarantees. Careful placement of the CI is important, so that it can see these messages, or you will need to use more than one CI to improve coverage.

To view the source code of this daemon, go to [github.com/karloygard/xcomfortd-go](https://github.com/karloygard/xcomfortd-go).

## How to use

Datapoints can be read out from the eprom of the CI, and must be kept updated if and when devices are added.  Consult the [MRF manual](http://www.eaton.com/ecm/groups/public/@pub/@eatonnl/@electrical/documents/content/pct_325435.pdf) (paragraph USB-RF-Communication Stick) for documentation on how to do this.  For testing purposes, both TXT and DPL file formats are supported, but the latter format is generally superior.

## Configuration

Add-on configuration:

```yaml
mqtt_client_id: xcomfort
datapoints_file: ""
eprom: true
verbose: false
use_hidapi: false
ha_discovery: true
ha_discovery_prefix: homeassistant
eci_hosts: ["eci-host-1", "eci-host-2"]
```

### Option: `mqtt_client_id`

ID of the MQTT client the daemon connects with. 

### Option: `datapoints_file`

Name of the datapoints file in the Home Assistant configuration directory.  Only one file can be specified, so if you are using more than one device, the same file will be used for all devices.  Recommend the `eprom` option instead.

### Option: `eprom`

Read datapoint list from eprom.

### Option: `ha_discovery`

Make the daemon send MQTT device discovery messages to Home Assistant.

### Option: `ha_discovery_prefix`

The Home Assistant discovery prefix.

### Option: `verbose`

Enable verbose logging.

### Option: `use_hidapi`

Talk to USB sticks with hidapi.  Hidapi appears to have intermittent issues, and is only included for testing purposes, leaving this to false is recommended.

### Option: `eci_hosts`

Host addresses (array) of ECI devices.

## License

MIT License

Copyright (c) 2020 Guðmundur Björn Birkisson and Karl Anders Øygard

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
