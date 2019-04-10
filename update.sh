#!/bin/bash

make clean
make all
sudo cp configs/main.json /etc/callblocker/blacklists/main.json
sudo systemctl stop callblockerd
sudo make install
sudo systemctl daemon-reload
sudo systemctl start callblockerd
sudo systemctl restart lighttpd.service
