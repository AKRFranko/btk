#! /bin/sh
sudo cd /home/franko/Code/edb.com/btk
rm ./edb-theme.zip
rm ./edb-plugin.zip
rm ./edb-lookbook.zip
zip -r ./edb-theme.zip ./edb-theme
zip -r ./edb-plugin.zip ./edb-plugin
zip -r ./edb-lookbook.zip ./edb-lookbook
sudo cp ./edb-theme.zip /home/edb/
sudo cp ./edb-plugin.zip /home/edb/
sudo cp ./edb-lookbook.zip /home/edb/
sudo cp ./shell/install.sh /home/edb
sudo -u edb bash -x /home/edb/install.sh
