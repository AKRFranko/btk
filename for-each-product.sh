
BASE='https://badb0x.akr.club'
for PID in `wp post list --post_type=product --format=ids`; do


 name=`wp post get $PID --fields=post_name --format=json | jq -Mrc '.post_name'`
 title=`wp post get $PID --fields=post_title --format=json | jq -Mrc '.post_title'`
 subtitle=`wp post meta get $PID _subtitle`
 categories=`wp wc product get $PID --fields=categories --format=json | jq -Mrc '.categories' | tr , ' ' | awk '{print $1}' ` 
 old_url="$BASE/product/$name";
 old_url_fr="$BASE/fr/product/$name";
 new_url="$BASE/product/$categories-$title";
 new_url_fr="$BASE/fr/product/$categories-$title";
 echo "-----------------------";
 echo "Old URL (en): $old_url";
 echo "Old URL (fr): $old_url_fr";
 echo "New URL (en): $new_url";
 echo "New URL (fr): $new_url_fr";
 echo
done;
