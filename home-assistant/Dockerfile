FROM homeassistant/home-assistant:stable

# install oathtool
RUN apt-get update -y && apt-get install -y oathtool

# install alexa-cli
RUN curl https://raw.githubusercontent.com/thorsten-gehrig/alexa-remote-control/master/alexa_remote_control.sh --silent --output /usr/bin/alexa-cli && chmod +x
