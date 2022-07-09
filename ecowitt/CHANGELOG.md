## 2022.07.0-1
* Update to 2022.07.0
  * Fix Home Assistant state classes for several _piezo sensors
  * Fix incorrect unit for rain rate sensors
  * Fix Home Assistant state classes for rain "events"
  * Correctly identify rrain constant as a glob
  * Update all dependencies

## 2022.06.4-2
* Unpin the home assistant base images

## 2022.06.4-1
* Update to 2022.06.4
  * Fix issue with missing HASS state classes
* Update to 2022.06.3
  * Fix bug in release script
* Update to 2022.06.2
  * Add command to retrieve diagnostics
  * Add support for MQTT over TLS
  * Add an internal mapping of known battery types to strategy
  * Add "percentage" battery configuration strategy
  * Fix issue where Uvicorn logs didn't correspond to verbose mode
  * Remove Home Assistant state class from boolean batteries
  * Ensure percentage batteries have a "battery" device class with Home Assistant MQTT Discovery
  * Fix bug with improperly calculated percentage battery values
  * Fix bug with percentage batteries in HASS MQTT Discovery
  * Streamline test fixture framework for device payloads
  * Simplify platform detection in Home Assistant MQTT Discovery
* Update to 2022.06.1
  * Fix bug with parsing form data from an Ecowitt gateway
* Update to 2022.06.0
  * Complete a full re-architecture of the library
  * Add support for Home Assistant long-term statistics
  * Add Home Assistant entity category support
  * Ensure HASS Discovery futures are created after MQTT connection is established
  * Update Docker image to use slim Debian
  * Replace various HASS constants with enums
  * Remove unused parameter from utility
  * Create a utility function to glob-search an iterable
  * Fix poetry.lock issue in Dockerfile
  * Update all dependencies

## 2022.05.0-3
* Add support for upstream options:
  * `hass_discovery_prefix` - specifies the mqtt discovery prefix (upstream: `--hass-discovery-prefix`).
  * `hass_entity_id_prefix` - specifies the entity ID prefix (upstream: `--hass-entity-id-prefix`).

## 2022.05.0-2
* Add `init: false` to the configuration to fix bootup bug

## 2022.05.0-1
* Update to 2022.05.0
  * Add ability to configure prefix for Home Assistant entity IDs
  * Check for lightning strike timestamps that are just empty strings
  * Fixed descriptions of the prefix parameters
  * Add additional pre-commit hooks

## 2022.04.3-2
* Improve efficiency of the build using Python `wheel`

## 2022.04.3-1
* Update to 2022.04.3
  * Fix payload generation bug

## 2022.04.2-1
* Update to 2022.04.2
  * Fix improper JSON serialization of datetimes
  * Ensure datetimes are converted before publishing to MQTT
  * Handle case where distance conversion function is handed bad input

## 2022.04.1-1
* Update to 2022.04.1
  * Fix bug where lightning strike distance is a string

## 2022.04.0-1
* Update to 2022.04.0
  * Breaking change: Update binary battery sensor values to be consistent with Home Assistant
  * Add support for GW2001 weather station
  * Add support for WH57 lightning data
  * Update hadolint/hadolint-action action to v2
  * Upgrade Black used in pre-commit
  * Update all dependencies to v3
  * Use constants for Home Assistant units

## 2022.01.0-1
* Update to 2022.01.0
  * Bump asyncio-mqtt to 0.12.1
  * Configure WhiteSource Bolt for GitHub
  * Update pre-commit/action action to v2.0.3
  * Update all dependencies
  * Configure Renovate

## 2021.10.0-1
* Update to 2021.10.0
  * Add Python 3.9 and 3.10 as supported versions
  * Add Fine Offset HP2550 to the device database
  * Migrate versioning to CalVer
* 2019 versions in a single release!

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
