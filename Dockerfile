FROM fstehle/rpi-node:4

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libavahi-compat-libdnssd-dev \
    libasound2-dev \
    python

RUN npm install -g homebridge
RUN npm install -g homebridge-homeassistant

RUN mkdir -p /var/run/dbus

ADD run.sh /root/run.sh

EXPOSE 51826

RUN [ "cross-build-end" ]

CMD ["/root/run.sh"]
