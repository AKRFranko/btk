cd /home/franko/Code/edb.com/btk/sprint
rm ./edb-theme.zip
rm ./edb-plugin.zip
zip -r ./edb-theme.zip ./edb-theme
zip -r ./edb-plugin.zip ./edb-plugin
mv ./edb-theme.zip /home/edb/
mv ./edb-plugin.zip /home/edb/
cd /home/franko/Code/
rm ./edb-lookbook.zip
zip -r ./edb-lookbook.zip ./edb-lookbook
mv ./edb-lookbook.zip /home/edb/
cd /home/franko/Code/edb.com/btk/sprint
#sudo -u edb cd /home/edb
#sudo -u edb scp ./edb-*.zip edb-wordpress:~ 
#sudo -u edb ssh edb-wordpress 'bash -x install.sh'
sudo -u edb -i

