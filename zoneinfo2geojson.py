"""Create GeoJSON map from BoB BoB Tariff Zone Information"""

import argparse
import json
import sys
from typing import Any


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--output", type=argparse.FileType("w"), default=sys.stdout, help="Output file"
    )
    parser.add_argument("zoneinfo")

    args = parser.parse_args()

    with open(args.zoneinfo) as fp:
        zoneinfo = json.load(fp)

    features: list[dict[str, Any]] = []

    for zone in zoneinfo["tariffZones"]:
        zone_properties = {
            "id": zone["id"],
            **(
                {"tariffZoneId": zone["tariffZoneId"]} if "tariffZoneId" in zone else {}
            ),
            **({"name": zone["name"]} if "name" in zone else {}),
            **({"gid": zone["gid"]} if "gid" in zone else {}),
            **({"privateCode": zone["privateCode"]} if "privateCode" in zone else {}),
            **({"groupId": zone["groupId"]} if "groupId" in zone else {}),
        }

        features.extend(
            [
                {**zone_features, "properties": zone_properties}
                for zone_features in zone["geography"]["features"]
            ]
        )

    result = {"type": "FeatureCollection", "features": features}
    json.dump(result, args.output, indent=2)


if __name__ == "__main__":
    main()
