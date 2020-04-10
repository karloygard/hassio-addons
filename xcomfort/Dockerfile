ARG BUILD_FROM
FROM golang:latest

WORKDIR /build
RUN git clone https://github.com/karloygard/xcomfortd-go
WORKDIR xcomfortd-go
RUN go get .
RUN CGO_ENABLED=0 go build .

FROM $BUILD_FROM

RUN apk --no-cache add ca-certificates
COPY --from=0 /build/xcomfortd-go/xcomfortd-go /usr/bin/xcomfortd-go
COPY run.sh /run.sh

CMD [ "/run.sh" ]
