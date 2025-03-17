SCHEMA=		tariffzones.schema.json
EXAMPLE=	tariffzones.example.json

check: check-schemas check-examples

yaml:
	yq -p json < $(SCHEMA) > tariffzones.schema.yaml

check-schemas:
	@check-jsonschema --verbose --check-metaschema $(SCHEMA)

check-examples:
	check-jsonschema --verbose --schemafile $(SCHEMA) $(EXAMPLE)

clean:
	rm -f tariffzones.schema.yaml
