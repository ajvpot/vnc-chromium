#!/usr/bin/env bash
set -euox pipefail

RESCOMMA=`echo "${X11VNC_RESOLUTION:-2560x1440}" | sed -e "s|x|,|"`

Xvfb :99 -ac -listen tcp -screen 0 ${X11VNC_RESOLUTION:-2560x1440}x24 &
sleep 3
DISPLAY=:99 chromium-browser "${KIOSK_URL}" --window-size=$RESCOMMA --start-fullscreen --kiosk --incognito --noerrdialogs --no-sandbox \
    --window-position=0,0 --disable-translate --no-first-run --fast --fast-start \
    --disable-infobars --disable-features=TranslateUI --password-store=basic &
x11vnc -display :99.0 -forever -passwd ${X11VNC_PASSWORD:-password} 
