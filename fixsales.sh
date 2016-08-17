for pid in `wp post list --post_type=product --format=ids`;do
    echo "Product: $pid"
    wp post meta list $pid --keys=_price,_regular_price,_sale_price
#  for vid in `wp post list --post_type=product_variation --post_parent=$pid --format=ids`;do
 #   echo "Variation: $pid"
  #  wp post meta list $vid --keys=_price,_sale_price,_regular_price --format=json | jq '.'
  #done;
  #  echo "_______"

done;
