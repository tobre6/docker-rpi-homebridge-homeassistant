FROM fstehle/rpi-node:4

RUN [ "cross-build-start" ]

RUN apt-get -q update && apt-get install -qy \
    build-essential \
    git \
    libavahi-compat-libdnssd-dev \
    libasound2-dev \
    python

RUN npm install -g homebridge
RUN npm install -g homebridge-homeassistant


RUN mkdir -p /var/run/dbus

ADD run.sh /root/run.sh

RUN [ "cross-build-end" ]

EXPOSE 51826

CMD ["/root/run.sh"]
