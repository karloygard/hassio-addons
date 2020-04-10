ARG BUILD_FROM
FROM golang:alpine3.11 as builder

RUN apk add --no-cache gcc musl-dev linux-headers git

WORKDIR /build
RUN git clone https://github.com/karloygard/xcomfortd-go
WORKDIR xcomfortd-go
RUN go get .
RUN go build .

FROM $BUILD_FROM

RUN apk --no-cache add ca-certificates
COPY --from=builder /build/xcomfortd-go/xcomfortd-go /usr/bin/xcomfortd-go
COPY run.sh /run.sh

CMD [ "/run.sh" ]
