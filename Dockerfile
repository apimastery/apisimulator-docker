# API Simulator Dockerfile
FROM openjdk:8u131-jre-alpine

MAINTAINER http://apisimulator.io/

ENV APISIMULATOR_VERSION 0.6.0

# Download and install API Simulator
RUN apk update \
    && apk add ca-certificates wget \
    && update-ca-certificates \
    && wget -P . https://apisimulator.io/downloads/apisimulator-http-$APISIMULATOR_VERSION-distro.zip \
    && unzip apisimulator-http-$APISIMULATOR_VERSION-distro.zip -d . \
    && rm -f apisimulator-http-$APISIMULATOR_VERSION-distro.zip \
    && addgroup -S -g 10101 apisimulator \
    && adduser -S -D -u 10101 -s /sbin/nologin -h /apisimulator -g "API Simulator User" -G apisimulator apisimulator \
    && chown -R apisimulator:root /apisimulator \
    && chmod -R 0775 /apisimulator

EXPOSE 6090/tcp

WORKDIR /apisimulator/apisimulator-http-$APISIMULATOR_VERSION

ENV PATH /apisimulator/apisimulator-http-$APISIMULATOR_VERSION/bin:$PATH

USER 10101

CMD ["echo", "Visit apisimulator.io for how to use this image to run API Simulator or API Recorder"]
# @END
