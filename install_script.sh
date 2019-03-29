sudo apt-get update
sudo apt-get install -y git make automake g++ libpjproject-dev libjson-c-dev libphonenumber-dev
sudo apt-get install -y python3 python3-bs4 python3-ldif3 python3-vobject
sudo apt-get install -y lighttpd python3-systemd python3-pip apt-transport-https
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
aclocal
automake --add-missing --foreign
autoconf
./configure --prefix=/usr --sysconfdir=/etc
make all
sudo make install
sudo cp configs/settings.json /etc/callblocker/settings.json
sudo cp configs/main.json /etc/callblocker/blacklists/main.json
sudo cp configs/lighttpd.conf /etc/lighttpd/lighttpd.conf
cd usr/var/www/callblocker/js
npm install
sudo cp -r node_modules/ /usr/var/www/callblocker/js/vendor
sudo pip3 install flipflop
sudo usermod -a -G systemd-journal www-data

