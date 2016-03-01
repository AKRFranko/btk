#!/bin/bash 
post=`wp post get $1 --format=json`
post_type=`wp post get $1 --fields=post_type --format=json | jq -Mcr '.post_type'`
meta=`wp post meta list $1 --fields=meta_key,meta_value --format=json | jq -Mcr  'map({(.meta_key):.meta_value}) | add'`
variations=''
if [ $post_type = 'product' ]; then
  variations=',"variations":['
  for id in `wp post list --post_type=product_variation --post_parent=$1 --format=ids`; do
    sub=`./$0 $id`
    variations="$variations$sub,"
  done
  variations="${variations::-1}]"
fi

echo "{\"post\":$post,\"meta\":$meta$variations}"
