# Copyright (c) Kasefuchs
# SPDX-License-Identifier: MIT

FROM --platform=$BUILDPLATFORM golang:1.25.2 AS build

ARG VERSION=v1.20241021.0

ARG TARGETOS
ARG TARGETARCH

ENV GOOS=$TARGETOS
ENV GOARCH=$TARGETARCH
ENV CGO_ENABLED=0

RUN go install www.bamsoftware.com/git/dnstt.git/dnstt-client@$VERSION
RUN go install www.bamsoftware.com/git/dnstt.git/dnstt-server@$VERSION

FROM alpine:3.22.2

LABEL su.kasefuchs.build.tag="v1.20241021.0"
LABEL su.kasefuchs.build.image="dnstt"
LABEL su.kasefuchs.build.platforms="linux/amd64,linux/arm64"

COPY --from=build /go/bin/dnstt-client /usr/local/bin/dnstt-client
COPY --from=build /go/bin/dnstt-server /usr/local/bin/dnstt-server
