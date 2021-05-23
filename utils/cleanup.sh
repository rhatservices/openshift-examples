#!/bin/bash

set -euf -o pipefail

declare -a OBJECTS

OBJECTS=(pods deployments poddisruptionbudgets)

OC_DELETE_OPTIONS="--grace-period=1"

for o in "${OBJECTS[@]}"
do
    echo "* Removing all ${o} objects..."
    oc delete "$o" --all "$OC_DELETE_OPTIONS"
done
