#!/bin/bash

set -eou pipefail

# Set password from global, default to none
export APP_PASSWORD="${APP_PASSWORD:-}"
export PORT="${PORT:-7777}"

if [ -z "${APP_PASSWORD}" ]; then
    echo "APP_PASSWORD variable is not set, this is insecure! Was this intentional?" | tee /var/log/{{APP}}.log
fi

echo "Setting port for XPRA to: ${PORT}" | tee /var/log/{{APP}}.log
sed -i -e "s/{{PORT}}/${PORT}/g" /root/xpra-session.sh

if [ -f /root/app_run.sh ]; then
    /root/app_run.sh | tee tee /var/log/{{APP}}.log
fi

# This is app startup routines
echo "Running app startup routines"
bash /root/app_startup.sh | tee /var/log/{{APP}}.log

export QT_QPA_PLATFORMTHEME=qt5ct

# Set passwords
echo "${APP_PASSWORD}" >> /root/.xprapasswd

echo "Starting app..." | tee /var/log/{{APP}}.log 2>&1
bash /root/x11-session.sh | tee /var/log/{{APP}}.log & 2>&1
bash /root/xpra-session.sh | tee /var/log/{{APP}}.log & 2>&1
