FROM desktopcontainers/base-debian

RUN export DEBIAN_FRONTEND=noninteractive \
 \
 && apt-get -q -y update \
 \
 && wget https://zoom.us/client/latest/zoom_amd64.deb \
 && apt-get -q -y install -f /zoom*.deb \
 \
 && apt-get -q -y clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 \
 &&  && echo 'zoom' >> /container/scripts/app