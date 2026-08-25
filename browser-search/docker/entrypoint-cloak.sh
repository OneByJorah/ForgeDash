#!/bin/sh
# Chromium >=111 binds the DevTools endpoint to 127.0.0.1 regardless of
# --remote-debugging-address. Run Chromium on an internal loopback port and
# forward 0.0.0.0:9222 -> 127.0.0.1:19222 so agents can reach CDP.
chromium --headless --no-sandbox --disable-gpu \
    --disable-dev-shm-usage \
    --remote-debugging-port=19222 \
    --user-data-dir=/tmp/cloak-profile &
exec socat TCP-LISTEN:9222,bind=0.0.0.0,fork,reuseaddr TCP:127.0.0.1:19222
