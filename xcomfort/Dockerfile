ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install xcomfortd
COPY --from=karloygard/xcomfortd:latest /usr/bin/xcomfortd /usr/bin/xcomfortd
COPY --from=karloygard/xcomfortd:latest /usr/lib/libusb-1.* /usr/lib/

# Add run script
COPY run.sh /run.sh

CMD [ "/run.sh" ]
