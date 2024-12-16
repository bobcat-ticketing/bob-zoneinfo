check: check-schemas check-examples

check-schemas:
	@check-jsonschema --verbose --check-metaschema zoneinfo.schema.yaml

check-examples:
	check-jsonschema --verbose --schemafile zoneinfo.schema.yaml zoneinfo.example.json
