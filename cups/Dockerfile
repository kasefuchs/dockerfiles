# Copyright (c) Kasefuchs
# SPDX-License-Identifier: MIT

FROM anujdatar/cups:25.11.01

LABEL su.kasefuchs.build.image="cups"
LABEL su.kasefuchs.build.platforms="linux/amd64"

# Install Kyocera printer drivers.
RUN wget -qO /tmp/kyocera_ppds_installer.sh https://raw.githubusercontent.com/mnorin/kyocera-ppd-installer/refs/heads/master/kyocera_ppds_installer.sh && \
  chmod +x /tmp/kyocera_ppds_installer.sh && \
  yes y | /tmp/kyocera_ppds_installer.sh && \
  rm -rf /tmp/*

# Remove debug flags from the shebang.
RUN sed -i '1 s|^#!/bin/bash.*|#!/bin/bash|' /entrypoint.sh
