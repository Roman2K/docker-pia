FROM alpine:3.12 AS builder

RUN apk --update add bash sudo coreutils curl jq openvpn

HEALTHCHECK CMD ping -c 3 1.1.1.1 || exit 1

WORKDIR /pia
COPY . .

ENV PIA_AUTOCONNECT=openvpn_tcp_strong
ENV PIA_PF=true
ENV PIA_DNS=true

STOPSIGNAL SIGKILL

ENTRYPOINT ["./get_region_and_token.sh"]
