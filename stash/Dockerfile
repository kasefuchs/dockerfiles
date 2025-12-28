FROM stashapp/stash:v0.29.3

LABEL net.kasefuchs.build.image="stash"
LABEL net.kasefuchs.build.platforms="linux/amd64,linux/arm64"

RUN apk --no-cache add gallery-dl gocryptfs

COPY --from=ghcr.io/kasefuchs/pebble:v1.25.0 /usr/local/bin/pebble /usr/local/bin/pebble

COPY rootfs/ /

ENV STASH_CONFIG_FILE=/decrypted/config.yaml

ENTRYPOINT ["/usr/local/bin/pebble"]
CMD ["run"]
