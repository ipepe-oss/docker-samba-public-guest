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

#### macvlan variant

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
    networks:
      macvlan:
        ipv4_address: 192.168.1.233

networks:
  macvlan:
    driver: macvlan
    driver_opts:
      parent: eth0
    ipam:
      config:
        - subnet: 192.168.1.0/24
          ip_range: 192.168.1.0/24
          gateway: 192.168.1.1
```          