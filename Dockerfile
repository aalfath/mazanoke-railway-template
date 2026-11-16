# Mazanoke v1.1.7, official image pinned by version and digest.
# Upstream: https://github.com/civilblur/mazanoke
FROM ghcr.io/civilblur/mazanoke:v1.1.7@sha256:ca83cddd90cd1e4b43102884bf39025731a1c7569f3bbda9d6530de72528cbab

# Railway wrapper: nginx on $PORT (IPv4 and IPv6), an open /healthz for the
# health check, then upstream's own basic-auth setup (USERNAME + PASSWORD).
COPY railway-start.sh /usr/local/bin/railway-start.sh
RUN chmod +x /usr/local/bin/railway-start.sh

EXPOSE 8080
CMD ["/usr/local/bin/railway-start.sh"]
