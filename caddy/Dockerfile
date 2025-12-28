FROM caddy:2.10.2-builder AS build

RUN xcaddy build \
  --with github.com/mholt/caddy-l4

FROM caddy:2.10.2

LABEL su.kasefuchs.build.tag="2.10.2"
LABEL su.kasefuchs.build.image="caddy"
LABEL su.kasefuchs.build.platforms="linux/amd64,linux/arm64"

COPY --from=build /usr/bin/caddy /usr/bin/caddy
