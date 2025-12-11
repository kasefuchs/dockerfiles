FROM --platform=$BUILDPLATFORM golang:1.25.4 AS build

ARG BRANCH=v1.20241021.0
ARG TARGETOS
ARG TARGETARCH

ENV GOOS=$TARGETOS
ENV GOARCH=$TARGETARCH
ENV CGO_ENABLED=0

WORKDIR $GOPATH/src/www.bamsoftware.com/git

RUN git clone --branch $BRANCH https://www.bamsoftware.com/git/dnstt.git

WORKDIR $GOPATH/src/www.bamsoftware.com/git/dnstt

RUN go build -o $GOPATH/bin/dnstt-client ./dnstt-client/
RUN go build -o $GOPATH/bin/dnstt-server ./dnstt-server/

FROM alpine:3.22.2

LABEL su.kasefuchs.build.tag="v1.20241021.0"
LABEL su.kasefuchs.build.image="dnstt"
LABEL su.kasefuchs.build.platforms="linux/amd64,linux/arm64"

COPY --from=build /go/bin/dnstt-client /usr/local/bin/dnstt-client
COPY --from=build /go/bin/dnstt-server /usr/local/bin/dnstt-server

ENTRYPOINT ["/usr/local/bin/dnstt-server"]
