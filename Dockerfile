# note: never use the :latest tag in a production site
FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/netcup@v0.1.1

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
