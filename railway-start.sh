#!/bin/sh
# Start Mazanoke's nginx on Railway's $PORT. Safe to run again after a restart.
set -e

PORT="${PORT:-8080}"
CONF=/etc/nginx/conf.d/default.conf

# Listen on $PORT for IPv4 and IPv6 (Railway's private network is IPv6).
sed -i -E '/listen \[::\]:[0-9]+;/d' "$CONF"
sed -i -E "s/^([[:space:]]*)listen [0-9]+;/\1listen ${PORT};\n\1listen [::]:${PORT};/" "$CONF"

# Health check path that answers without a login.
sed -i '/location = \/healthz/d' "$CONF"
sed -i '/error_page 404/i\    location = /healthz { access_log off; default_type text/plain; return 200 "ok\\n"; }' "$CONF"

# Upstream script: turns on HTTP basic auth when USERNAME and PASSWORD are both set.
/usr/local/bin/basicauth.sh

nginx -t
exec nginx -g 'daemon off;'
