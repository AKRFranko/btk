# Meant to be run as "edb". 
# Used by bundle.sh
cd /home/edb
scp edb-*.zip edb-wordpress:~/ 
ssh edb-wordpress 'bash -x install.sh && chmod -R 777 /srv/http/wordpress/development/wp-content/themes/edb-theme && chmod -R 777 /srv/http/wordpress/development/wp-content/plugins/edb-plugin && chmod -R 777 /srv/http/wordpress/development/wp-content/plugins/edb-lookbook'
exit
exit