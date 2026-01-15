ARG BUILDER_VERSION

FROM docker.io/caddy:${BUILDER_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/enum-gg/caddy-discord \
    --with github.com/mholt/caddy-dynamicdns

FROM docker.io/library/caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy