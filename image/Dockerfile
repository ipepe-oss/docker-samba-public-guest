FROM alpine:latest

COPY smb.conf /etc/samba/smb.conf

RUN apk add --update samba-common-tools samba-client samba-server && \
    rm -rf /var/cache/apk/* && \
    addgroup -g 1000 smbuser && \
    adduser -D -H -u 1000 -G smbuser smbuser

HEALTHCHECK --interval=5m --timeout=3s  CMD (smbclient -L '\\localhost' -U '%' -m SMB3 &>/dev/null) || exit 1

CMD ["/usr/sbin/smbd", "--foreground", "--no-process-group", "--debug-stdout", "--configfile=/etc/samba/smb.conf"]