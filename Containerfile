ARG major
ARG minor
ARG patch

FROM docker.io/caddy:${major}.${minor}.${patch}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM docker.io/library/caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy