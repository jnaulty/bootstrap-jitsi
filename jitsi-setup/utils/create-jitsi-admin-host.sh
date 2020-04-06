#!/bin/bash

source ../secrets/secret.env

prosodyctl register $JITSI_ADMIN_HOST meet.dendritictech.com $JITSI_ADMIN_HOST_PASSWORD
