#!/bin/bash

# nginxinc/nginx-unprivileged:1.18

set -euf -o pipefail

PATH=/usr/bin:/usr/sbin:/usr/local/sbin

IFS='
'

OLD_IMAGE=${1:-}
NEW_IMAGE=${2:-}

usage() {
    cat <<"EOF"
$0: $0 <old image URL> <new image URL>"

$0 will replace all <old image URL> used in this repo with <new image URL>
EOF
}

[ -z "$OLD_IMAGE" ] && usage
[ -z "$NEW_IMAGE" ] && usage

for file in $(find . -name '*.yml'); do
    echo "Fixing $file"
    sed -i -e 's!\(image: \)'"$OLD_IMAGE"'!\1'"$NEW_IMAGE"'!' "$file"
done
