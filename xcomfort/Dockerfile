ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install xcomfortd
COPY --from=karloygard/xcomfortd:latest /usr/bin/xcomfortd /usr/bin/xcomfortd

# Add run script
COPY run.sh /run.sh

CMD [ "/run.sh" ]
