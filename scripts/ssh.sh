#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# fetch connection details
HOST=$(ansible-inventory --list | jq -r ".$1.hosts[0]")
USER=$(ansible-inventory --host "$1" | jq -r '.ansible_user')

# enter ssh session
ssh -t -i "$ANSIBLE_PRIVATE_KEY_FILE" "$USER@$HOST"
