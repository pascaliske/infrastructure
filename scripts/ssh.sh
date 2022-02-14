#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# fetch connection details
HOST=$(ansible-inventory --host "$1" | jq -r '.ansible_host')
USER=$(ansible-inventory --host "$1" | jq -r '.ansible_user')

# enter ssh session
ssh -t -i "$ANSIBLE_PRIVATE_KEY_FILE" "$USER@$HOST" "${@:2}"
