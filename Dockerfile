FROM alpine:3.10
ARG VERSION=1.0.0-rc3

# Install docker client-only
RUN set -o pipefail && \
    wget -qO- "https://download.docker.com/linux/static/stable/$(arch)/docker-18.09.7.tgz" | \
      tar -zxC "/usr/local/bin/" --strip-components=1 docker/docker

# Install manifest-tool
RUN if [[ $(arch) == "aarch64" ]]; then \
      wget -O /usr/local/bin/manifest-tool \
        https://github.com/estesp/manifest-tool/releases/download/v${VERSION}/manifest-tool-linux-arm64; \
    else \
      wget -O /usr/local/bin/manifest-tool \
        https://github.com/estesp/manifest-tool/releases/download/v${VERSION}/manifest-tool-linux-amd64; \
    fi && \
    chmod +x /usr/local/bin/manifest-tool

CMD ["manifest-tool"]