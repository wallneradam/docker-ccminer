#!/bin/sh

# This file is a skeleton to be used with https://www.supportxmr.com Monero mining pool.

### Parameters ###

# Worker name
WORKER=worker1

# Your email
EMAIL=foo@bar.com

# Set difficulty by port
#PORT=3333  # Difficulty  5000
#PORT=5555  # Difficulty 10000
PORT=7777  # Difficulty 25000

# Mining pool
POOL=pool.supportxmr.com

# Wallet (leave it alone, if you want to mine for me :-)
WALLET=4449w4X8mYfF6Pgkb2SdbuQGHssMqsQt3Jr1wpd3FRnwRuBc4aTudhB7thN7rZwWe7X6WAxubxnXCXkLgRwZRpez3WH2Ncu

##################

nvidia-docker run --rm -t wallneradam/docker-ccminer ccminer \
    -a cryptonight \
    -o stratum+tcp://${POOL}:${PORT} \
    -u ${WALLET} \
    -p ${WORKER}:${EMAIL}
