ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Install and build Ecowitt2MQTT
RUN apk add --no-cache \
        python3==3.9.7-r4 \
    && apk add --no-cache --virtual .build-dependencies \
        gcc \
        python3-dev==3.9.7-r4 \
        libc-dev \
        musl-dev \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools wheel \
    && pip install --no-cache ecowitt2mqtt==2022.06.4 \
    && apk del .build-dependencies

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
