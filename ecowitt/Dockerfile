ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Install and build Ecowitt2MQTT
RUN apk add --no-cache \
        python3 \
    && apk add --no-cache --virtual .build-dependencies \
        build-base \
        python3-dev \
        libc-dev \
        musl-dev \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools wheel \
    && pip3 install --no-cache ecowitt2mqtt==2022.06.4 \
    && apk del .build-dependencies

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
