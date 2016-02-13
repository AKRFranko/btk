#! /bin/bash


declare -A SUBCATEGORIES
MATERIALS=(001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016)
CATEGORIES=('sofas' 'sofa-beds' 'sectionals' 'coffee-tables' 'armchairs' 'benches-ottomans' 'headboards' 'storage' 'accessories')
ALTERNATES=('brass' 'wood' 'aluminium' 'steel')

SUBCATEGORIES['sofas']="2-seater
3-seater"
for category in ${CATEGORIES[@]}; do
  mkdir -p ./raw_products/product/$category
  SUBS=${SUBCATEGORIES[$category]}
  if [ -z "$SUBS" ]; then
    # echo "$category has no subs"
    
  else
    # echo "$category has subs"
    for sub in $SUBS; do
      mkdir -p ./raw_products/products/$category/$sub
      mkdir -p ./raw_products/products/$category/$sub/0/images/{cutout,ambiance,materials}
      feat_image=`php -r "echo file_get_contents('https://placehold.it/1500x920/998877/ffffff.png?text=featured');"` 
      cut_image_1=`php -r "echo file_get_contents('https://placehold.it/1500x920/997788/ffffff.png?text=cutout-1');"`
      cut_image_2=`php -r "echo file_get_contents('https://placehold.it/1500x920/778899/ffffff.png?text=cutout-2');"` 
      cut_image_3=`php -r "echo file_get_contents('https://placehold.it/1500x920/798789/ffffff.png?text=cutout-3');"` 
      cut_image_4=`php -r "echo file_get_contents('https://placehold.it/1500x920/887799/ffffff.png?text=cutout-4');"` 
      echo -n "$cut_image_1" > ./raw_products/products/$category/$sub/0/images/cutout/1.png
      echo -n "$cut_image_2" > ./raw_products/products/$category/$sub/0/images/cutout/2.png
      echo -n "$cut_image_3" > ./raw_products/products/$category/$sub/0/images/cutout/3.png
      echo -n "$cut_image_4" > ./raw_products/products/$category/$sub/0/images/cutout/4.png
      
      amb_image_1=`php -r "echo file_get_contents('https://placehold.it/1500x920/878978/ffffff.png?text=ambient-1');"` 
      amb_image_2=`php -r "echo file_get_contents('https://placehold.it/1500x920/878978/ffffff.png?text=ambient-2');"` 
      amb_image_3=`php -r "echo file_get_contents('https://placehold.it/1500x920/878978/ffffff.png?text=ambient-3');"` 
      amb_image_4=`php -r "echo file_get_contents('https://placehold.it/1500x920/878978/ffffff.png?text=ambient-4');"`
      echo -n "$amb_image_1" > ./raw_products/products/$category/$sub/0/images/ambiance/1.png
      echo -n "$amb_image_2" > ./raw_products/products/$category/$sub/0/images/ambiance/2.png
      echo -n "$amb_image_3" > ./raw_products/products/$category/$sub/0/images/ambiance/3.png
      echo -n "$amb_image_4" > ./raw_products/products/$category/$sub/0/images/ambiance/4.png
      
      # mkdir -p ./raw_products/products/$category/$sub/0/images/{cutout,ambiance}
      echo $sub
    done
  fi
  
done


# mkdir -p ./raw_products
# for material in ${MATERIALS[@]}; do
#   mkdir -p ./raw_products/materials/$material/images
#   JSON="{\"material_number\":\"$material\",\"name\":\"material #$material\",\"description\":\"description text for material #$material\", \"composition\": [ \"line 1 text\",\"line 2 text\",\"line 3 text\" ]}"
#   small_image=`php -r "echo file_get_contents('https://placehold.it/250x250/999$material/ffffff.png?text=$material');"`
#   large_image=`php -r "echo file_get_contents('https://placehold.it/1500x920/999$material/ffffff.png?text=$material');"`
#   echo $JSON | jq -M '.' > ./raw_products/materials/$material/data.json
#   echo -n $small_image > ./raw_products/materials/$material/images/small.png
#   echo -n $large_image > ./raw_products/materials/$material/images/large.png
# done

# for alternate in ${ALTERNATES[@]}; do
#   mkdir -p ./raw_products/alternatives/$alternate/images
#   JSON="{\"alternative_number\":\"$alternate\",\"name\":\"alternative #$alternate\",\"description\":\"description text for alternative #$alternate\"}"
#   small_image=`php -r "echo file_get_contents('https://placehold.it/250x250/$alternate999/ffffff.png?text=$alternate');"`
#   large_image=`php -r "echo file_get_contents('https://placehold.it/1500x920/$alternate999/ffffff.png?text=$alternate');"`
#   echo $JSON | jq -M '.' > ./raw_products/alternatives/$alternate/data.json
#   echo -n $small_image > ./raw_products/alternatives/$alternate/images/small.png
#   echo -n $large_image > ./raw_products/alternatives/$alternate/images/large.png
# done

