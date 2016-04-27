# Meant to be run as "edb". 
# Used by bundle.sh
cd /home/edb
scp edb-*.zip edb-wordpress:~/ 
ssh edb-wordpress 'bash -x install-prod.sh && chmod -R 777 /srv/http/wordpress/production/wp-content/themes/edb-theme && chmod -R 777 /srv/http/wordpress/production/wp-content/plugins/edb-plugin && chmod -R 777 /srv/http/wordpress/production/wp-content/plugins/edb-lookbook && chmod -R 777 /srv/http/wordpress/production/wp-content/plugins/edb-order-tool'
exit
exit