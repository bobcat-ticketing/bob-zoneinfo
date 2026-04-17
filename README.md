# BoB Tariff Zone Information

This directory contains JSON schemas and examples for tariffzone information.


## Dependencies

The `Makefile` can be used to check schema syntax as well as verify that the examples validates against the schemas.

- [check-jsonschema](https://github.com/python-jsonschema/check-jsonschema)


## Schema

The BoB Tariff Zone is maintained by [Samtrafiken](https://www.samtrafiken.se) and can be found below.

- [Tariff zones JSON schema](https://bob.samtrafiken.se/schemas/bob-schema-tariff-zones/1.0.0/tariff-zones.schema.json)


## Maps

Pre-generated maps for all examples can be found in the `*.geojson` files and can be viewed using [GeoJSON.io](https://geojson.io/).

- [Hallandstrafiken](https://geojson.io/#id=github:bobcat-ticketing/bob-zoneinfo/blob/main/zoneinfo-hlt.geojson)
- [Kalmar länstrafik](https://geojson.io/#id=github:bobcat-ticketing/bob-zoneinfo/blob/main/zoneinfo-klt.geojson)
- [Jönköpings länstrafik](https://geojson.io/#id=github:bobcat-ticketing/bob-zoneinfo/blob/main/zoneinfo-jlt.geojson)
- [Västtrafik](https://geojson.io/#id=github:bobcat-ticketing/bob-zoneinfo/blob/main/zoneinfo-vt.geojson)


### Maps for specific zones

Paste output from the commands below to [GeoJSON.io](https://geojson.io/).

    jq '.tariffZones[] | select(.id=="420").geography' < zoneinfo-hlt.json
    jq '.tariffZones[] | select(.id=="Z3001").geography' < zoneinfo-vt.json
