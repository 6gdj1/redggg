FROM alpine:edge

ARG AUUID="3b5d7c79-c11d-408d-8957-39bf14d1f01b"
ARG CADDYIndexPage="https://www.free-css.com/assets/files/free-css-templates/download/page276/ocean-vibes.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
