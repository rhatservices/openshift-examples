#!/bin/sh

set -euf pipefail

IFS='
'

PATH=/usr/bin:/usr/local/bin

ENV_VAR_VALUE=${VARIABLE:-}
ENV_SECRET_VALUE=${SECRET:-}

CONFIG=/etc/test/config.yml

while /bin/true; do
    echo "Reading content of $CONFIG"
    if [ -f "$CONFIG" ]; then
	cat "$CONFIG"
    else
	echo 'WARNING: /etc/test/config.yml does not exist'
    fi

    echo "VARIABLE: $ENV_VAR_VALUE"
    echo "SECRET: $ENV_SECRET_VALUE"
    sleep 1
done
