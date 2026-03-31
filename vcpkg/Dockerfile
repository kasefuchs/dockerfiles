FROM debian:13.3-slim

ARG BRANCH=2026.03.18

LABEL net.kasefuchs.build.tag="2026.03.18"
LABEL net.kasefuchs.build.image="vcpkg"
LABEL net.kasefuchs.build.platforms="linux/amd64,linux/arm64"

COPY rootfs/ /

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update --assume-yes && \
    apt-get install --assume-yes --no-install-recommends ca-certificates clang cmake curl dpkg-dev file git pkg-config ninja-build tar unzip zip && \
    apt-get clean --assume-yes

ENV VCPKG_ROOT=/opt/vcpkg
ENV VCPKG_OVERLAY_PORTS=/opt/vcpkg-overlay-ports
ENV VCPKG_FORCE_SYSTEM_BINARIES=1

RUN mkdir -p $VCPKG_ROOT && cd $VCPKG_ROOT && \
    git clone --branch $BRANCH --filter=tree:0 https://github.com/microsoft/vcpkg.git . && \
    ./bootstrap-vcpkg.sh -disableMetrics

ENV PATH=${VCPKG_ROOT}:${PATH}
