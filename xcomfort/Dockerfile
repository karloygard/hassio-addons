FROM golang:latest

WORKDIR /build
RUN git clone https://github.com/karloygard/xcomfortd-go
WORKDIR xcomfortd-go
RUN go get .
RUN go build .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /build/xcomfortd-go/xcomfortd-go .
COPY run.sh /run.sh
CMD [ "/run.sh" ]
