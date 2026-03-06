# note: never use the :latest tag in a production site
FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/netcup@v1.0.0

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
