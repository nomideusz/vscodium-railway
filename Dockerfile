FROM linuxserver/vscodium:1.143.17232-ls300

# MAX_RES capped the Xvfb screen on older X11 bases. This base streams a
# Wayland desktop, which ignores it (a 4K window became 4800x2700); on small
# plans 15-small-plan-resolution locks the size instead. Kept for X11 fallback.
ENV MAX_RES=3840x2160

# ponytail: one custom-init script adds an unauthenticated /healthcheck
# location for Railway's healthcheck prober; everything else is stock.
COPY root/ /
RUN chmod +x /custom-cont-init.d/15-small-plan-resolution /custom-cont-init.d/20-healthcheck /custom-services.d/drop-file-cache /usr/local/bin/drop-file-cache
