# rpi-homebridge-homeassistant

## Run

docker run -d --net=host -p 51826:51826 -v /home/pi/docker_volumes/homebridge:/root/.homebridge --name="homebridge" tobre/rpi-homebridge-homeassistant
