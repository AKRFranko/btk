#! /bin/sh

wget -O /home/franko/Code/edb.com/btk/edb-theme/languages/edb.pot  https://elementdebase.com/wp-content/themes/edb-theme/languages/edb.pot
wget -O /home/franko/Code/edb.com/btk/edb-theme/languages/fr_FR.po  https://elementdebase.com/wp-content/themes/edb-theme/languages/fr_FR.po
wget -O /home/franko/Code/edb.com/btk/edb-theme/languages/fr_FR.mo  https://elementdebase.com/wp-content/themes/edb-theme/languages/fr_FR.mo


wget -O /home/franko/Code/edb.com/btk/edb-plugin/languages/edb.pot  https://elementdebase.com/wp-content/plugins/edb-plugin/languages/edb.pot
wget -O /home/franko/Code/edb.com/btk/edb-plugin/languages/edb-fr_FR.po  https://elementdebase.com/wp-content/plugins/edb-plugin/languages/edb-fr_FR.po
wget -O /home/franko/Code/edb.com/btk/edb-plugin/languages/edb-fr_FR.mo  https://elementdebase.com/wp-content/plugins/edb-plugin/languages/edb-fr_FR.mo

wget -O /home/franko/Code/edb.com/btk/edb-lookbook/languages/edb.pot  https://elementdebase.com/wp-content/plugins/edb-lookbook/languages/edb.pot
wget -O /home/franko/Code/edb.com/btk/edb-lookbook/languages/fr_FR.po  https://elementdebase.com/wp-content/plugins/edb-lookbook/languages/fr_FR.po
wget -O /home/franko/Code/edb.com/btk/edb-lookbook/languages/fr_FR.mo  https://elementdebase.com/wp-content/plugins/edb-lookbook/languages/fr_FR.mo

sudo cd /home/franko/Code/edb.com/btk
echo "Bundling themes and plugins"
rm ./edb-theme.zip
rm ./edb-plugin.zip
rm ./edb-lookbook.zip
zip -r ./edb-theme.zip ./edb-theme
zip -r ./edb-plugin.zip ./edb-plugin
zip -r ./edb-lookbook.zip ./edb-lookbook
sudo cp ./edb-theme.zip /home/edb/
sudo cp ./edb-plugin.zip /home/edb/
sudo cp ./edb-lookbook.zip /home/edb/
sudo cp ./shell/install-dev.sh /home/edb
sudo -u edb bash -x /home/edb/install-dev.sh



