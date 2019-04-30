#!/bin/bash

. ./unimelb-comp90024-group-47-openrc.sh; ansible-playbook -i hosts --ask-become-pass dockercouchdb.yaml