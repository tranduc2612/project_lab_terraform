#!/bin/sh

HOSTNAME=$(hostname)

cat > /usr/share/nginx/html/server-info.json <<EOF
{
  "hostname": "$HOSTNAME"
}
EOF

nginx -g "daemon off;"