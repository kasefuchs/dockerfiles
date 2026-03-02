FROM debian:13.3-slim

LABEL net.kasefuchs.build.image="warp"
LABEL net.kasefuchs.build.platforms="linux/amd64,linux/arm64"

RUN apt-get update --assume-yes && \
    apt-get install --assume-yes --no-install-recommends ca-certificates curl gnupg lsb-release && \
    curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list && \
    apt-get update --assume-yes && \
    apt-get install --assume-yes --no-install-recommends cloudflare-warp rinetd && \
    apt-get clean --assume-yes

COPY --from=ghcr.io/kasefuchs/pebble:v1.25.0 /usr/local/bin/pebble /usr/local/bin/pebble

COPY rootfs/ /

ENTRYPOINT ["/usr/local/bin/pebble"]
CMD ["run"]
