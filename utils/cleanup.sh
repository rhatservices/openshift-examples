#!/bin/bash

set -euf -o pipefail

LABEL="openshift-example=yes"

declare -a OBJECTS

OBJECTS=(deployments pods secrets configmaps routes services buildconfigs imagestreams imagestreamtags resourcequotas poddisruptionbudgets sealedsecrets argocds)

OC_DELETE_OPTIONS="--grace-period=1"
OC_SELECTOR="--selector=${LABEL}"

for o in "${OBJECTS[@]}"
do
    echo "* Removing all ${o} objects..."
    oc delete "$o" "$OC_DELETE_OPTIONS" "$OC_SELECTOR"
done
