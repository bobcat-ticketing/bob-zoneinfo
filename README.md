# BoB Tariff Zone Information

This directory contains JSON schemas and examples for tariffzone information.


## Dependencies

The `Makefile` can be used to check schema syntax as well as verify that the examples validates against the schemas.

- [check-jsonschema
](https://github.com/python-jsonschema/check-jsonschema)



## Example map

Paste output from the commands below to https://geojson.io/

    jq '.tariffZones[] | select(.id=="420").geography' < hallandstrafiken.json
    jq '.tariffZones[] | select(.id=="Z3001").geography' < vasttrafik.json
