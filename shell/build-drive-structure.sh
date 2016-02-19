#! /bin/bash


declare -A SUBCATEGORIES
MATERIALS=(001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016)
CATEGORIES=('sofa-beds' 'coffee-tables' 'armchairs' 'benches-ottomans' 'headboards' 'storage')
SUBS=('sofas/{2-seater,3-seater}' 'sectionals/{left-facing,right-facing}' 'accessories/{pillows,rugs,other}')
JSON='{"name":"","sub_name":"","description": { "en": "", "fr": ""},"price": "","shipping_class": "furniture","materials":"001|002|003" }';

mkdir -p ./data/{products,materials};
for material in ${MATERIALS[@]}; do
  mkdir -p ./data/materials/$material;
  
  #JSONA="{\"id\": \"$material\", \"name\": { \"en\": \"\", \"fr\": \"\"},\"description\": {\"en\": \"\", \"fr\": \"\" },\"composition\": { \"en\": [\"linen 20%\",\"cotton 10%\"], \"fr\": [\"lin 20%\", \"coton 10%\"] } }"
  #echo $JSONA  > ./data/materials/$material/data.json
done;

for category in ${CATEGORIES[@]}; do
  mkdir -p ./data/products/$category/product_name-sub_name/{gallery,assets};
  #echo $JSON > ./data/products/$category/product_name-sub_name/data.json;
done;

mkdir -p ./data/products/sofas/{2-seater/product_name-sub_name/{gallery/variations,assets},3-seater/product_name-sub_name/{gallery/variations,assets}}
#echo $JSON > ./data/products/sofas/2-seater/product_name-sub_name/data.json;
#echo $JSON > ./data/products/sofas/3-seater/product_name-sub_name/data.json;
mkdir -p ./data/products/sectionals/{left-facing/product_name-sub_name/{gallery/variations,assets},right-facing/product_name-sub_name/{gallery/variations,assets}}
#echo $JSON > ./data/products/sectionals/left-facing/product_name-sub_name/data.json;
#echo $JSON > ./data/products/sectionals/right-facing/product_name-sub_name/data.json;
mkdir -p ./data/products/accessories/{pillows/product_name-sub_name/{gallery/variations,assets},rugs/product_name-sub_name/{gallery/variations,assets},other/product_name-sub_name/{gallery/variations,assets}}
#echo $JSON > ./data/products/accessories/pillows/product_name-sub_name/data.json;
#echo $JSON > ./data/products/accessories/rugs/product_name-sub_name/data.json;
#echo $JSON > ./data/products/accessories/other/product_name-sub_name/data.json;
