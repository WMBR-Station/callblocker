#!/bin/bash

make clean
make all
sudo systemctl stop callblockerd
sudo make install
sudo systemctl daemon-reload
sudo systemctl start callblockerd
sudo systemctl restart lighttpd.service
