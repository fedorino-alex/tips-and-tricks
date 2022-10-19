#!/bin/bash

ssh-keygen -m PEM -t RSA -N "" -f /tmp/sshkey <<<y >/dev/null 2>&1

echo "PUBLIC:"
cat /tmp/sshkey | docker run -i danedmunds/pem-to-jwk:latest --public | sed -e "s/\"/'/ig"

echo "PRIVATE:"
cat /tmp/sshkey | base64 -w 0

echo
