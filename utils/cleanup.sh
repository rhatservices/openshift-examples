#!/bin/bash

set -euf -o pipefail

declare -a OBJECTS

OBJECTS=(pods deployments poddisruptionbudgets)

for o in "${OBJECTS[@]}"
do
    oc delete "$o"
done
