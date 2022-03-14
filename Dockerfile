FROM desktopcontainers/base-debian

RUN export DEBIAN_FRONTEND=noninteractive \
 \
 && apt-get -q -y update \
 && apt-get -q -y install virt-manager openssh-client ssh-askpass-gnome \
 \
 && apt-get -q -y clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 \
 && echo 'HOME=/home/app virt-manager' >> /container/scripts/app
