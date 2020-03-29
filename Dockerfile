# original DOCKERFILE https://github.com/oblogic7/alexa-tts-mqtt

# https://github.com/jfloff/alpine-python
FROM jfloff/alpine-python:3.8

# copy https://github.com/walthowd/ha-alexa-tts wrapper script and https://loetzimmer.de/patches/alexa_remote_control.sh script
COPY ./ha-alexa-tts /ha-alexa-tts

# copy oblogic python mqtt script
COPY alexa-tts-mqtt.py /

#install from apt
RUN apk add curl jq

#install from python pip
RUN pip install paho-mqtt

CMD [ "python", "/alexa-tts-mqtt.py" ]
