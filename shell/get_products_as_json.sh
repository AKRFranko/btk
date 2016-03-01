#!/bin/bash 

loc=`dirname $0`
json='{'
for id in `wp post list --post_type=product --format=ids`; do
  data=`$loc/get_product_as_json.sh $id`
  json="$json\"$id\":$data,"
done
json="${json::-1}}"
echo $json
