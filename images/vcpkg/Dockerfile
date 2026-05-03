FROM cmake

ARG VCPKG_VERSION

COPY rootfs/ /

ENV VCPKG_ROOT=/opt/vcpkg
ENV VCPKG_OVERLAY_PORTS=/opt/vcpkg-overlay-ports
ENV VCPKG_FORCE_SYSTEM_BINARIES=1

RUN mkdir -p $VCPKG_ROOT && cd $VCPKG_ROOT && \
    git clone --branch ${VCPKG_VERSION} --filter=tree:0 https://github.com/microsoft/vcpkg.git . && \
    ./bootstrap-vcpkg.sh -disableMetrics

ENV PATH=${VCPKG_ROOT}:${PATH}
