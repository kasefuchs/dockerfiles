FROM debian:13.3-slim

ARG BRANCH=2026.01.16

LABEL net.kasefuchs.build.tag="2026.01.16"
LABEL net.kasefuchs.build.image="vcpkg"
LABEL net.kasefuchs.build.platforms="linux/amd64,linux/arm64"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update --assume-yes && \
    apt-get install --assume-yes --no-install-recommends ca-certificates clang cmake curl git ninja-build tar unzip zip && \
    apt-get clean --assume-yes

ENV VCPKG_ROOT=/opt/vcpkg
ENV VCPKG_FORCE_SYSTEM_BINARIES=1

RUN mkdir -p $VCPKG_ROOT && cd $VCPKG_ROOT && \
    git clone --branch $BRANCH --filter=tree:0 https://github.com/microsoft/vcpkg.git . && \
    ./bootstrap-vcpkg.sh -disableMetrics

ENV PATH=${VCPKG_ROOT}:${PATH}
