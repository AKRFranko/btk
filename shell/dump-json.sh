#! /bin/bash 
cd /home/franko/Code/edb.com/btk/

echo "Dumping Woocommerce Options"
wp option list --search="woocommerce*" --format=json | jq -M '.'  > ./dumps/woocommerce-options.json

echo "Dumping Loco Translate Options"
wp option list --search="*loco*" --format=json | jq -M '.'  > ./dumps/loco-translate-options.json

echo "Dumping WPGlobus Options"
wp option list --search="*wpglobus*" --format=json | jq -M '.' > ./dumps/wpglobus-options.json

POST_TYPES=`wp post-type list --format=json | jq -M '.[].name' | sed -r 's/"//g'`
echo "Dumping Posts"
for post_type in $POST_TYPES; do
    mkdir -p ./dumps/$post_type/
    wp post list --post_type=$post_type --format=json --fields=ID,post_title,post_name,post_status,post_content,post_excerpt,post_parent > ./dumps/$post_type/posts.json
done

echo "Dumping Metas For Important Types"
META_POST_TYPES=('post' 'page' 'product' 'product_variation' 'shop_coupon' 'wpcf7_contact_form' 'lookbook' 'lookbook_slide' 'edb_material_desc')
for post_type in ${META_POST_TYPES[@]}; do
  IDS=`cat ./dumps/$post_type/posts.json | jq '.[].ID'`
  mkdir -p ./dumps/$post_type/meta/
  for post_id in $IDS; do
    wp post meta list $post_id --format=json > ./dumps/$post_type/meta/$post_id.json
  done
done

echo "Backing up translation files"
echo -n "[" > ./dumps/translations.json
shopt -s globstar
for file in /srv/http/wordpress/**/*.{po,mo,pot}; do
  file_path=`echo "${file%/*}"`
  file_name=`basename $file`
  file_contents=`php -r "echo urlencode(file_get_contents('$file'));"`
  echo "dumping $file_path/$file_name"
  echo -n ",{\"file_name\":\"$file_name\",\"file_path\":\"$file_path\",\"file_contents\":\"$file_contents\" }" >> ./dumps/translations.json
done
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

