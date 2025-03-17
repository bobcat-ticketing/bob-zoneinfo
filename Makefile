SCHEMA_URL=	https://bob.samtrafiken.se/schemas/bob-schema-tariff-zones/1.0.0/tariff-zones.schema.json
SCHEMA=		tariffzones.schema.json
EXAMPLE=	tariffzones.example.json



check: check-schemas check-examples

yaml:
	yq -p json < $(SCHEMA) > tariffzones.schema.yaml

$(SCHEMA):
	curl -o $@ $(SCHEMA_URL)

check-schemas: $(SCHEMA)
	@check-jsonschema --verbose --check-metaschema $(SCHEMA)

check-examples: $(SCHEMA) $(EXAMPLE)
	check-jsonschema --verbose --schemafile $(SCHEMA) $(EXAMPLE)

clean:
	rm -f tariffzones.schema.yaml tariffzones.schema.json
