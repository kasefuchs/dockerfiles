FROM --platform=$BUILDPLATFORM golang:1.25.4 AS build

ARG BRANCH=v1.25.0
ARG TARGETOS
ARG TARGETARCH

ENV GOOS=$TARGETOS
ENV GOARCH=$TARGETARCH
ENV CGO_ENABLED=0

WORKDIR $GOPATH/src/github.com/canonical

RUN git clone --branch $BRANCH --depth 1 https://github.com/canonical/pebble.git

WORKDIR $GOPATH/src/github.com/canonical/pebble

RUN go build -o $GOPATH/bin/pebble ./cmd/pebble/

FROM alpine:3.22.2

LABEL su.kasefuchs.build.tag="v1.25.0"
LABEL su.kasefuchs.build.image="pebble"
LABEL su.kasefuchs.build.platforms="linux/amd64,linux/arm64"

COPY --from=build /go/bin/pebble /usr/local/bin/pebble

ENTRYPOINT ["/usr/local/bin/pebble"]
CMD ["run"]
