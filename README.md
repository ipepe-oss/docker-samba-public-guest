# docker-samba-public-guest
Small and simple samba server that has public directory with guest access open


## Usage

### docker-compose

```yaml
version: '3'
services:
  app:
    image: ipepe/samba-public-guest
    restart: always
    ports:
      - '139:139'
      - '445:445'
    volumes:
      - '/data/public:/public'
      - '/etc/localtime:/etc/localtime:ro'
```