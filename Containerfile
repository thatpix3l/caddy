ARG caddy_version=2

FROM docker.io/library/caddy:${caddy_version:-2}-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/caddy-dns/cloudflare

FROM docker.io/library/caddy:${caddy_version:-2}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

