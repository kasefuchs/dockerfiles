# Copyright (c) Kasefuchs
# SPDX-License-Identifier: MIT

FROM stashapp/stash:v0.29.1

LABEL su.kasefuchs.build.image="stash"
LABEL su.kasefuchs.build.platforms="linux/amd64,linux/arm64"

RUN apk --no-cache add gallery-dl gocryptfs supervisor

COPY rootfs/ /

ENV STASH_CONFIG_FILE=/decrypted/config.yaml

ENTRYPOINT [ "/usr/bin/supervisord" ]
CMD [ "--configuration", "/etc/supervisord.conf" ]
