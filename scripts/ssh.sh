#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# fetch connection user
USER=$(ansible-inventory -i ansible/inventory --host "$1" | jq -r '.ansible_user')

# enter ssh session
ssh -t -i "$ANSIBLE_PRIVATE_KEY_FILE" "$USER@$1" "${@:2}"
