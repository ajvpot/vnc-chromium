#!/usr/bin/env bash
set -euox pipefail

Xvfb :99 -ac -listen tcp -screen 0 ${X11VNC_RESOLUTION:-2560x1440}x24 &
sleep 3
DISPLAY=:99 /usr/bin/openbox-session &
sleep 3
DISPLAY=:99 chromium-browser "${KIOSK_URL}" --no-sandbox --start-fullscreen --kiosk --incognito --noerrdialogs \
    --disable-translate --no-first-run --fast --fast-start \
    --disable-infobars --disable-features=TranslateUI \
    --disk-cache-dir=/dev/null --password-store=basic &
x11vnc -display :99.0 -forever -passwd ${X11VNC_PASSWORD:-password} 
