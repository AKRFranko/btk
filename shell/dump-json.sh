#! /bin/bash 
# cd /home/franko/Code/edb.com/btk/
pwd=`pwd`
path="$pwd/shell"
if [ -d "$path" ]; then
    echo "Dumping!"
else
    exit
fi

echo "Dumping Woocommerce Options"
wp option list --search="woocommerce*" --format=json | jq -M '.'  > ./dumps/woocommerce-options.json


echo "Dumping Loco Translate Options"
wp option list --search="*loco*" --format=json | jq -M '.'  > ./dumps/loco-translate-options.json

echo "Dumping WPGlobus Options"
wp option list --search="*wpglobus*" --format=json | jq -M '.' > ./dumps/wpglobus-options.json

echo "Dumping Menus"
MENU_LIST=`wp menu list --format=json | jq -M '.[].slug' | sed -r 's/"//g'`
mkdir -p ./dumps/menus
for menu in $MENU_LIST; do
  echo -n "."
  wp menu item list $menu --format=json | jq -M  '.' > ./dumps/menus/$menu.json
done
echo 'done.'

POST_TYPES=`wp post-type list --format=json | jq -M '.[].name' | sed -r 's/"//g'`
echo -n "Dumping Posts (ignoring drafts)"
for post_type in $POST_TYPES; do
    mkdir -p ./dumps/$post_type/
    echo -n "."
    wp post list --post_type=$post_type --post_status=publish,private --format=json --fields=ID,post_title,post_name,post_status,post_content,post_excerpt,post_parent > ./dumps/$post_type/posts.json
done
echo 'done.'


echo "Dumping Metas For Important Types"
META_POST_TYPES=('lookbook' 'lookbook_slide' 'post' 'page' 'product' 'product_variation' 'shop_coupon' 'wpcf7_contact_form' 'edb_material_desc')
for post_type in ${META_POST_TYPES[@]}; do
  IDS=(`wp post list --post_type=$post_type --post_status=publish,private --format=ids`)
  mkdir -p ./dumps/$post_type/meta/
  count=${#IDS[@]}
  echo -n " - $post_type ($count)..."
  for post_id in $IDS; do
    echo -n "."
    wp post meta list $post_id --format=json > ./dumps/$post_type/meta/$post_id.json
  done
  echo "."
done
echo "done."

echo -n "Backing up translation files"
echo -n "[" > ./dumps/translations.json
shopt -s globstar
for file in /srv/http/wordpress/**/*.{po,mo,pot}; do
  file_path=`echo "${file%/*}"`
  file_name=`basename $file`
  file_contents=`php -r "echo urlencode(file_get_contents('$file'));"`
  echo -n "."
  echo -n ",{\"file_name\":\"$file_name\",\"file_path\":\"$file_path\",\"file_contents\":\"$file_contents\" }" >> ./dumps/translations.json
done
echo 'done.'
echo -n "]" >> ./dumps/translations.json
json=`cat ./dumps/translations.json | sed -r 's/\[,/[/'`
echo "$json" > ./dumps/translations.json


# echo "Dumping Metas For Important Types"
# for post_type in $POST_TYPES; do
#   IDS=`cat ./dumps/$post_type.json | jq '.[].ID'`
#   mkdir -p ./dumps/$post_type/meta
#   for post_id in $IDS; do
#     echo "./dumps/$post_type/meta/$post_id.json"
#     wp post meta list $post_id --format=json > ./dumps/$post_type/meta/$post_id.json
#   done
# done
# echo "Dumping Taxonomies"
# TAXONOMIES=`wp taxonomy list --format=json | jq '.[].name' | sed -r 's/"//g' | tr '\n' ' ' | sed -r 's/ (\w)/,\1/g'`
# for post_type in $POST_TYPES; do
#   IDS=`cat ./dumps/$post_type.json | jq '.[].ID'`
#   mkdir -p ./$post_type/terms
#   for post_id in $IDS; do
#     echo "./dumps/$post_type/terms/$post_id.json"
#     wp post term list $post_id --format=json > ./dumps/$post_type/terms/$post_id.json
#   done
# done

