#! /bin/sh

wget -O /home/franko/Code/edb.com/btk/edb-theme/languages/edb.pot  https://elementdebase.com/wp-content/themes/edb-theme/languages/edb.pot
wget -O /home/franko/Code/edb.com/btk/edb-theme/languages/fr_FR.po  https://elementdebase.com/wp-content/themes/edb-theme/languages/fr_FR.po
wget -O /home/franko/Code/edb.com/btk/edb-theme/languages/fr_FR.mo  https://elementdebase.com/wp-content/themes/edb-theme/languages/fr_FR.mo


wget -O /home/franko/Code/edb.com/btk/edb-plugin/languages/edb.pot  https://elementdebase.com/wp-content/plugins/edb-plugin/languages/edb.pot
wget -O /home/franko/Code/edb.com/btk/edb-plugin/languages/edb-fr_FR.po  https://elementdebase.com/wp-content/plugins/edb-plugin/languages/edb-fr_FR.po
wget -O /home/franko/Code/edb.com/btk/edb-plugin/languages/edb-fr_FR.mo  https://elementdebase.com/wp-content/plugins/edb-plugin/languages/edb-fr_FR.mo

#wget -O /home/franko/Code/edb.com/btk/edb-lookbook/languages/edb.pot  https://elementdebase.com/wp-content/plugins/edb-lookbook/languages/edb.pot
#wget -O /home/franko/Code/edb.com/btk/edb-lookbook/languages/fr_FR.po  https://elementdebase.com/wp-content/plugins/edb-lookbook/languages/fr_FR.po
#wget -O /home/franko/Code/edb.com/btk/edb-lookbook/languages/fr_FR.mo  https://elementdebase.com/wp-content/plugins/edb-lookbook/languages/fr_FR.mo

touch /home/franko/Code/edb.com/btk/edb-theme/index.php


#echo "Building order Tool"
#cd /home/franko/Code/edb.com/btk/edb-apps/order-tool/ && /home/franko/Code/edb.com/btk/edb-apps/order-tool/node_modules/gulp/bin/gulp.js && mkdir -p /home/franko/Code/edb.com/btk/edb-theme/apps/order-tool/ && rm -rf /home/franko/Code/edb.com/btk/edb-theme/apps/order-tool/* && cp -R /home/franko/Code/edb.com/btk/edb-apps/order-tool/dist/ /home/franko/Code/edb.com/btk/edb-theme/apps/order-tool/app

#echo "Building delivery manager Tool"
#cd /home/franko/Code/edb.com/btk/edb-apps/delivery-manager/ && /home/franko/Code/edb.com/btk/edb-apps/delivery-manager/node_modules/gulp/bin/gulp.js && mkdir -p /home/franko/Code/edb.com/btk/edb-theme/apps/delivery-manager/ && rm -rf /home/franko/Code/edb.com/btk/edb-theme/apps/delivery-manager/* && cp -R /home/franko/Code/edb.com/btk/edb-apps/delivery-manager/dist/ /home/franko/Code/edb.com/btk/edb-theme/apps/delivery-manager/app


echo "Bundling themes and plugins"
cd /home/franko/Code/edb.com/btk &&
./shell/merge_and_minify.sh &&
rm ./edb-theme.zip
rm ./edb-plugin.zip
rm ./edb-lookbook.zip
# rm ./edb-order-tool.zip
zip -r ./edb-theme.zip ./edb-theme &&
zip -r ./edb-plugin.zip ./edb-plugin &&
zip -r ./edb-lookbook.zip ./edb-lookbook &&
# zip -r ./edb-order-tool.zip ./edb-order-tool -x "*node_modules*"
sudo cp ./edb-theme.zip /home/edb/ &&
sudo cp ./edb-plugin.zip /home/edb/ &&
sudo cp ./edb-lookbook.zip /home/edb/ &&
# sudo cp ./edb-order-tool.zip /home/edb/
sudo cp ./shell/install-prod.sh /home/edb &&
sudo -u edb bash -x /home/edb/install-prod.sh

