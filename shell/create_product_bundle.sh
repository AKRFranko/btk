#!/bin/bash


cd /home/franko/Code/edb.com/btk
./shell/catalog-create.php
cp ./shell/catalog-create.sh ./data/catalog-create.sh
rm ./remote-catalog.zip
zip -r ./remote-catalog.zip ./data
sudo cp ./remote-catalog.zip /home/edb/
sudo -u edb scp /home/edb/remote-catalog.zip edb-wordpress:~/
# ./shell/catalog-create.sh