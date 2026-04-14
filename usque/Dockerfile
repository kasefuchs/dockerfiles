FROM --platform=$BUILDPLATFORM golang:1.25.5 AS build

ARG BRANCH=v2.0.1
ARG TARGETOS
ARG TARGETARCH

ENV GOOS=$TARGETOS
ENV GOARCH=$TARGETARCH
ENV CGO_ENABLED=0

WORKDIR $GOPATH/src/github.com/Diniboy1123

RUN git clone --branch $BRANCH --depth 1 https://github.com/Diniboy1123/usque.git

WORKDIR $GOPATH/src/github.com/Diniboy1123/usque

RUN go build -o $GOPATH/bin/usque .

FROM alpine:3.22.2

LABEL net.kasefuchs.build.tag="v2.0.1"
LABEL net.kasefuchs.build.image="usque"
LABEL net.kasefuchs.build.platforms="linux/amd64,linux/arm64"

# Install curl for health checks.
RUN apk --no-cache add curl

COPY --from=build /go/bin/usque /usr/local/bin/usque

ENTRYPOINT ["/usr/local/bin/usque"]
