#!/bin/bash


DOMAIN="meet.example.com"

RECORDING_STORAGE="/srv/recordings"

JIBRI_USER="jibri"
JIBRI_USER_PASS="replacejibripassword"

RECORDER_USER="recorder"
RECORDER_USER_PASS="replacerecorderpassword"

prosodyctl register $JIBRI_USER "auth.${DOMAIN}" $JIBRI_USER_PASS
prosodyctl register $JIBRI_USER_PASS "recorder.${DOMAIN}" $RECORDER_USER_PASS

mkdir -p $RECORDING_STORAGE


cat << EOF > /etc/jitsi/jibri/config.json
{

    "recording_directory":"/srv/recordings",
    "finalize_recording_script_path": "/path/to/finalize_recording.sh",
    "xmpp_environments": [
        {
            "name": "prod environment",
            "xmpp_server_hosts": [
                "127.0.0.1"
            ],
            "xmpp_domain": "${DOMAIN}",
            "control_login": {
                "domain": "auth.${DOMAIN}",
                "username": "$JIBRI_USER",
                "password": "$JIBRI_USER_PASS"
            },
            "control_muc": {
                "domain": "internal.auth.meet.example.com",
                "room_name": "JibriBrewery",
                "nickname": "jibri-nickname"
            },
            "call_login": {
                "domain": "recorder.${DOMAIN}",
                "username": "$RECORDER_USER",
                "password": "$RECORDER_USER_PASS"
            },
            "room_jid_domain_string_to_strip_from_start": "conference.",
            "usage_timeout": "0"
        }
    ]
}
EOF

cat << EOF > /etc/jitsi/jicofo/sip-communicator.proper
org.jitsi.jicofo.jibri.BREWERY=JibriBrewery@internal.auth.${DOMAIN}
org.jitsi.jicofo.jibri.PENDING_TIMEOUT=90
EOF


cat << EOF > /etc/prosody/conf.avail/${DOMAIN}.cfg.lua
VirtualHost "recorder.$DOMAIN"
  modules_enabled = {
      "ping";
        }
  authentication = "internal_plain"
EOF

echo "At this point, further modifications will need to be done by hand, unfortunately"
echo "Look for the following component in: /etc/prosody/conf.avail/${DOMAIN}.cfg.lua"
echo "make sure the 'admins' is commented out with a --"
echo ""
cat << EOF
-- internal muc component
Component "internal.auth.$DOMAIN" "muc"
    storage = "none"
    modules_enabled = {
          "ping";
              }
    -- admins = { "focus@auth.meet.dendritictech.com", "jvb@auth.$DOMAIN" }
EOF


echo "Now, edit the following file: /etc/jitsi/meet/${DOMAIN}-config.js"
cat <<EOF
fileRecordingsEnabled: true, // If you want to enable file recording
liveStreamingEnabled: true, // If you want to enable live streaming
hiddenDomain: 'recorder.$DOMAIN',
EOF
