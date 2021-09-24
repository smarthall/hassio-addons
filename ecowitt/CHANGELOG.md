## 2.0.3-1
* Update to ecowitt2mqtt 2.0.3
  * Don't treat wind direction as a speed

## 2.0.2-1
* See upstream notes: https://github.com/bachya/ecowitt2mqtt/releases/tag/2.0.1
* and the other version: https://github.com/bachya/ecowitt2mqtt/releases/tag/2.0.2

## 2.0.0-2
* Reduce the image size by leaving the pip cache out of the image

## 2.0.0-1
* Update to ecowitt2mqtt 2.0.0
* Better checking of MQTT configuration errors

### NOTE
The `unit_system` configuration, has been changed to `input_unit_system` and `output_unit_system` to match the change made upstream. When updating you may need to update your configuration.

## 1.3.0-2
* Update to ecowitt2mqtt 1.3.0
* Use prebuilt docker images

### NOTE
There is currently an issue updating from versions before 1.3.0 to 1.3.0 and beyond. This is due to changing from images that are built on your hassio machine, to ones that are pre-built in GitHub actions, and an issue in Home Assistant.

You can work around this issue by:

    Make a note of your addon settings
    Remove the addon by clicking the uninstall button
    Click install to install the addon again
    Restore your settings and click start

## 1.0.10-11
* Support external MQTT servers

## 1.0.10-1
* Update to ecowitt2mqtt 1.0.10
  * Upgrade aiohttp to a minimum of 3.7.4

## 1.0.9-1

* Update to ecowitt2mqtt 1.0.9
  * Truing up a few data conversions

## 0.0.17

* Update to ecowitt2mqtt 1.0.8
   * Fix incorrect metric conversions for rain and pressure
