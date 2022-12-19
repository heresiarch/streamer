#!/bin/sh
# patch the yaml with the CAM_URL env parameter
# https://stackoverflow.com/questions/407523/escape-a-string-for-a-sed-replace-pattern/2705678#2705678
ESCAPED_REPLACE=$(printf '%s\n' "$CAM_URL" | sed -e 's/[\/&]/\\&/g')
sed -i "s|CAM_URL|$ESCAPED_REPLACE|g" go2rtc.yaml
# start go2rtc
./go2rtc/go2rtc

