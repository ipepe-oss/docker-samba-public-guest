#!/bin/bash

docker build -t ipepe/samba-public-guest image/

docker push ipepe/samba-public-guest
