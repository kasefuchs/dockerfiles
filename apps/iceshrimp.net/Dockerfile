FROM iceshrimp.dev/iceshrimp/dotnet-sdk:10.0-alpine AS build

ARG BRANCH=main

RUN apk add --no-cache git

WORKDIR /app

RUN git clone --branch $BRANCH https://iceshrimp.dev/iceshrimp/Iceshrimp.ObjectStorage.git

WORKDIR /app/Iceshrimp.ObjectStorage/src

RUN --mount=type=cache,target=/root/.nuget \
    dotnet restore -p:Configuration=Release

RUN sed -i 's|https://|http://|g' Iceshrimp.ObjectStorage.S3/Actions/S3Request.cs

RUN --mount=type=cache,target=/root/.nuget \
    dotnet publish --no-restore -c Release -o /build -p:DeterministicSourcePaths=true -p:ContinuousIntegrationBuild=true

FROM iceshrimp.dev/iceshrimp/iceshrimp.net:v2026.1-beta

LABEL net.kasefuchs.build.tag="v2026.1-beta"
LABEL net.kasefuchs.build.image="iceshrimp.net"
LABEL net.kasefuchs.build.platforms="linux/amd64,linux/arm64"

WORKDIR /app

COPY --from=build /build/Iceshrimp.ObjectStorage.*.dll .
