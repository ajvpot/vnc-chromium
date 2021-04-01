FROM ubuntu:xenial
EXPOSE 5900 6099
ENV \
  DEBIAN_FRONTEND="nonintractive" \
  X11VNC_PASSWORD="password"
RUN apt-get update -y
RUN apt-get install --no-install-recommends -y xvfb x11vnc xserver-xorg-video-all xserver-xorg-input-all xserver-xorg-core xinit x11-xserver-utils chromium-browser
ADD ./chrome.json /etc/chromium-browser/policies/managed/chrome.json
ADD ./entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT /opt/entrypoint.sh
