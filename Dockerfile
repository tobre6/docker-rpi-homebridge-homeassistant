FROM fstehle/rpi-node:4

RUN [ "cross-build-start" ]

RUN apt-get update
RUN apt-get install -y --no-install-recommends avahi-daemon avahi-discover libnss-mdns libavahi-compat-libdnssd-dev
RUN apt-get install -y --no-install-recommends curl wget git apt-transport-https python build-essential make g++ libavahi-compat-libdnssd-dev libkrb5-dev vim net-tools
RUN npm install -g --unsafe-perm homebridge
RUN npm install -g https://github.com/tobre6/docker-rpi-homebridge-homeassistant

RUN mkdir -p /var/run/dbus

EXPOSE 51826

ADD run.sh /root/run.sh
RUN chmod +x /root/run.sh

RUN [ "cross-build-end" ]

CMD ["/root/run.sh"]
