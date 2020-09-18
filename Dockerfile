FROM docker:19

ENV VERSION=v1.0.3

# Add description
LABEL org.label-schema.description="Docker:19 with manifest-tool included"

# Install manifest-tool
RUN if [[ $(arch) == "aarch64" ]]; then \
      wget -O /usr/local/bin/manifest-tool \
        https://github.com/estesp/manifest-tool/releases/download/${VERSION}/manifest-tool-linux-arm64; \
    else \
      wget -O /usr/local/bin/manifest-tool \
        https://github.com/estesp/manifest-tool/releases/download/${VERSION}/manifest-tool-linux-amd64; \
    fi && \
    chmod +x /usr/local/bin/manifest-tool

CMD ["manifest-tool"]
