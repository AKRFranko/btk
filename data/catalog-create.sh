_TAB_XXX_2526053d=`wp post create --post_title="vintage-white" --post_name="_TAB_XXX_2526053d" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_2526053d --porcelain`
wp post meta update $_TAB_XXX_2526053d _visibility visible
wp post meta update $_TAB_XXX_2526053d _product_attributes '{"edb_material":{"name":"edb_material","value":"063","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_2526053d _price 350.00
wp post meta update $_TAB_XXX_2526053d _regular_price 350.00
wp post term set $_TAB_XXX_2526053d product_shipping_class furniture
wp post term set $_TAB_XXX_2526053d product_cat side-tables
wp post term set $_TAB_XXX_2526053d product_type variable
wp media import ./data/products/42-vintage_white/gallery/vintage_white_0002_000.jpg --post_id=$_TAB_XXX_2526053d --featured_image=true
_TAB_XXX_2526053d_0=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0000_001.jpg --post_id=$_TAB_XXX_2526053d --porcelain`
_TAB_XXX_2526053d_1=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0001_002.jpg --post_id=$_TAB_XXX_2526053d --porcelain`
_TAB_XXX_2526053d_2=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0002_003.jpg --post_id=$_TAB_XXX_2526053d --porcelain`
_TAB_XXX_2526053d_3=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0003_004.jpg --post_id=$_TAB_XXX_2526053d --porcelain`
_TAB_XXX_2526053d_4=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0004_005.jpg --post_id=$_TAB_XXX_2526053d --porcelain`
_TAB_XXX_2526053d_5=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0005_006.jpg --post_id=$_TAB_XXX_2526053d --porcelain`
wp post meta update $_TAB_XXX_2526053d _product_image_gallery $_TAB_XXX_2526053d_0,$_TAB_XXX_2526053d_1,$_TAB_XXX_2526053d_2,$_TAB_XXX_2526053d_3,$_TAB_XXX_2526053d_4,$_TAB_XXX_2526053d_5
_TAB_063_3bfd0603=`wp post create --post_title="vintage-white-063" --post_name="_TAB_XXX_2526053d_063" --post_parent=$_TAB_XXX_2526053d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_2526053d_063 --porcelain`
wp post meta update $_TAB_063_3bfd0603 _visibility visible
wp post meta update $_TAB_063_3bfd0603 attribute_edb_material 063
wp post meta update $_TAB_063_3bfd0603 _stock 2
wp post meta update $_TAB_063_3bfd0603 _stock_status instock
wp post meta update $_TAB_063_3bfd0603 _manage_stock yes
wp post meta update $_TAB_063_3bfd0603 _backorders yes
wp post meta update $_TAB_063_3bfd0603 _price 350.00
wp post meta update $_TAB_063_3bfd0603 _regular_price 350.00
wp post meta update $_TAB_063_3bfd0603 _sku TAB-063-3bfd0603
wp media import ./data/products/42-vintage_white/gallery/vintage_white_0002_000.jpg --post_id=$_TAB_063_3bfd0603 --featured_image=true
_TAB_XXX_29ef05a5=`wp post create --post_title="t_table-yellow" --post_name="_TAB_XXX_29ef05a5" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_29ef05a5 --porcelain`
wp post meta update $_TAB_XXX_29ef05a5 _visibility visible
wp post meta update $_TAB_XXX_29ef05a5 _product_attributes '{"edb_material":{"name":"edb_material","value":"062","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_29ef05a5 _price 350.00
wp post meta update $_TAB_XXX_29ef05a5 _regular_price 350.00
wp post term set $_TAB_XXX_29ef05a5 product_shipping_class furniture
wp post term set $_TAB_XXX_29ef05a5 product_cat side-tables
wp post term set $_TAB_XXX_29ef05a5 product_type variable
wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_000.jpg --post_id=$_TAB_XXX_29ef05a5 --featured_image=true
_TAB_XXX_29ef05a5_0=`wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_0000_001.jpg --post_id=$_TAB_XXX_29ef05a5 --porcelain`
_TAB_XXX_29ef05a5_1=`wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_0001_002.jpg --post_id=$_TAB_XXX_29ef05a5 --porcelain`
_TAB_XXX_29ef05a5_2=`wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_0002_003.jpg --post_id=$_TAB_XXX_29ef05a5 --porcelain`
_TAB_XXX_29ef05a5_3=`wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_0003_004.jpg --post_id=$_TAB_XXX_29ef05a5 --porcelain`
_TAB_XXX_29ef05a5_4=`wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_0004_005.jpg --post_id=$_TAB_XXX_29ef05a5 --porcelain`
wp post meta update $_TAB_XXX_29ef05a5 _product_image_gallery $_TAB_XXX_29ef05a5_0,$_TAB_XXX_29ef05a5_1,$_TAB_XXX_29ef05a5_2,$_TAB_XXX_29ef05a5_3,$_TAB_XXX_29ef05a5_4
_TAB_062_4265066a=`wp post create --post_title="t_table-yellow-062" --post_name="_TAB_XXX_29ef05a5_062" --post_parent=$_TAB_XXX_29ef05a5 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_29ef05a5_062 --porcelain`
wp post meta update $_TAB_062_4265066a _visibility visible
wp post meta update $_TAB_062_4265066a attribute_edb_material 062
wp post meta update $_TAB_062_4265066a _stock 2
wp post meta update $_TAB_062_4265066a _stock_status instock
wp post meta update $_TAB_062_4265066a _manage_stock yes
wp post meta update $_TAB_062_4265066a _backorders yes
wp post meta update $_TAB_062_4265066a _price 350.00
wp post meta update $_TAB_062_4265066a _regular_price 350.00
wp post meta update $_TAB_062_4265066a _sku TAB-062-4265066a
wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_000.jpg --post_id=$_TAB_062_4265066a --featured_image=true
_TAB_XXX_2b4805b2=`wp post create --post_title="perplexe-smoke" --post_name="_TAB_XXX_2b4805b2" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_2b4805b2 --porcelain`
wp post meta update $_TAB_XXX_2b4805b2 _visibility visible
wp post meta update $_TAB_XXX_2b4805b2 _product_attributes '{"edb_material":{"name":"edb_material","value":"059","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_2b4805b2 _price 350.00
wp post meta update $_TAB_XXX_2b4805b2 _regular_price 350.00
wp post term set $_TAB_XXX_2b4805b2 product_shipping_class furniture
wp post term set $_TAB_XXX_2b4805b2 product_cat side-tables
wp post term set $_TAB_XXX_2b4805b2 product_type variable
wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_000.jpg --post_id=$_TAB_XXX_2b4805b2 --featured_image=true
_TAB_XXX_2b4805b2_0=`wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_0000_001.jpg --post_id=$_TAB_XXX_2b4805b2 --porcelain`
_TAB_XXX_2b4805b2_1=`wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_0001_002.jpg --post_id=$_TAB_XXX_2b4805b2 --porcelain`
_TAB_XXX_2b4805b2_2=`wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_0002_003.jpg --post_id=$_TAB_XXX_2b4805b2 --porcelain`
_TAB_XXX_2b4805b2_3=`wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_0003_004.jpg --post_id=$_TAB_XXX_2b4805b2 --porcelain`
wp post meta update $_TAB_XXX_2b4805b2 _product_image_gallery $_TAB_XXX_2b4805b2_0,$_TAB_XXX_2b4805b2_1,$_TAB_XXX_2b4805b2_2,$_TAB_XXX_2b4805b2_3
_TAB_059_43f7067d=`wp post create --post_title="perplexe-smoke-059" --post_name="_TAB_XXX_2b4805b2_059" --post_parent=$_TAB_XXX_2b4805b2 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_2b4805b2_059 --porcelain`
wp post meta update $_TAB_059_43f7067d _visibility visible
wp post meta update $_TAB_059_43f7067d attribute_edb_material 059
wp post meta update $_TAB_059_43f7067d _stock 2
wp post meta update $_TAB_059_43f7067d _stock_status instock
wp post meta update $_TAB_059_43f7067d _manage_stock yes
wp post meta update $_TAB_059_43f7067d _backorders yes
wp post meta update $_TAB_059_43f7067d _price 350.00
wp post meta update $_TAB_059_43f7067d _regular_price 350.00
wp post meta update $_TAB_059_43f7067d _sku TAB-059-43f7067d
wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_000.jpg --post_id=$_TAB_059_43f7067d --featured_image=true
_TAB_XXX_257c0545=`wp post create --post_title="perplexe-pink" --post_name="_TAB_XXX_257c0545" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_257c0545 --porcelain`
wp post meta update $_TAB_XXX_257c0545 _visibility visible
wp post meta update $_TAB_XXX_257c0545 _product_attributes '{"edb_material":{"name":"edb_material","value":"058","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_257c0545 _price 350.00
wp post meta update $_TAB_XXX_257c0545 _regular_price 350.00
wp post term set $_TAB_XXX_257c0545 product_shipping_class furniture
wp post term set $_TAB_XXX_257c0545 product_cat side-tables
wp post term set $_TAB_XXX_257c0545 product_type variable
wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_000.jpg --post_id=$_TAB_XXX_257c0545 --featured_image=true
_TAB_XXX_257c0545_0=`wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_0000_001.jpg --post_id=$_TAB_XXX_257c0545 --porcelain`
_TAB_XXX_257c0545_1=`wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_0001_002.jpg --post_id=$_TAB_XXX_257c0545 --porcelain`
_TAB_XXX_257c0545_2=`wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_0002_003.jpg --post_id=$_TAB_XXX_257c0545 --porcelain`
_TAB_XXX_257c0545_3=`wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_0003_004.jpg --post_id=$_TAB_XXX_257c0545 --porcelain`
_TAB_XXX_257c0545_4=`wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_0004_005.jpg --post_id=$_TAB_XXX_257c0545 --porcelain`
wp post meta update $_TAB_XXX_257c0545 _product_image_gallery $_TAB_XXX_257c0545_0,$_TAB_XXX_257c0545_1,$_TAB_XXX_257c0545_2,$_TAB_XXX_257c0545_3,$_TAB_XXX_257c0545_4
_TAB_058_3c76060f=`wp post create --post_title="perplexe-pink-058" --post_name="_TAB_XXX_257c0545_058" --post_parent=$_TAB_XXX_257c0545 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_257c0545_058 --porcelain`
wp post meta update $_TAB_058_3c76060f _visibility visible
wp post meta update $_TAB_058_3c76060f attribute_edb_material 058
wp post meta update $_TAB_058_3c76060f _stock 2
wp post meta update $_TAB_058_3c76060f _stock_status instock
wp post meta update $_TAB_058_3c76060f _manage_stock yes
wp post meta update $_TAB_058_3c76060f _backorders yes
wp post meta update $_TAB_058_3c76060f _price 350.00
wp post meta update $_TAB_058_3c76060f _regular_price 350.00
wp post meta update $_TAB_058_3c76060f _sku TAB-058-3c76060f
wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_000.jpg --post_id=$_TAB_058_3c76060f --featured_image=true
_TAB_XXX_2b4205ba=`wp post create --post_title="perplexe-azure" --post_name="_TAB_XXX_2b4205ba" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_2b4205ba --porcelain`
wp post meta update $_TAB_XXX_2b4205ba _visibility visible
wp post meta update $_TAB_XXX_2b4205ba _product_attributes '{"edb_material":{"name":"edb_material","value":"057","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_2b4205ba _price 350.00
wp post meta update $_TAB_XXX_2b4205ba _regular_price 350.00
wp post term set $_TAB_XXX_2b4205ba product_shipping_class furniture
wp post term set $_TAB_XXX_2b4205ba product_cat side-tables
wp post term set $_TAB_XXX_2b4205ba product_type variable
wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_000.jpg --post_id=$_TAB_XXX_2b4205ba --featured_image=true
_TAB_XXX_2b4205ba_0=`wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_0000_001.jpg --post_id=$_TAB_XXX_2b4205ba --porcelain`
_TAB_XXX_2b4205ba_1=`wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_0001_002.jpg --post_id=$_TAB_XXX_2b4205ba --porcelain`
_TAB_XXX_2b4205ba_2=`wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_0002_003.jpg --post_id=$_TAB_XXX_2b4205ba --porcelain`
_TAB_XXX_2b4205ba_3=`wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_0003_004.jpg --post_id=$_TAB_XXX_2b4205ba --porcelain`
_TAB_XXX_2b4205ba_4=`wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_0004_005.jpg --post_id=$_TAB_XXX_2b4205ba --porcelain`
wp post meta update $_TAB_XXX_2b4205ba _product_image_gallery $_TAB_XXX_2b4205ba_0,$_TAB_XXX_2b4205ba_1,$_TAB_XXX_2b4205ba_2,$_TAB_XXX_2b4205ba_3,$_TAB_XXX_2b4205ba_4
_TAB_057_440f0683=`wp post create --post_title="perplexe-azure-057" --post_name="_TAB_XXX_2b4205ba_057" --post_parent=$_TAB_XXX_2b4205ba --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_2b4205ba_057 --porcelain`
wp post meta update $_TAB_057_440f0683 _visibility visible
wp post meta update $_TAB_057_440f0683 attribute_edb_material 057
wp post meta update $_TAB_057_440f0683 _stock 2
wp post meta update $_TAB_057_440f0683 _stock_status instock
wp post meta update $_TAB_057_440f0683 _manage_stock yes
wp post meta update $_TAB_057_440f0683 _backorders yes
wp post meta update $_TAB_057_440f0683 _price 350.00
wp post meta update $_TAB_057_440f0683 _regular_price 350.00
wp post meta update $_TAB_057_440f0683 _sku TAB-057-440f0683
wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_000.jpg --post_id=$_TAB_057_440f0683 --featured_image=true
_TAB_XXX_1a9e0464=`wp post create --post_title="tamtam-pink" --post_name="_TAB_XXX_1a9e0464" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_1a9e0464 --porcelain`
wp post meta update $_TAB_XXX_1a9e0464 _visibility visible
wp post meta update $_TAB_XXX_1a9e0464 _product_attributes '{"edb_material":{"name":"edb_material","value":"056","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_1a9e0464 _price 350.00
wp post meta update $_TAB_XXX_1a9e0464 _regular_price 350.00
wp post term set $_TAB_XXX_1a9e0464 product_shipping_class furniture
wp post term set $_TAB_XXX_1a9e0464 product_cat side-tables
wp post term set $_TAB_XXX_1a9e0464 product_type variable
wp media import ./data/products/35-tamtam_pink/gallery/tamtam_pink_0000_000.jpg --post_id=$_TAB_XXX_1a9e0464 --featured_image=true
_TAB_XXX_1a9e0464_0=`wp media import ./data/products/35-tamtam_pink/gallery/tamtam_pink_0001_002.jpg --post_id=$_TAB_XXX_1a9e0464 --porcelain`
_TAB_XXX_1a9e0464_1=`wp media import ./data/products/35-tamtam_pink/gallery/tamtam_pink_0002_003.jpg --post_id=$_TAB_XXX_1a9e0464 --porcelain`
_TAB_XXX_1a9e0464_2=`wp media import ./data/products/35-tamtam_pink/gallery/tamtam_pink_0000_004.jpg --post_id=$_TAB_XXX_1a9e0464 --porcelain`
wp post meta update $_TAB_XXX_1a9e0464 _product_image_gallery $_TAB_XXX_1a9e0464_0,$_TAB_XXX_1a9e0464_1,$_TAB_XXX_1a9e0464_2
_TAB_056_2e12052c=`wp post create --post_title="tamtam-pink-056" --post_name="_TAB_XXX_1a9e0464_056" --post_parent=$_TAB_XXX_1a9e0464 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_1a9e0464_056 --porcelain`
wp post meta update $_TAB_056_2e12052c _visibility visible
wp post meta update $_TAB_056_2e12052c attribute_edb_material 056
wp post meta update $_TAB_056_2e12052c _stock 2
wp post meta update $_TAB_056_2e12052c _stock_status instock
wp post meta update $_TAB_056_2e12052c _manage_stock yes
wp post meta update $_TAB_056_2e12052c _backorders yes
wp post meta update $_TAB_056_2e12052c _price 350.00
wp post meta update $_TAB_056_2e12052c _regular_price 350.00
wp post meta update $_TAB_056_2e12052c _sku TAB-056-2e12052c
wp media import ./data/products/35-tamtam_pink/gallery/tamtam_pink_0000_000.jpg --post_id=$_TAB_056_2e12052c --featured_image=true
_TAB_XXX_1a77045a=`wp post create --post_title="tamtam-blue" --post_name="_TAB_XXX_1a77045a" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_1a77045a --porcelain`
wp post meta update $_TAB_XXX_1a77045a _visibility visible
wp post meta update $_TAB_XXX_1a77045a _product_attributes '{"edb_material":{"name":"edb_material","value":"055","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_1a77045a _price 350.00
wp post meta update $_TAB_XXX_1a77045a _regular_price 350.00
wp post term set $_TAB_XXX_1a77045a product_shipping_class furniture
wp post term set $_TAB_XXX_1a77045a product_cat side-tables
wp post term set $_TAB_XXX_1a77045a product_type variable
wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0000_000.jpg --post_id=$_TAB_XXX_1a77045a --featured_image=true
_TAB_XXX_1a77045a_0=`wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0001_002.jpg --post_id=$_TAB_XXX_1a77045a --porcelain`
_TAB_XXX_1a77045a_1=`wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0002_003.jpg --post_id=$_TAB_XXX_1a77045a --porcelain`
_TAB_XXX_1a77045a_2=`wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0003_004.jpg --post_id=$_TAB_XXX_1a77045a --porcelain`
_TAB_XXX_1a77045a_3=`wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0000_005.jpg --post_id=$_TAB_XXX_1a77045a --porcelain`
wp post meta update $_TAB_XXX_1a77045a _product_image_gallery $_TAB_XXX_1a77045a_0,$_TAB_XXX_1a77045a_1,$_TAB_XXX_1a77045a_2,$_TAB_XXX_1a77045a_3
_TAB_055_2dc20521=`wp post create --post_title="tamtam-blue-055" --post_name="_TAB_XXX_1a77045a_055" --post_parent=$_TAB_XXX_1a77045a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_1a77045a_055 --porcelain`
wp post meta update $_TAB_055_2dc20521 _visibility visible
wp post meta update $_TAB_055_2dc20521 attribute_edb_material 055
wp post meta update $_TAB_055_2dc20521 _stock 2
wp post meta update $_TAB_055_2dc20521 _stock_status instock
wp post meta update $_TAB_055_2dc20521 _manage_stock yes
wp post meta update $_TAB_055_2dc20521 _backorders yes
wp post meta update $_TAB_055_2dc20521 _price 350.00
wp post meta update $_TAB_055_2dc20521 _regular_price 350.00
wp post meta update $_TAB_055_2dc20521 _sku TAB-055-2dc20521
wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0000_000.jpg --post_id=$_TAB_055_2dc20521 --featured_image=true
_TAB_XXX_1a910469=`wp post create --post_title="tamtam-grey" --post_name="_TAB_XXX_1a910469" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_1a910469 --porcelain`
wp post meta update $_TAB_XXX_1a910469 _visibility visible
wp post meta update $_TAB_XXX_1a910469 _product_attributes '{"edb_material":{"name":"edb_material","value":"054","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_1a910469 _price 350.00
wp post meta update $_TAB_XXX_1a910469 _regular_price 350.00
wp post term set $_TAB_XXX_1a910469 product_shipping_class furniture
wp post term set $_TAB_XXX_1a910469 product_cat side-tables
wp post term set $_TAB_XXX_1a910469 product_type variable
wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_000.jpg --post_id=$_TAB_XXX_1a910469 --featured_image=true
_TAB_XXX_1a910469_0=`wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_0001_002.jpg --post_id=$_TAB_XXX_1a910469 --porcelain`
_TAB_XXX_1a910469_1=`wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_0002_003.jpg --post_id=$_TAB_XXX_1a910469 --porcelain`
_TAB_XXX_1a910469_2=`wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_0003_004.jpg --post_id=$_TAB_XXX_1a910469 --porcelain`
_TAB_XXX_1a910469_3=`wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_000_005.jpg --post_id=$_TAB_XXX_1a910469 --porcelain`
wp post meta update $_TAB_XXX_1a910469 _product_image_gallery $_TAB_XXX_1a910469_0,$_TAB_XXX_1a910469_1,$_TAB_XXX_1a910469_2,$_TAB_XXX_1a910469_3
_TAB_054_2e17052f=`wp post create --post_title="tamtam-grey-054" --post_name="_TAB_XXX_1a910469_054" --post_parent=$_TAB_XXX_1a910469 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_1a910469_054 --porcelain`
wp post meta update $_TAB_054_2e17052f _visibility visible
wp post meta update $_TAB_054_2e17052f attribute_edb_material 054
wp post meta update $_TAB_054_2e17052f _stock 2
wp post meta update $_TAB_054_2e17052f _stock_status instock
wp post meta update $_TAB_054_2e17052f _manage_stock yes
wp post meta update $_TAB_054_2e17052f _backorders yes
wp post meta update $_TAB_054_2e17052f _price 350.00
wp post meta update $_TAB_054_2e17052f _regular_price 350.00
wp post meta update $_TAB_054_2e17052f _sku TAB-054-2e17052f
wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_000.jpg --post_id=$_TAB_054_2e17052f --featured_image=true
_TAB_XXX_1f4004c3=`wp post create --post_title="tamtam-green" --post_name="_TAB_XXX_1f4004c3" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_1f4004c3 --porcelain`
wp post meta update $_TAB_XXX_1f4004c3 _visibility visible
wp post meta update $_TAB_XXX_1f4004c3 _product_attributes '{"edb_material":{"name":"edb_material","value":"053","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_1f4004c3 _price 350.00
wp post meta update $_TAB_XXX_1f4004c3 _regular_price 350.00
wp post term set $_TAB_XXX_1f4004c3 product_shipping_class furniture
wp post term set $_TAB_XXX_1f4004c3 product_cat side-tables
wp post term set $_TAB_XXX_1f4004c3 product_type variable
wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_000.jpg --post_id=$_TAB_XXX_1f4004c3 --featured_image=true
_TAB_XXX_1f4004c3_0=`wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_0001_002.jpg --post_id=$_TAB_XXX_1f4004c3 --porcelain`
_TAB_XXX_1f4004c3_1=`wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_0002_003.jpg --post_id=$_TAB_XXX_1f4004c3 --porcelain`
_TAB_XXX_1f4004c3_2=`wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_0003_004.jpg --post_id=$_TAB_XXX_1f4004c3 --porcelain`
_TAB_XXX_1f4004c3_3=`wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_0000_005.jpg --post_id=$_TAB_XXX_1f4004c3 --porcelain`
wp post meta update $_TAB_XXX_1f4004c3 _product_image_gallery $_TAB_XXX_1f4004c3_0,$_TAB_XXX_1f4004c3_1,$_TAB_XXX_1f4004c3_2,$_TAB_XXX_1f4004c3_3
_TAB_053_342d0588=`wp post create --post_title="tamtam-green-053" --post_name="_TAB_XXX_1f4004c3_053" --post_parent=$_TAB_XXX_1f4004c3 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_1f4004c3_053 --porcelain`
wp post meta update $_TAB_053_342d0588 _visibility visible
wp post meta update $_TAB_053_342d0588 attribute_edb_material 053
wp post meta update $_TAB_053_342d0588 _stock 2
wp post meta update $_TAB_053_342d0588 _stock_status instock
wp post meta update $_TAB_053_342d0588 _manage_stock yes
wp post meta update $_TAB_053_342d0588 _backorders yes
wp post meta update $_TAB_053_342d0588 _price 350.00
wp post meta update $_TAB_053_342d0588 _regular_price 350.00
wp post meta update $_TAB_053_342d0588 _sku TAB-053-342d0588
wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_000.jpg --post_id=$_TAB_053_342d0588 --featured_image=true
_TAB_XXX_2495052e=`wp post create --post_title="tamtam-orange" --post_name="_TAB_XXX_2495052e" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_2495052e --porcelain`
wp post meta update $_TAB_XXX_2495052e _visibility visible
wp post meta update $_TAB_XXX_2495052e _product_attributes '{"edb_material":{"name":"edb_material","value":"052","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_2495052e _price 350.00
wp post meta update $_TAB_XXX_2495052e _regular_price 350.00
wp post term set $_TAB_XXX_2495052e product_shipping_class furniture
wp post term set $_TAB_XXX_2495052e product_cat side-tables
wp post term set $_TAB_XXX_2495052e product_type variable
wp media import ./data/products/31-tamtam_orange/gallery/tamtam_orange_0000_000.jpg --post_id=$_TAB_XXX_2495052e --featured_image=true
_TAB_XXX_2495052e_0=`wp media import ./data/products/31-tamtam_orange/gallery/tamtam_orange_0001_002.jpg --post_id=$_TAB_XXX_2495052e --porcelain`
_TAB_XXX_2495052e_1=`wp media import ./data/products/31-tamtam_orange/gallery/tamtam_orange_0002_003.jpg --post_id=$_TAB_XXX_2495052e --porcelain`
_TAB_XXX_2495052e_2=`wp media import ./data/products/31-tamtam_orange/gallery/tamtam_orange_0000_005.jpg --post_id=$_TAB_XXX_2495052e --porcelain`
wp post meta update $_TAB_XXX_2495052e _product_image_gallery $_TAB_XXX_2495052e_0,$_TAB_XXX_2495052e_1,$_TAB_XXX_2495052e_2
_TAB_052_3b2d05f2=`wp post create --post_title="tamtam-orange-052" --post_name="_TAB_XXX_2495052e_052" --post_parent=$_TAB_XXX_2495052e --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_2495052e_052 --porcelain`
wp post meta update $_TAB_052_3b2d05f2 _visibility visible
wp post meta update $_TAB_052_3b2d05f2 attribute_edb_material 052
wp post meta update $_TAB_052_3b2d05f2 _stock 2
wp post meta update $_TAB_052_3b2d05f2 _stock_status instock
wp post meta update $_TAB_052_3b2d05f2 _manage_stock yes
wp post meta update $_TAB_052_3b2d05f2 _backorders yes
wp post meta update $_TAB_052_3b2d05f2 _price 350.00
wp post meta update $_TAB_052_3b2d05f2 _regular_price 350.00
wp post meta update $_TAB_052_3b2d05f2 _sku TAB-052-3b2d05f2
wp media import ./data/products/31-tamtam_orange/gallery/tamtam_orange_0000_000.jpg --post_id=$_TAB_052_3b2d05f2 --featured_image=true
_TAB_XXX_24d8054e=`wp post create --post_title="tamtam-yellow" --post_name="_TAB_XXX_24d8054e" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_TAB_XXX_24d8054e --porcelain`
wp post meta update $_TAB_XXX_24d8054e _visibility visible
wp post meta update $_TAB_XXX_24d8054e _product_attributes '{"edb_material":{"name":"edb_material","value":"051","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TAB_XXX_24d8054e _price 350.00
wp post meta update $_TAB_XXX_24d8054e _regular_price 350.00
wp post term set $_TAB_XXX_24d8054e product_shipping_class furniture
wp post term set $_TAB_XXX_24d8054e product_cat side-tables
wp post term set $_TAB_XXX_24d8054e product_type variable
wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_000.jpg --post_id=$_TAB_XXX_24d8054e --featured_image=true
_TAB_XXX_24d8054e_0=`wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_0001_002.jpg --post_id=$_TAB_XXX_24d8054e --porcelain`
_TAB_XXX_24d8054e_1=`wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_0002_003.jpg --post_id=$_TAB_XXX_24d8054e --porcelain`
_TAB_XXX_24d8054e_2=`wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_0003_004.jpg --post_id=$_TAB_XXX_24d8054e --porcelain`
_TAB_XXX_24d8054e_3=`wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_0000_005.jpg --post_id=$_TAB_XXX_24d8054e --porcelain`
wp post meta update $_TAB_XXX_24d8054e _product_image_gallery $_TAB_XXX_24d8054e_0,$_TAB_XXX_24d8054e_1,$_TAB_XXX_24d8054e_2,$_TAB_XXX_24d8054e_3
_TAB_051_3bef0611=`wp post create --post_title="tamtam-yellow-051" --post_name="_TAB_XXX_24d8054e_051" --post_parent=$_TAB_XXX_24d8054e --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_TAB_XXX_24d8054e_051 --porcelain`
wp post meta update $_TAB_051_3bef0611 _visibility visible
wp post meta update $_TAB_051_3bef0611 attribute_edb_material 051
wp post meta update $_TAB_051_3bef0611 _stock 2
wp post meta update $_TAB_051_3bef0611 _stock_status instock
wp post meta update $_TAB_051_3bef0611 _manage_stock yes
wp post meta update $_TAB_051_3bef0611 _backorders yes
wp post meta update $_TAB_051_3bef0611 _price 350.00
wp post meta update $_TAB_051_3bef0611 _regular_price 350.00
wp post meta update $_TAB_051_3bef0611 _sku TAB-051-3bef0611
wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_000.jpg --post_id=$_TAB_051_3bef0611 --featured_image=true
_RGT_XXX_067b0225=`wp post create --post_title="pique" --post_name="_RGT_XXX_067b0225" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_RGT_XXX_067b0225 --porcelain`
wp post meta update $_RGT_XXX_067b0225 _visibility visible
wp post meta update $_RGT_XXX_067b0225 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_RGT_XXX_067b0225 _price 350.00
wp post meta update $_RGT_XXX_067b0225 _regular_price 350.00
wp post term set $_RGT_XXX_067b0225 product_shipping_class furniture
wp post term set $_RGT_XXX_067b0225 product_cat sectionals-right-facing
wp post term set $_RGT_XXX_067b0225 product_type variable
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_XXX_067b0225 --featured_image=true
_RGT_XXX_067b0225_0=`wp media import ./data/products/18-pique/gallery/pique_left_0000_001.jpg --post_id=$_RGT_XXX_067b0225 --porcelain`
_RGT_XXX_067b0225_1=`wp media import ./data/products/18-pique/gallery/pique_left_0001_002.jpg --post_id=$_RGT_XXX_067b0225 --porcelain`
_RGT_XXX_067b0225_2=`wp media import ./data/products/18-pique/gallery/pique_left_0002_003.jpg --post_id=$_RGT_XXX_067b0225 --porcelain`
_RGT_XXX_067b0225_3=`wp media import ./data/products/18-pique/gallery/pique_left_0003_004.jpg --post_id=$_RGT_XXX_067b0225 --porcelain`
_RGT_XXX_067b0225_4=`wp media import ./data/products/18-pique/gallery/pique_left_0000_005.jpg --post_id=$_RGT_XXX_067b0225 --porcelain`
_RGT_XXX_067b0225_5=`wp media import ./data/products/18-pique/gallery/pique_left_0001_006.jpg --post_id=$_RGT_XXX_067b0225 --porcelain`
_RGT_XXX_067b0225_6=`wp media import ./data/products/18-pique/gallery/pique_left_0002_007.jpg --post_id=$_RGT_XXX_067b0225 --porcelain`
wp post meta update $_RGT_XXX_067b0225 _product_image_gallery $_RGT_XXX_067b0225_0,$_RGT_XXX_067b0225_1,$_RGT_XXX_067b0225_2,$_RGT_XXX_067b0225_3,$_RGT_XXX_067b0225_4,$_RGT_XXX_067b0225_5,$_RGT_XXX_067b0225_6
_RGT_001_10e402e3=`wp post create --post_title="pique-001" --post_name="_RGT_XXX_067b0225_001" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_001 --porcelain`
wp post meta update $_RGT_001_10e402e3 _visibility visible
wp post meta update $_RGT_001_10e402e3 attribute_edb_material 001
wp post meta update $_RGT_001_10e402e3 _stock 2
wp post meta update $_RGT_001_10e402e3 _stock_status instock
wp post meta update $_RGT_001_10e402e3 _manage_stock yes
wp post meta update $_RGT_001_10e402e3 _backorders yes
wp post meta update $_RGT_001_10e402e3 _price 350.00
wp post meta update $_RGT_001_10e402e3 _regular_price 350.00
wp post meta update $_RGT_001_10e402e3 _sku RGT-001-10e402e3
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_001_10e402e3 --featured_image=true
_RGT_002_10e502e4=`wp post create --post_title="pique-002" --post_name="_RGT_XXX_067b0225_002" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_002 --porcelain`
wp post meta update $_RGT_002_10e502e4 _visibility visible
wp post meta update $_RGT_002_10e502e4 attribute_edb_material 002
wp post meta update $_RGT_002_10e502e4 _stock 2
wp post meta update $_RGT_002_10e502e4 _stock_status instock
wp post meta update $_RGT_002_10e502e4 _manage_stock yes
wp post meta update $_RGT_002_10e502e4 _backorders yes
wp post meta update $_RGT_002_10e502e4 _price 350.00
wp post meta update $_RGT_002_10e502e4 _regular_price 350.00
wp post meta update $_RGT_002_10e502e4 _sku RGT-002-10e502e4
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_002_10e502e4 --featured_image=true
_RGT_003_10e602e5=`wp post create --post_title="pique-003" --post_name="_RGT_XXX_067b0225_003" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_003 --porcelain`
wp post meta update $_RGT_003_10e602e5 _visibility visible
wp post meta update $_RGT_003_10e602e5 attribute_edb_material 003
wp post meta update $_RGT_003_10e602e5 _stock 2
wp post meta update $_RGT_003_10e602e5 _stock_status instock
wp post meta update $_RGT_003_10e602e5 _manage_stock yes
wp post meta update $_RGT_003_10e602e5 _backorders yes
wp post meta update $_RGT_003_10e602e5 _price 350.00
wp post meta update $_RGT_003_10e602e5 _regular_price 350.00
wp post meta update $_RGT_003_10e602e5 _sku RGT-003-10e602e5
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_003_10e602e5 --featured_image=true
_RGT_004_10e702e6=`wp post create --post_title="pique-004" --post_name="_RGT_XXX_067b0225_004" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_004 --porcelain`
wp post meta update $_RGT_004_10e702e6 _visibility visible
wp post meta update $_RGT_004_10e702e6 attribute_edb_material 004
wp post meta update $_RGT_004_10e702e6 _stock 2
wp post meta update $_RGT_004_10e702e6 _stock_status instock
wp post meta update $_RGT_004_10e702e6 _manage_stock yes
wp post meta update $_RGT_004_10e702e6 _backorders yes
wp post meta update $_RGT_004_10e702e6 _price 350.00
wp post meta update $_RGT_004_10e702e6 _regular_price 350.00
wp post meta update $_RGT_004_10e702e6 _sku RGT-004-10e702e6
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_004_10e702e6 --featured_image=true
_RGT_005_10e802e7=`wp post create --post_title="pique-005" --post_name="_RGT_XXX_067b0225_005" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_005 --porcelain`
wp post meta update $_RGT_005_10e802e7 _visibility visible
wp post meta update $_RGT_005_10e802e7 attribute_edb_material 005
wp post meta update $_RGT_005_10e802e7 _stock 2
wp post meta update $_RGT_005_10e802e7 _stock_status instock
wp post meta update $_RGT_005_10e802e7 _manage_stock yes
wp post meta update $_RGT_005_10e802e7 _backorders yes
wp post meta update $_RGT_005_10e802e7 _price 350.00
wp post meta update $_RGT_005_10e802e7 _regular_price 350.00
wp post meta update $_RGT_005_10e802e7 _sku RGT-005-10e802e7
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_005_10e802e7 --featured_image=true
_RGT_006_10e902e8=`wp post create --post_title="pique-006" --post_name="_RGT_XXX_067b0225_006" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_006 --porcelain`
wp post meta update $_RGT_006_10e902e8 _visibility visible
wp post meta update $_RGT_006_10e902e8 attribute_edb_material 006
wp post meta update $_RGT_006_10e902e8 _stock 2
wp post meta update $_RGT_006_10e902e8 _stock_status instock
wp post meta update $_RGT_006_10e902e8 _manage_stock yes
wp post meta update $_RGT_006_10e902e8 _backorders yes
wp post meta update $_RGT_006_10e902e8 _price 350.00
wp post meta update $_RGT_006_10e902e8 _regular_price 350.00
wp post meta update $_RGT_006_10e902e8 _sku RGT-006-10e902e8
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_006_10e902e8 --featured_image=true
_RGT_007_10ea02e9=`wp post create --post_title="pique-007" --post_name="_RGT_XXX_067b0225_007" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_007 --porcelain`
wp post meta update $_RGT_007_10ea02e9 _visibility visible
wp post meta update $_RGT_007_10ea02e9 attribute_edb_material 007
wp post meta update $_RGT_007_10ea02e9 _stock 2
wp post meta update $_RGT_007_10ea02e9 _stock_status instock
wp post meta update $_RGT_007_10ea02e9 _manage_stock yes
wp post meta update $_RGT_007_10ea02e9 _backorders yes
wp post meta update $_RGT_007_10ea02e9 _price 350.00
wp post meta update $_RGT_007_10ea02e9 _regular_price 350.00
wp post meta update $_RGT_007_10ea02e9 _sku RGT-007-10ea02e9
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_007_10ea02e9 --featured_image=true
_RGT_008_10eb02ea=`wp post create --post_title="pique-008" --post_name="_RGT_XXX_067b0225_008" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_008 --porcelain`
wp post meta update $_RGT_008_10eb02ea _visibility visible
wp post meta update $_RGT_008_10eb02ea attribute_edb_material 008
wp post meta update $_RGT_008_10eb02ea _stock 2
wp post meta update $_RGT_008_10eb02ea _stock_status instock
wp post meta update $_RGT_008_10eb02ea _manage_stock yes
wp post meta update $_RGT_008_10eb02ea _backorders yes
wp post meta update $_RGT_008_10eb02ea _price 350.00
wp post meta update $_RGT_008_10eb02ea _regular_price 350.00
wp post meta update $_RGT_008_10eb02ea _sku RGT-008-10eb02ea
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_008_10eb02ea --featured_image=true
_RGT_009_10ec02eb=`wp post create --post_title="pique-009" --post_name="_RGT_XXX_067b0225_009" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_009 --porcelain`
wp post meta update $_RGT_009_10ec02eb _visibility visible
wp post meta update $_RGT_009_10ec02eb attribute_edb_material 009
wp post meta update $_RGT_009_10ec02eb _stock 2
wp post meta update $_RGT_009_10ec02eb _stock_status instock
wp post meta update $_RGT_009_10ec02eb _manage_stock yes
wp post meta update $_RGT_009_10ec02eb _backorders yes
wp post meta update $_RGT_009_10ec02eb _price 350.00
wp post meta update $_RGT_009_10ec02eb _regular_price 350.00
wp post meta update $_RGT_009_10ec02eb _sku RGT-009-10ec02eb
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_009_10ec02eb --featured_image=true
_RGT_010_10e502e3=`wp post create --post_title="pique-010" --post_name="_RGT_XXX_067b0225_010" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_010 --porcelain`
wp post meta update $_RGT_010_10e502e3 _visibility visible
wp post meta update $_RGT_010_10e502e3 attribute_edb_material 010
wp post meta update $_RGT_010_10e502e3 _stock 2
wp post meta update $_RGT_010_10e502e3 _stock_status instock
wp post meta update $_RGT_010_10e502e3 _manage_stock yes
wp post meta update $_RGT_010_10e502e3 _backorders yes
wp post meta update $_RGT_010_10e502e3 _price 350.00
wp post meta update $_RGT_010_10e502e3 _regular_price 350.00
wp post meta update $_RGT_010_10e502e3 _sku RGT-010-10e502e3
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_010_10e502e3 --featured_image=true
_RGT_011_10e602e4=`wp post create --post_title="pique-011" --post_name="_RGT_XXX_067b0225_011" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_011 --porcelain`
wp post meta update $_RGT_011_10e602e4 _visibility visible
wp post meta update $_RGT_011_10e602e4 attribute_edb_material 011
wp post meta update $_RGT_011_10e602e4 _stock 2
wp post meta update $_RGT_011_10e602e4 _stock_status instock
wp post meta update $_RGT_011_10e602e4 _manage_stock yes
wp post meta update $_RGT_011_10e602e4 _backorders yes
wp post meta update $_RGT_011_10e602e4 _price 350.00
wp post meta update $_RGT_011_10e602e4 _regular_price 350.00
wp post meta update $_RGT_011_10e602e4 _sku RGT-011-10e602e4
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_011_10e602e4 --featured_image=true
_RGT_012_10e702e5=`wp post create --post_title="pique-012" --post_name="_RGT_XXX_067b0225_012" --post_parent=$_RGT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_067b0225_012 --porcelain`
wp post meta update $_RGT_012_10e702e5 _visibility visible
wp post meta update $_RGT_012_10e702e5 attribute_edb_material 012
wp post meta update $_RGT_012_10e702e5 _stock 2
wp post meta update $_RGT_012_10e702e5 _stock_status instock
wp post meta update $_RGT_012_10e702e5 _manage_stock yes
wp post meta update $_RGT_012_10e702e5 _backorders yes
wp post meta update $_RGT_012_10e702e5 _price 350.00
wp post meta update $_RGT_012_10e702e5 _regular_price 350.00
wp post meta update $_RGT_012_10e702e5 _sku RGT-012-10e702e5
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT_012_10e702e5 --featured_image=true
_RGT_XXX_17850436=`wp post create --post_title="mixmix_rec" --post_name="_RGT_XXX_17850436" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_RGT_XXX_17850436 --porcelain`
wp post meta update $_RGT_XXX_17850436 _visibility visible
wp post meta update $_RGT_XXX_17850436 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_RGT_XXX_17850436 _price 350.00
wp post meta update $_RGT_XXX_17850436 _regular_price 350.00
wp post term set $_RGT_XXX_17850436 product_shipping_class furniture
wp post term set $_RGT_XXX_17850436 product_cat sectionals-right-facing
wp post term set $_RGT_XXX_17850436 product_type variable
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_XXX_17850436 --featured_image=true
_RGT_XXX_17850436_0=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_left_0000_001.jpg --post_id=$_RGT_XXX_17850436 --porcelain`
_RGT_XXX_17850436_1=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_left_0001_002.jpg --post_id=$_RGT_XXX_17850436 --porcelain`
_RGT_XXX_17850436_2=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_left_0002_003.jpg --post_id=$_RGT_XXX_17850436 --porcelain`
_RGT_XXX_17850436_3=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0000_004.jpg --post_id=$_RGT_XXX_17850436 --porcelain`
_RGT_XXX_17850436_4=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0001_005.jpg --post_id=$_RGT_XXX_17850436 --porcelain`
_RGT_XXX_17850436_5=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0002_006.jpg --post_id=$_RGT_XXX_17850436 --porcelain`
_RGT_XXX_17850436_6=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0003_007.jpg --post_id=$_RGT_XXX_17850436 --porcelain`
_RGT_XXX_17850436_7=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0004_008.jpg --post_id=$_RGT_XXX_17850436 --porcelain`
_RGT_XXX_17850436_8=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0005_009.jpg --post_id=$_RGT_XXX_17850436 --porcelain`
wp post meta update $_RGT_XXX_17850436 _product_image_gallery $_RGT_XXX_17850436_0,$_RGT_XXX_17850436_1,$_RGT_XXX_17850436_2,$_RGT_XXX_17850436_3,$_RGT_XXX_17850436_4,$_RGT_XXX_17850436_5,$_RGT_XXX_17850436_6,$_RGT_XXX_17850436_7,$_RGT_XXX_17850436_8
_RGT_001_2a3204f4=`wp post create --post_title="mixmix_rec-001" --post_name="_RGT_XXX_17850436_001" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_001 --porcelain`
wp post meta update $_RGT_001_2a3204f4 _visibility visible
wp post meta update $_RGT_001_2a3204f4 attribute_edb_material 001
wp post meta update $_RGT_001_2a3204f4 _stock 2
wp post meta update $_RGT_001_2a3204f4 _stock_status instock
wp post meta update $_RGT_001_2a3204f4 _manage_stock yes
wp post meta update $_RGT_001_2a3204f4 _backorders yes
wp post meta update $_RGT_001_2a3204f4 _price 350.00
wp post meta update $_RGT_001_2a3204f4 _regular_price 350.00
wp post meta update $_RGT_001_2a3204f4 _sku RGT-001-2a3204f4
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_001_2a3204f4 --featured_image=true
_RGT_002_2a3304f5=`wp post create --post_title="mixmix_rec-002" --post_name="_RGT_XXX_17850436_002" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_002 --porcelain`
wp post meta update $_RGT_002_2a3304f5 _visibility visible
wp post meta update $_RGT_002_2a3304f5 attribute_edb_material 002
wp post meta update $_RGT_002_2a3304f5 _stock 2
wp post meta update $_RGT_002_2a3304f5 _stock_status instock
wp post meta update $_RGT_002_2a3304f5 _manage_stock yes
wp post meta update $_RGT_002_2a3304f5 _backorders yes
wp post meta update $_RGT_002_2a3304f5 _price 350.00
wp post meta update $_RGT_002_2a3304f5 _regular_price 350.00
wp post meta update $_RGT_002_2a3304f5 _sku RGT-002-2a3304f5
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_002_2a3304f5 --featured_image=true
_RGT_003_2a3404f6=`wp post create --post_title="mixmix_rec-003" --post_name="_RGT_XXX_17850436_003" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_003 --porcelain`
wp post meta update $_RGT_003_2a3404f6 _visibility visible
wp post meta update $_RGT_003_2a3404f6 attribute_edb_material 003
wp post meta update $_RGT_003_2a3404f6 _stock 2
wp post meta update $_RGT_003_2a3404f6 _stock_status instock
wp post meta update $_RGT_003_2a3404f6 _manage_stock yes
wp post meta update $_RGT_003_2a3404f6 _backorders yes
wp post meta update $_RGT_003_2a3404f6 _price 350.00
wp post meta update $_RGT_003_2a3404f6 _regular_price 350.00
wp post meta update $_RGT_003_2a3404f6 _sku RGT-003-2a3404f6
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_003_2a3404f6 --featured_image=true
_RGT_004_2a3504f7=`wp post create --post_title="mixmix_rec-004" --post_name="_RGT_XXX_17850436_004" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_004 --porcelain`
wp post meta update $_RGT_004_2a3504f7 _visibility visible
wp post meta update $_RGT_004_2a3504f7 attribute_edb_material 004
wp post meta update $_RGT_004_2a3504f7 _stock 2
wp post meta update $_RGT_004_2a3504f7 _stock_status instock
wp post meta update $_RGT_004_2a3504f7 _manage_stock yes
wp post meta update $_RGT_004_2a3504f7 _backorders yes
wp post meta update $_RGT_004_2a3504f7 _price 350.00
wp post meta update $_RGT_004_2a3504f7 _regular_price 350.00
wp post meta update $_RGT_004_2a3504f7 _sku RGT-004-2a3504f7
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_004_2a3504f7 --featured_image=true
_RGT_005_2a3604f8=`wp post create --post_title="mixmix_rec-005" --post_name="_RGT_XXX_17850436_005" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_005 --porcelain`
wp post meta update $_RGT_005_2a3604f8 _visibility visible
wp post meta update $_RGT_005_2a3604f8 attribute_edb_material 005
wp post meta update $_RGT_005_2a3604f8 _stock 2
wp post meta update $_RGT_005_2a3604f8 _stock_status instock
wp post meta update $_RGT_005_2a3604f8 _manage_stock yes
wp post meta update $_RGT_005_2a3604f8 _backorders yes
wp post meta update $_RGT_005_2a3604f8 _price 350.00
wp post meta update $_RGT_005_2a3604f8 _regular_price 350.00
wp post meta update $_RGT_005_2a3604f8 _sku RGT-005-2a3604f8
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_005_2a3604f8 --featured_image=true
_RGT_006_2a3704f9=`wp post create --post_title="mixmix_rec-006" --post_name="_RGT_XXX_17850436_006" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_006 --porcelain`
wp post meta update $_RGT_006_2a3704f9 _visibility visible
wp post meta update $_RGT_006_2a3704f9 attribute_edb_material 006
wp post meta update $_RGT_006_2a3704f9 _stock 2
wp post meta update $_RGT_006_2a3704f9 _stock_status instock
wp post meta update $_RGT_006_2a3704f9 _manage_stock yes
wp post meta update $_RGT_006_2a3704f9 _backorders yes
wp post meta update $_RGT_006_2a3704f9 _price 350.00
wp post meta update $_RGT_006_2a3704f9 _regular_price 350.00
wp post meta update $_RGT_006_2a3704f9 _sku RGT-006-2a3704f9
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_006_2a3704f9 --featured_image=true
_RGT_007_2a3804fa=`wp post create --post_title="mixmix_rec-007" --post_name="_RGT_XXX_17850436_007" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_007 --porcelain`
wp post meta update $_RGT_007_2a3804fa _visibility visible
wp post meta update $_RGT_007_2a3804fa attribute_edb_material 007
wp post meta update $_RGT_007_2a3804fa _stock 2
wp post meta update $_RGT_007_2a3804fa _stock_status instock
wp post meta update $_RGT_007_2a3804fa _manage_stock yes
wp post meta update $_RGT_007_2a3804fa _backorders yes
wp post meta update $_RGT_007_2a3804fa _price 350.00
wp post meta update $_RGT_007_2a3804fa _regular_price 350.00
wp post meta update $_RGT_007_2a3804fa _sku RGT-007-2a3804fa
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_007_2a3804fa --featured_image=true
_RGT_008_2a3904fb=`wp post create --post_title="mixmix_rec-008" --post_name="_RGT_XXX_17850436_008" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_008 --porcelain`
wp post meta update $_RGT_008_2a3904fb _visibility visible
wp post meta update $_RGT_008_2a3904fb attribute_edb_material 008
wp post meta update $_RGT_008_2a3904fb _stock 2
wp post meta update $_RGT_008_2a3904fb _stock_status instock
wp post meta update $_RGT_008_2a3904fb _manage_stock yes
wp post meta update $_RGT_008_2a3904fb _backorders yes
wp post meta update $_RGT_008_2a3904fb _price 350.00
wp post meta update $_RGT_008_2a3904fb _regular_price 350.00
wp post meta update $_RGT_008_2a3904fb _sku RGT-008-2a3904fb
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_008_2a3904fb --featured_image=true
_RGT_009_2a3a04fc=`wp post create --post_title="mixmix_rec-009" --post_name="_RGT_XXX_17850436_009" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_009 --porcelain`
wp post meta update $_RGT_009_2a3a04fc _visibility visible
wp post meta update $_RGT_009_2a3a04fc attribute_edb_material 009
wp post meta update $_RGT_009_2a3a04fc _stock 2
wp post meta update $_RGT_009_2a3a04fc _stock_status instock
wp post meta update $_RGT_009_2a3a04fc _manage_stock yes
wp post meta update $_RGT_009_2a3a04fc _backorders yes
wp post meta update $_RGT_009_2a3a04fc _price 350.00
wp post meta update $_RGT_009_2a3a04fc _regular_price 350.00
wp post meta update $_RGT_009_2a3a04fc _sku RGT-009-2a3a04fc
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_009_2a3a04fc --featured_image=true
_RGT_010_2a3304f4=`wp post create --post_title="mixmix_rec-010" --post_name="_RGT_XXX_17850436_010" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_010 --porcelain`
wp post meta update $_RGT_010_2a3304f4 _visibility visible
wp post meta update $_RGT_010_2a3304f4 attribute_edb_material 010
wp post meta update $_RGT_010_2a3304f4 _stock 2
wp post meta update $_RGT_010_2a3304f4 _stock_status instock
wp post meta update $_RGT_010_2a3304f4 _manage_stock yes
wp post meta update $_RGT_010_2a3304f4 _backorders yes
wp post meta update $_RGT_010_2a3304f4 _price 350.00
wp post meta update $_RGT_010_2a3304f4 _regular_price 350.00
wp post meta update $_RGT_010_2a3304f4 _sku RGT-010-2a3304f4
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_010_2a3304f4 --featured_image=true
_RGT_011_2a3404f5=`wp post create --post_title="mixmix_rec-011" --post_name="_RGT_XXX_17850436_011" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_011 --porcelain`
wp post meta update $_RGT_011_2a3404f5 _visibility visible
wp post meta update $_RGT_011_2a3404f5 attribute_edb_material 011
wp post meta update $_RGT_011_2a3404f5 _stock 2
wp post meta update $_RGT_011_2a3404f5 _stock_status instock
wp post meta update $_RGT_011_2a3404f5 _manage_stock yes
wp post meta update $_RGT_011_2a3404f5 _backorders yes
wp post meta update $_RGT_011_2a3404f5 _price 350.00
wp post meta update $_RGT_011_2a3404f5 _regular_price 350.00
wp post meta update $_RGT_011_2a3404f5 _sku RGT-011-2a3404f5
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_011_2a3404f5 --featured_image=true
_RGT_012_2a3504f6=`wp post create --post_title="mixmix_rec-012" --post_name="_RGT_XXX_17850436_012" --post_parent=$_RGT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_17850436_012 --porcelain`
wp post meta update $_RGT_012_2a3504f6 _visibility visible
wp post meta update $_RGT_012_2a3504f6 attribute_edb_material 012
wp post meta update $_RGT_012_2a3504f6 _stock 2
wp post meta update $_RGT_012_2a3504f6 _stock_status instock
wp post meta update $_RGT_012_2a3504f6 _manage_stock yes
wp post meta update $_RGT_012_2a3504f6 _backorders yes
wp post meta update $_RGT_012_2a3504f6 _price 350.00
wp post meta update $_RGT_012_2a3504f6 _regular_price 350.00
wp post meta update $_RGT_012_2a3504f6 _sku RGT-012-2a3504f6
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT_012_2a3504f6 --featured_image=true
_RGT_XXX_042201b0=`wp post create --post_title="flex" --post_name="_RGT_XXX_042201b0" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_RGT_XXX_042201b0 --porcelain`
wp post meta update $_RGT_XXX_042201b0 _visibility visible
wp post meta update $_RGT_XXX_042201b0 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_RGT_XXX_042201b0 _price 350.00
wp post meta update $_RGT_XXX_042201b0 _regular_price 350.00
wp post term set $_RGT_XXX_042201b0 product_shipping_class furniture
wp post term set $_RGT_XXX_042201b0 product_cat sectionals-right-facing
wp post term set $_RGT_XXX_042201b0 product_type variable
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_XXX_042201b0 --featured_image=true
_RGT_XXX_042201b0_0=`wp media import ./data/products/16-flex/gallery/flex_0000_001.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_1=`wp media import ./data/products/16-flex/gallery/flex_0001_002.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_2=`wp media import ./data/products/16-flex/gallery/flex_0002_003.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_3=`wp media import ./data/products/16-flex/gallery/flex_0003_004.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_4=`wp media import ./data/products/16-flex/gallery/flex_0004_005.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_5=`wp media import ./data/products/16-flex/gallery/flex_0005_006.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_6=`wp media import ./data/products/16-flex/gallery/flex_0006_007.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_7=`wp media import ./data/products/16-flex/gallery/flex_0000_008.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_8=`wp media import ./data/products/16-flex/gallery/flex_0001_009.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_9=`wp media import ./data/products/16-flex/gallery/flex_0002_010.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_10=`wp media import ./data/products/16-flex/gallery/flex_0003_011.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
_RGT_XXX_042201b0_11=`wp media import ./data/products/16-flex/gallery/flex_0004_012.jpg --post_id=$_RGT_XXX_042201b0 --porcelain`
wp post meta update $_RGT_XXX_042201b0 _product_image_gallery $_RGT_XXX_042201b0_0,$_RGT_XXX_042201b0_1,$_RGT_XXX_042201b0_2,$_RGT_XXX_042201b0_3,$_RGT_XXX_042201b0_4,$_RGT_XXX_042201b0_5,$_RGT_XXX_042201b0_6,$_RGT_XXX_042201b0_7,$_RGT_XXX_042201b0_8,$_RGT_XXX_042201b0_9,$_RGT_XXX_042201b0_10,$_RGT_XXX_042201b0_11
_RGT_001_0cb7026e=`wp post create --post_title="flex-001" --post_name="_RGT_XXX_042201b0_001" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_001 --porcelain`
wp post meta update $_RGT_001_0cb7026e _visibility visible
wp post meta update $_RGT_001_0cb7026e attribute_edb_material 001
wp post meta update $_RGT_001_0cb7026e _stock 2
wp post meta update $_RGT_001_0cb7026e _stock_status instock
wp post meta update $_RGT_001_0cb7026e _manage_stock yes
wp post meta update $_RGT_001_0cb7026e _backorders yes
wp post meta update $_RGT_001_0cb7026e _price 350.00
wp post meta update $_RGT_001_0cb7026e _regular_price 350.00
wp post meta update $_RGT_001_0cb7026e _sku RGT-001-0cb7026e
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_001_0cb7026e --featured_image=true
_RGT_002_0cb8026f=`wp post create --post_title="flex-002" --post_name="_RGT_XXX_042201b0_002" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_002 --porcelain`
wp post meta update $_RGT_002_0cb8026f _visibility visible
wp post meta update $_RGT_002_0cb8026f attribute_edb_material 002
wp post meta update $_RGT_002_0cb8026f _stock 2
wp post meta update $_RGT_002_0cb8026f _stock_status instock
wp post meta update $_RGT_002_0cb8026f _manage_stock yes
wp post meta update $_RGT_002_0cb8026f _backorders yes
wp post meta update $_RGT_002_0cb8026f _price 350.00
wp post meta update $_RGT_002_0cb8026f _regular_price 350.00
wp post meta update $_RGT_002_0cb8026f _sku RGT-002-0cb8026f
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_002_0cb8026f --featured_image=true
_RGT_003_0cb90270=`wp post create --post_title="flex-003" --post_name="_RGT_XXX_042201b0_003" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_003 --porcelain`
wp post meta update $_RGT_003_0cb90270 _visibility visible
wp post meta update $_RGT_003_0cb90270 attribute_edb_material 003
wp post meta update $_RGT_003_0cb90270 _stock 2
wp post meta update $_RGT_003_0cb90270 _stock_status instock
wp post meta update $_RGT_003_0cb90270 _manage_stock yes
wp post meta update $_RGT_003_0cb90270 _backorders yes
wp post meta update $_RGT_003_0cb90270 _price 350.00
wp post meta update $_RGT_003_0cb90270 _regular_price 350.00
wp post meta update $_RGT_003_0cb90270 _sku RGT-003-0cb90270
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_003_0cb90270 --featured_image=true
_RGT_004_0cba0271=`wp post create --post_title="flex-004" --post_name="_RGT_XXX_042201b0_004" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_004 --porcelain`
wp post meta update $_RGT_004_0cba0271 _visibility visible
wp post meta update $_RGT_004_0cba0271 attribute_edb_material 004
wp post meta update $_RGT_004_0cba0271 _stock 2
wp post meta update $_RGT_004_0cba0271 _stock_status instock
wp post meta update $_RGT_004_0cba0271 _manage_stock yes
wp post meta update $_RGT_004_0cba0271 _backorders yes
wp post meta update $_RGT_004_0cba0271 _price 350.00
wp post meta update $_RGT_004_0cba0271 _regular_price 350.00
wp post meta update $_RGT_004_0cba0271 _sku RGT-004-0cba0271
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_004_0cba0271 --featured_image=true
_RGT_005_0cbb0272=`wp post create --post_title="flex-005" --post_name="_RGT_XXX_042201b0_005" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_005 --porcelain`
wp post meta update $_RGT_005_0cbb0272 _visibility visible
wp post meta update $_RGT_005_0cbb0272 attribute_edb_material 005
wp post meta update $_RGT_005_0cbb0272 _stock 2
wp post meta update $_RGT_005_0cbb0272 _stock_status instock
wp post meta update $_RGT_005_0cbb0272 _manage_stock yes
wp post meta update $_RGT_005_0cbb0272 _backorders yes
wp post meta update $_RGT_005_0cbb0272 _price 350.00
wp post meta update $_RGT_005_0cbb0272 _regular_price 350.00
wp post meta update $_RGT_005_0cbb0272 _sku RGT-005-0cbb0272
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_005_0cbb0272 --featured_image=true
_RGT_006_0cbc0273=`wp post create --post_title="flex-006" --post_name="_RGT_XXX_042201b0_006" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_006 --porcelain`
wp post meta update $_RGT_006_0cbc0273 _visibility visible
wp post meta update $_RGT_006_0cbc0273 attribute_edb_material 006
wp post meta update $_RGT_006_0cbc0273 _stock 2
wp post meta update $_RGT_006_0cbc0273 _stock_status instock
wp post meta update $_RGT_006_0cbc0273 _manage_stock yes
wp post meta update $_RGT_006_0cbc0273 _backorders yes
wp post meta update $_RGT_006_0cbc0273 _price 350.00
wp post meta update $_RGT_006_0cbc0273 _regular_price 350.00
wp post meta update $_RGT_006_0cbc0273 _sku RGT-006-0cbc0273
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_006_0cbc0273 --featured_image=true
_RGT_007_0cbd0274=`wp post create --post_title="flex-007" --post_name="_RGT_XXX_042201b0_007" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_007 --porcelain`
wp post meta update $_RGT_007_0cbd0274 _visibility visible
wp post meta update $_RGT_007_0cbd0274 attribute_edb_material 007
wp post meta update $_RGT_007_0cbd0274 _stock 2
wp post meta update $_RGT_007_0cbd0274 _stock_status instock
wp post meta update $_RGT_007_0cbd0274 _manage_stock yes
wp post meta update $_RGT_007_0cbd0274 _backorders yes
wp post meta update $_RGT_007_0cbd0274 _price 350.00
wp post meta update $_RGT_007_0cbd0274 _regular_price 350.00
wp post meta update $_RGT_007_0cbd0274 _sku RGT-007-0cbd0274
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_007_0cbd0274 --featured_image=true
_RGT_008_0cbe0275=`wp post create --post_title="flex-008" --post_name="_RGT_XXX_042201b0_008" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_008 --porcelain`
wp post meta update $_RGT_008_0cbe0275 _visibility visible
wp post meta update $_RGT_008_0cbe0275 attribute_edb_material 008
wp post meta update $_RGT_008_0cbe0275 _stock 2
wp post meta update $_RGT_008_0cbe0275 _stock_status instock
wp post meta update $_RGT_008_0cbe0275 _manage_stock yes
wp post meta update $_RGT_008_0cbe0275 _backorders yes
wp post meta update $_RGT_008_0cbe0275 _price 350.00
wp post meta update $_RGT_008_0cbe0275 _regular_price 350.00
wp post meta update $_RGT_008_0cbe0275 _sku RGT-008-0cbe0275
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_008_0cbe0275 --featured_image=true
_RGT_009_0cbf0276=`wp post create --post_title="flex-009" --post_name="_RGT_XXX_042201b0_009" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_009 --porcelain`
wp post meta update $_RGT_009_0cbf0276 _visibility visible
wp post meta update $_RGT_009_0cbf0276 attribute_edb_material 009
wp post meta update $_RGT_009_0cbf0276 _stock 2
wp post meta update $_RGT_009_0cbf0276 _stock_status instock
wp post meta update $_RGT_009_0cbf0276 _manage_stock yes
wp post meta update $_RGT_009_0cbf0276 _backorders yes
wp post meta update $_RGT_009_0cbf0276 _price 350.00
wp post meta update $_RGT_009_0cbf0276 _regular_price 350.00
wp post meta update $_RGT_009_0cbf0276 _sku RGT-009-0cbf0276
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_009_0cbf0276 --featured_image=true
_RGT_010_0cb8026e=`wp post create --post_title="flex-010" --post_name="_RGT_XXX_042201b0_010" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_010 --porcelain`
wp post meta update $_RGT_010_0cb8026e _visibility visible
wp post meta update $_RGT_010_0cb8026e attribute_edb_material 010
wp post meta update $_RGT_010_0cb8026e _stock 2
wp post meta update $_RGT_010_0cb8026e _stock_status instock
wp post meta update $_RGT_010_0cb8026e _manage_stock yes
wp post meta update $_RGT_010_0cb8026e _backorders yes
wp post meta update $_RGT_010_0cb8026e _price 350.00
wp post meta update $_RGT_010_0cb8026e _regular_price 350.00
wp post meta update $_RGT_010_0cb8026e _sku RGT-010-0cb8026e
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_010_0cb8026e --featured_image=true
_RGT_011_0cb9026f=`wp post create --post_title="flex-011" --post_name="_RGT_XXX_042201b0_011" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_011 --porcelain`
wp post meta update $_RGT_011_0cb9026f _visibility visible
wp post meta update $_RGT_011_0cb9026f attribute_edb_material 011
wp post meta update $_RGT_011_0cb9026f _stock 2
wp post meta update $_RGT_011_0cb9026f _stock_status instock
wp post meta update $_RGT_011_0cb9026f _manage_stock yes
wp post meta update $_RGT_011_0cb9026f _backorders yes
wp post meta update $_RGT_011_0cb9026f _price 350.00
wp post meta update $_RGT_011_0cb9026f _regular_price 350.00
wp post meta update $_RGT_011_0cb9026f _sku RGT-011-0cb9026f
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_011_0cb9026f --featured_image=true
_RGT_012_0cba0270=`wp post create --post_title="flex-012" --post_name="_RGT_XXX_042201b0_012" --post_parent=$_RGT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_042201b0_012 --porcelain`
wp post meta update $_RGT_012_0cba0270 _visibility visible
wp post meta update $_RGT_012_0cba0270 attribute_edb_material 012
wp post meta update $_RGT_012_0cba0270 _stock 2
wp post meta update $_RGT_012_0cba0270 _stock_status instock
wp post meta update $_RGT_012_0cba0270 _manage_stock yes
wp post meta update $_RGT_012_0cba0270 _backorders yes
wp post meta update $_RGT_012_0cba0270 _price 350.00
wp post meta update $_RGT_012_0cba0270 _regular_price 350.00
wp post meta update $_RGT_012_0cba0270 _sku RGT-012-0cba0270
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT_012_0cba0270 --featured_image=true
_RGT_XXX_0f140350=`wp post create --post_title="panorama" --post_name="_RGT_XXX_0f140350" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_RGT_XXX_0f140350 --porcelain`
wp post meta update $_RGT_XXX_0f140350 _visibility visible
wp post meta update $_RGT_XXX_0f140350 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_RGT_XXX_0f140350 _price 350.00
wp post meta update $_RGT_XXX_0f140350 _regular_price 350.00
wp post term set $_RGT_XXX_0f140350 product_shipping_class furniture
wp post term set $_RGT_XXX_0f140350 product_cat sectionals-right-facing
wp post term set $_RGT_XXX_0f140350 product_type variable
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_XXX_0f140350 --featured_image=true
_RGT_XXX_0f140350_0=`wp media import ./data/products/15-panorama/gallery/panorama_left_0000_001.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_1=`wp media import ./data/products/15-panorama/gallery/panorama_left_0001_002.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_2=`wp media import ./data/products/15-panorama/gallery/panorama_left_0002_003.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_3=`wp media import ./data/products/15-panorama/gallery/panorama_left_0003_004.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_4=`wp media import ./data/products/15-panorama/gallery/panorama_left_0004_005.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_5=`wp media import ./data/products/15-panorama/gallery/panorama_left_0005_006.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_6=`wp media import ./data/products/15-panorama/gallery/panorama_left_0006_007.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_7=`wp media import ./data/products/15-panorama/gallery/panorama_left_0000_008.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_8=`wp media import ./data/products/15-panorama/gallery/panorama_left_0001_009.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_9=`wp media import ./data/products/15-panorama/gallery/panorama_left_0002_010.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_10=`wp media import ./data/products/15-panorama/gallery/panorama_left_0003_011.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
_RGT_XXX_0f140350_11=`wp media import ./data/products/15-panorama/gallery/panorama_left_0004_012.jpg --post_id=$_RGT_XXX_0f140350 --porcelain`
wp post meta update $_RGT_XXX_0f140350 _product_image_gallery $_RGT_XXX_0f140350_0,$_RGT_XXX_0f140350_1,$_RGT_XXX_0f140350_2,$_RGT_XXX_0f140350_3,$_RGT_XXX_0f140350_4,$_RGT_XXX_0f140350_5,$_RGT_XXX_0f140350_6,$_RGT_XXX_0f140350_7,$_RGT_XXX_0f140350_8,$_RGT_XXX_0f140350_9,$_RGT_XXX_0f140350_10,$_RGT_XXX_0f140350_11
_RGT_001_1e29040e=`wp post create --post_title="panorama-001" --post_name="_RGT_XXX_0f140350_001" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_001 --porcelain`
wp post meta update $_RGT_001_1e29040e _visibility visible
wp post meta update $_RGT_001_1e29040e attribute_edb_material 001
wp post meta update $_RGT_001_1e29040e _stock 2
wp post meta update $_RGT_001_1e29040e _stock_status instock
wp post meta update $_RGT_001_1e29040e _manage_stock yes
wp post meta update $_RGT_001_1e29040e _backorders yes
wp post meta update $_RGT_001_1e29040e _price 350.00
wp post meta update $_RGT_001_1e29040e _regular_price 350.00
wp post meta update $_RGT_001_1e29040e _sku RGT-001-1e29040e
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_001_1e29040e --featured_image=true
_RGT_002_1e2a040f=`wp post create --post_title="panorama-002" --post_name="_RGT_XXX_0f140350_002" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_002 --porcelain`
wp post meta update $_RGT_002_1e2a040f _visibility visible
wp post meta update $_RGT_002_1e2a040f attribute_edb_material 002
wp post meta update $_RGT_002_1e2a040f _stock 2
wp post meta update $_RGT_002_1e2a040f _stock_status instock
wp post meta update $_RGT_002_1e2a040f _manage_stock yes
wp post meta update $_RGT_002_1e2a040f _backorders yes
wp post meta update $_RGT_002_1e2a040f _price 350.00
wp post meta update $_RGT_002_1e2a040f _regular_price 350.00
wp post meta update $_RGT_002_1e2a040f _sku RGT-002-1e2a040f
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_002_1e2a040f --featured_image=true
_RGT_003_1e2b0410=`wp post create --post_title="panorama-003" --post_name="_RGT_XXX_0f140350_003" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_003 --porcelain`
wp post meta update $_RGT_003_1e2b0410 _visibility visible
wp post meta update $_RGT_003_1e2b0410 attribute_edb_material 003
wp post meta update $_RGT_003_1e2b0410 _stock 2
wp post meta update $_RGT_003_1e2b0410 _stock_status instock
wp post meta update $_RGT_003_1e2b0410 _manage_stock yes
wp post meta update $_RGT_003_1e2b0410 _backorders yes
wp post meta update $_RGT_003_1e2b0410 _price 350.00
wp post meta update $_RGT_003_1e2b0410 _regular_price 350.00
wp post meta update $_RGT_003_1e2b0410 _sku RGT-003-1e2b0410
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_003_1e2b0410 --featured_image=true
_RGT_004_1e2c0411=`wp post create --post_title="panorama-004" --post_name="_RGT_XXX_0f140350_004" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_004 --porcelain`
wp post meta update $_RGT_004_1e2c0411 _visibility visible
wp post meta update $_RGT_004_1e2c0411 attribute_edb_material 004
wp post meta update $_RGT_004_1e2c0411 _stock 2
wp post meta update $_RGT_004_1e2c0411 _stock_status instock
wp post meta update $_RGT_004_1e2c0411 _manage_stock yes
wp post meta update $_RGT_004_1e2c0411 _backorders yes
wp post meta update $_RGT_004_1e2c0411 _price 350.00
wp post meta update $_RGT_004_1e2c0411 _regular_price 350.00
wp post meta update $_RGT_004_1e2c0411 _sku RGT-004-1e2c0411
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_004_1e2c0411 --featured_image=true
_RGT_005_1e2d0412=`wp post create --post_title="panorama-005" --post_name="_RGT_XXX_0f140350_005" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_005 --porcelain`
wp post meta update $_RGT_005_1e2d0412 _visibility visible
wp post meta update $_RGT_005_1e2d0412 attribute_edb_material 005
wp post meta update $_RGT_005_1e2d0412 _stock 2
wp post meta update $_RGT_005_1e2d0412 _stock_status instock
wp post meta update $_RGT_005_1e2d0412 _manage_stock yes
wp post meta update $_RGT_005_1e2d0412 _backorders yes
wp post meta update $_RGT_005_1e2d0412 _price 350.00
wp post meta update $_RGT_005_1e2d0412 _regular_price 350.00
wp post meta update $_RGT_005_1e2d0412 _sku RGT-005-1e2d0412
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_005_1e2d0412 --featured_image=true
_RGT_006_1e2e0413=`wp post create --post_title="panorama-006" --post_name="_RGT_XXX_0f140350_006" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_006 --porcelain`
wp post meta update $_RGT_006_1e2e0413 _visibility visible
wp post meta update $_RGT_006_1e2e0413 attribute_edb_material 006
wp post meta update $_RGT_006_1e2e0413 _stock 2
wp post meta update $_RGT_006_1e2e0413 _stock_status instock
wp post meta update $_RGT_006_1e2e0413 _manage_stock yes
wp post meta update $_RGT_006_1e2e0413 _backorders yes
wp post meta update $_RGT_006_1e2e0413 _price 350.00
wp post meta update $_RGT_006_1e2e0413 _regular_price 350.00
wp post meta update $_RGT_006_1e2e0413 _sku RGT-006-1e2e0413
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_006_1e2e0413 --featured_image=true
_RGT_007_1e2f0414=`wp post create --post_title="panorama-007" --post_name="_RGT_XXX_0f140350_007" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_007 --porcelain`
wp post meta update $_RGT_007_1e2f0414 _visibility visible
wp post meta update $_RGT_007_1e2f0414 attribute_edb_material 007
wp post meta update $_RGT_007_1e2f0414 _stock 2
wp post meta update $_RGT_007_1e2f0414 _stock_status instock
wp post meta update $_RGT_007_1e2f0414 _manage_stock yes
wp post meta update $_RGT_007_1e2f0414 _backorders yes
wp post meta update $_RGT_007_1e2f0414 _price 350.00
wp post meta update $_RGT_007_1e2f0414 _regular_price 350.00
wp post meta update $_RGT_007_1e2f0414 _sku RGT-007-1e2f0414
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_007_1e2f0414 --featured_image=true
_RGT_008_1e300415=`wp post create --post_title="panorama-008" --post_name="_RGT_XXX_0f140350_008" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_008 --porcelain`
wp post meta update $_RGT_008_1e300415 _visibility visible
wp post meta update $_RGT_008_1e300415 attribute_edb_material 008
wp post meta update $_RGT_008_1e300415 _stock 2
wp post meta update $_RGT_008_1e300415 _stock_status instock
wp post meta update $_RGT_008_1e300415 _manage_stock yes
wp post meta update $_RGT_008_1e300415 _backorders yes
wp post meta update $_RGT_008_1e300415 _price 350.00
wp post meta update $_RGT_008_1e300415 _regular_price 350.00
wp post meta update $_RGT_008_1e300415 _sku RGT-008-1e300415
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_008_1e300415 --featured_image=true
_RGT_009_1e310416=`wp post create --post_title="panorama-009" --post_name="_RGT_XXX_0f140350_009" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_009 --porcelain`
wp post meta update $_RGT_009_1e310416 _visibility visible
wp post meta update $_RGT_009_1e310416 attribute_edb_material 009
wp post meta update $_RGT_009_1e310416 _stock 2
wp post meta update $_RGT_009_1e310416 _stock_status instock
wp post meta update $_RGT_009_1e310416 _manage_stock yes
wp post meta update $_RGT_009_1e310416 _backorders yes
wp post meta update $_RGT_009_1e310416 _price 350.00
wp post meta update $_RGT_009_1e310416 _regular_price 350.00
wp post meta update $_RGT_009_1e310416 _sku RGT-009-1e310416
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_009_1e310416 --featured_image=true
_RGT_010_1e2a040e=`wp post create --post_title="panorama-010" --post_name="_RGT_XXX_0f140350_010" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_010 --porcelain`
wp post meta update $_RGT_010_1e2a040e _visibility visible
wp post meta update $_RGT_010_1e2a040e attribute_edb_material 010
wp post meta update $_RGT_010_1e2a040e _stock 2
wp post meta update $_RGT_010_1e2a040e _stock_status instock
wp post meta update $_RGT_010_1e2a040e _manage_stock yes
wp post meta update $_RGT_010_1e2a040e _backorders yes
wp post meta update $_RGT_010_1e2a040e _price 350.00
wp post meta update $_RGT_010_1e2a040e _regular_price 350.00
wp post meta update $_RGT_010_1e2a040e _sku RGT-010-1e2a040e
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_010_1e2a040e --featured_image=true
_RGT_011_1e2b040f=`wp post create --post_title="panorama-011" --post_name="_RGT_XXX_0f140350_011" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_011 --porcelain`
wp post meta update $_RGT_011_1e2b040f _visibility visible
wp post meta update $_RGT_011_1e2b040f attribute_edb_material 011
wp post meta update $_RGT_011_1e2b040f _stock 2
wp post meta update $_RGT_011_1e2b040f _stock_status instock
wp post meta update $_RGT_011_1e2b040f _manage_stock yes
wp post meta update $_RGT_011_1e2b040f _backorders yes
wp post meta update $_RGT_011_1e2b040f _price 350.00
wp post meta update $_RGT_011_1e2b040f _regular_price 350.00
wp post meta update $_RGT_011_1e2b040f _sku RGT-011-1e2b040f
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_011_1e2b040f --featured_image=true
_RGT_012_1e2c0410=`wp post create --post_title="panorama-012" --post_name="_RGT_XXX_0f140350_012" --post_parent=$_RGT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_RGT_XXX_0f140350_012 --porcelain`
wp post meta update $_RGT_012_1e2c0410 _visibility visible
wp post meta update $_RGT_012_1e2c0410 attribute_edb_material 012
wp post meta update $_RGT_012_1e2c0410 _stock 2
wp post meta update $_RGT_012_1e2c0410 _stock_status instock
wp post meta update $_RGT_012_1e2c0410 _manage_stock yes
wp post meta update $_RGT_012_1e2c0410 _backorders yes
wp post meta update $_RGT_012_1e2c0410 _price 350.00
wp post meta update $_RGT_012_1e2c0410 _regular_price 350.00
wp post meta update $_RGT_012_1e2c0410 _sku RGT-012-1e2c0410
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT_012_1e2c0410 --featured_image=true
_LFT_XXX_067b0225=`wp post create --post_title="pique" --post_name="_LFT_XXX_067b0225" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_LFT_XXX_067b0225 --porcelain`
wp post meta update $_LFT_XXX_067b0225 _visibility visible
wp post meta update $_LFT_XXX_067b0225 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_LFT_XXX_067b0225 _price 350.00
wp post meta update $_LFT_XXX_067b0225 _regular_price 350.00
wp post term set $_LFT_XXX_067b0225 product_shipping_class furniture
wp post term set $_LFT_XXX_067b0225 product_cat sectionals-left-facing
wp post term set $_LFT_XXX_067b0225 product_type variable
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_XXX_067b0225 --featured_image=true
_LFT_XXX_067b0225_0=`wp media import ./data/products/14-pique/gallery/pique_left_0000_001.jpg --post_id=$_LFT_XXX_067b0225 --porcelain`
_LFT_XXX_067b0225_1=`wp media import ./data/products/14-pique/gallery/pique_left_0001_002.jpg --post_id=$_LFT_XXX_067b0225 --porcelain`
_LFT_XXX_067b0225_2=`wp media import ./data/products/14-pique/gallery/pique_left_0002_003.jpg --post_id=$_LFT_XXX_067b0225 --porcelain`
_LFT_XXX_067b0225_3=`wp media import ./data/products/14-pique/gallery/pique_left_0003_004.jpg --post_id=$_LFT_XXX_067b0225 --porcelain`
_LFT_XXX_067b0225_4=`wp media import ./data/products/14-pique/gallery/pique_left_0000_005.jpg --post_id=$_LFT_XXX_067b0225 --porcelain`
_LFT_XXX_067b0225_5=`wp media import ./data/products/14-pique/gallery/pique_left_0001_006.jpg --post_id=$_LFT_XXX_067b0225 --porcelain`
_LFT_XXX_067b0225_6=`wp media import ./data/products/14-pique/gallery/pique_left_0002_007.jpg --post_id=$_LFT_XXX_067b0225 --porcelain`
wp post meta update $_LFT_XXX_067b0225 _product_image_gallery $_LFT_XXX_067b0225_0,$_LFT_XXX_067b0225_1,$_LFT_XXX_067b0225_2,$_LFT_XXX_067b0225_3,$_LFT_XXX_067b0225_4,$_LFT_XXX_067b0225_5,$_LFT_XXX_067b0225_6
_LFT_001_10e402e3=`wp post create --post_title="pique-001" --post_name="_LFT_XXX_067b0225_001" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_001 --porcelain`
wp post meta update $_LFT_001_10e402e3 _visibility visible
wp post meta update $_LFT_001_10e402e3 attribute_edb_material 001
wp post meta update $_LFT_001_10e402e3 _stock 2
wp post meta update $_LFT_001_10e402e3 _stock_status instock
wp post meta update $_LFT_001_10e402e3 _manage_stock yes
wp post meta update $_LFT_001_10e402e3 _backorders yes
wp post meta update $_LFT_001_10e402e3 _price 350.00
wp post meta update $_LFT_001_10e402e3 _regular_price 350.00
wp post meta update $_LFT_001_10e402e3 _sku LFT-001-10e402e3
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_001_10e402e3 --featured_image=true
_LFT_002_10e502e4=`wp post create --post_title="pique-002" --post_name="_LFT_XXX_067b0225_002" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_002 --porcelain`
wp post meta update $_LFT_002_10e502e4 _visibility visible
wp post meta update $_LFT_002_10e502e4 attribute_edb_material 002
wp post meta update $_LFT_002_10e502e4 _stock 2
wp post meta update $_LFT_002_10e502e4 _stock_status instock
wp post meta update $_LFT_002_10e502e4 _manage_stock yes
wp post meta update $_LFT_002_10e502e4 _backorders yes
wp post meta update $_LFT_002_10e502e4 _price 350.00
wp post meta update $_LFT_002_10e502e4 _regular_price 350.00
wp post meta update $_LFT_002_10e502e4 _sku LFT-002-10e502e4
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_002_10e502e4 --featured_image=true
_LFT_003_10e602e5=`wp post create --post_title="pique-003" --post_name="_LFT_XXX_067b0225_003" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_003 --porcelain`
wp post meta update $_LFT_003_10e602e5 _visibility visible
wp post meta update $_LFT_003_10e602e5 attribute_edb_material 003
wp post meta update $_LFT_003_10e602e5 _stock 2
wp post meta update $_LFT_003_10e602e5 _stock_status instock
wp post meta update $_LFT_003_10e602e5 _manage_stock yes
wp post meta update $_LFT_003_10e602e5 _backorders yes
wp post meta update $_LFT_003_10e602e5 _price 350.00
wp post meta update $_LFT_003_10e602e5 _regular_price 350.00
wp post meta update $_LFT_003_10e602e5 _sku LFT-003-10e602e5
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_003_10e602e5 --featured_image=true
_LFT_004_10e702e6=`wp post create --post_title="pique-004" --post_name="_LFT_XXX_067b0225_004" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_004 --porcelain`
wp post meta update $_LFT_004_10e702e6 _visibility visible
wp post meta update $_LFT_004_10e702e6 attribute_edb_material 004
wp post meta update $_LFT_004_10e702e6 _stock 2
wp post meta update $_LFT_004_10e702e6 _stock_status instock
wp post meta update $_LFT_004_10e702e6 _manage_stock yes
wp post meta update $_LFT_004_10e702e6 _backorders yes
wp post meta update $_LFT_004_10e702e6 _price 350.00
wp post meta update $_LFT_004_10e702e6 _regular_price 350.00
wp post meta update $_LFT_004_10e702e6 _sku LFT-004-10e702e6
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_004_10e702e6 --featured_image=true
_LFT_005_10e802e7=`wp post create --post_title="pique-005" --post_name="_LFT_XXX_067b0225_005" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_005 --porcelain`
wp post meta update $_LFT_005_10e802e7 _visibility visible
wp post meta update $_LFT_005_10e802e7 attribute_edb_material 005
wp post meta update $_LFT_005_10e802e7 _stock 2
wp post meta update $_LFT_005_10e802e7 _stock_status instock
wp post meta update $_LFT_005_10e802e7 _manage_stock yes
wp post meta update $_LFT_005_10e802e7 _backorders yes
wp post meta update $_LFT_005_10e802e7 _price 350.00
wp post meta update $_LFT_005_10e802e7 _regular_price 350.00
wp post meta update $_LFT_005_10e802e7 _sku LFT-005-10e802e7
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_005_10e802e7 --featured_image=true
_LFT_006_10e902e8=`wp post create --post_title="pique-006" --post_name="_LFT_XXX_067b0225_006" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_006 --porcelain`
wp post meta update $_LFT_006_10e902e8 _visibility visible
wp post meta update $_LFT_006_10e902e8 attribute_edb_material 006
wp post meta update $_LFT_006_10e902e8 _stock 2
wp post meta update $_LFT_006_10e902e8 _stock_status instock
wp post meta update $_LFT_006_10e902e8 _manage_stock yes
wp post meta update $_LFT_006_10e902e8 _backorders yes
wp post meta update $_LFT_006_10e902e8 _price 350.00
wp post meta update $_LFT_006_10e902e8 _regular_price 350.00
wp post meta update $_LFT_006_10e902e8 _sku LFT-006-10e902e8
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_006_10e902e8 --featured_image=true
_LFT_007_10ea02e9=`wp post create --post_title="pique-007" --post_name="_LFT_XXX_067b0225_007" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_007 --porcelain`
wp post meta update $_LFT_007_10ea02e9 _visibility visible
wp post meta update $_LFT_007_10ea02e9 attribute_edb_material 007
wp post meta update $_LFT_007_10ea02e9 _stock 2
wp post meta update $_LFT_007_10ea02e9 _stock_status instock
wp post meta update $_LFT_007_10ea02e9 _manage_stock yes
wp post meta update $_LFT_007_10ea02e9 _backorders yes
wp post meta update $_LFT_007_10ea02e9 _price 350.00
wp post meta update $_LFT_007_10ea02e9 _regular_price 350.00
wp post meta update $_LFT_007_10ea02e9 _sku LFT-007-10ea02e9
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_007_10ea02e9 --featured_image=true
_LFT_008_10eb02ea=`wp post create --post_title="pique-008" --post_name="_LFT_XXX_067b0225_008" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_008 --porcelain`
wp post meta update $_LFT_008_10eb02ea _visibility visible
wp post meta update $_LFT_008_10eb02ea attribute_edb_material 008
wp post meta update $_LFT_008_10eb02ea _stock 2
wp post meta update $_LFT_008_10eb02ea _stock_status instock
wp post meta update $_LFT_008_10eb02ea _manage_stock yes
wp post meta update $_LFT_008_10eb02ea _backorders yes
wp post meta update $_LFT_008_10eb02ea _price 350.00
wp post meta update $_LFT_008_10eb02ea _regular_price 350.00
wp post meta update $_LFT_008_10eb02ea _sku LFT-008-10eb02ea
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_008_10eb02ea --featured_image=true
_LFT_009_10ec02eb=`wp post create --post_title="pique-009" --post_name="_LFT_XXX_067b0225_009" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_009 --porcelain`
wp post meta update $_LFT_009_10ec02eb _visibility visible
wp post meta update $_LFT_009_10ec02eb attribute_edb_material 009
wp post meta update $_LFT_009_10ec02eb _stock 2
wp post meta update $_LFT_009_10ec02eb _stock_status instock
wp post meta update $_LFT_009_10ec02eb _manage_stock yes
wp post meta update $_LFT_009_10ec02eb _backorders yes
wp post meta update $_LFT_009_10ec02eb _price 350.00
wp post meta update $_LFT_009_10ec02eb _regular_price 350.00
wp post meta update $_LFT_009_10ec02eb _sku LFT-009-10ec02eb
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_009_10ec02eb --featured_image=true
_LFT_010_10e502e3=`wp post create --post_title="pique-010" --post_name="_LFT_XXX_067b0225_010" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_010 --porcelain`
wp post meta update $_LFT_010_10e502e3 _visibility visible
wp post meta update $_LFT_010_10e502e3 attribute_edb_material 010
wp post meta update $_LFT_010_10e502e3 _stock 2
wp post meta update $_LFT_010_10e502e3 _stock_status instock
wp post meta update $_LFT_010_10e502e3 _manage_stock yes
wp post meta update $_LFT_010_10e502e3 _backorders yes
wp post meta update $_LFT_010_10e502e3 _price 350.00
wp post meta update $_LFT_010_10e502e3 _regular_price 350.00
wp post meta update $_LFT_010_10e502e3 _sku LFT-010-10e502e3
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_010_10e502e3 --featured_image=true
_LFT_011_10e602e4=`wp post create --post_title="pique-011" --post_name="_LFT_XXX_067b0225_011" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_011 --porcelain`
wp post meta update $_LFT_011_10e602e4 _visibility visible
wp post meta update $_LFT_011_10e602e4 attribute_edb_material 011
wp post meta update $_LFT_011_10e602e4 _stock 2
wp post meta update $_LFT_011_10e602e4 _stock_status instock
wp post meta update $_LFT_011_10e602e4 _manage_stock yes
wp post meta update $_LFT_011_10e602e4 _backorders yes
wp post meta update $_LFT_011_10e602e4 _price 350.00
wp post meta update $_LFT_011_10e602e4 _regular_price 350.00
wp post meta update $_LFT_011_10e602e4 _sku LFT-011-10e602e4
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_011_10e602e4 --featured_image=true
_LFT_012_10e702e5=`wp post create --post_title="pique-012" --post_name="_LFT_XXX_067b0225_012" --post_parent=$_LFT_XXX_067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_067b0225_012 --porcelain`
wp post meta update $_LFT_012_10e702e5 _visibility visible
wp post meta update $_LFT_012_10e702e5 attribute_edb_material 012
wp post meta update $_LFT_012_10e702e5 _stock 2
wp post meta update $_LFT_012_10e702e5 _stock_status instock
wp post meta update $_LFT_012_10e702e5 _manage_stock yes
wp post meta update $_LFT_012_10e702e5 _backorders yes
wp post meta update $_LFT_012_10e702e5 _price 350.00
wp post meta update $_LFT_012_10e702e5 _regular_price 350.00
wp post meta update $_LFT_012_10e702e5 _sku LFT-012-10e702e5
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT_012_10e702e5 --featured_image=true
_LFT_XXX_17850436=`wp post create --post_title="mixmix_rec" --post_name="_LFT_XXX_17850436" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_LFT_XXX_17850436 --porcelain`
wp post meta update $_LFT_XXX_17850436 _visibility visible
wp post meta update $_LFT_XXX_17850436 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_LFT_XXX_17850436 _price 350.00
wp post meta update $_LFT_XXX_17850436 _regular_price 350.00
wp post term set $_LFT_XXX_17850436 product_shipping_class furniture
wp post term set $_LFT_XXX_17850436 product_cat sectionals-left-facing
wp post term set $_LFT_XXX_17850436 product_type variable
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_XXX_17850436 --featured_image=true
_LFT_XXX_17850436_0=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_left_0000_001.jpg --post_id=$_LFT_XXX_17850436 --porcelain`
_LFT_XXX_17850436_1=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_left_0001_002.jpg --post_id=$_LFT_XXX_17850436 --porcelain`
_LFT_XXX_17850436_2=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_left_0002_003.jpg --post_id=$_LFT_XXX_17850436 --porcelain`
_LFT_XXX_17850436_3=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0000_004.jpg --post_id=$_LFT_XXX_17850436 --porcelain`
_LFT_XXX_17850436_4=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0001_005.jpg --post_id=$_LFT_XXX_17850436 --porcelain`
_LFT_XXX_17850436_5=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0002_006.jpg --post_id=$_LFT_XXX_17850436 --porcelain`
_LFT_XXX_17850436_6=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0003_007.jpg --post_id=$_LFT_XXX_17850436 --porcelain`
_LFT_XXX_17850436_7=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0004_008.jpg --post_id=$_LFT_XXX_17850436 --porcelain`
_LFT_XXX_17850436_8=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0005_009.jpg --post_id=$_LFT_XXX_17850436 --porcelain`
wp post meta update $_LFT_XXX_17850436 _product_image_gallery $_LFT_XXX_17850436_0,$_LFT_XXX_17850436_1,$_LFT_XXX_17850436_2,$_LFT_XXX_17850436_3,$_LFT_XXX_17850436_4,$_LFT_XXX_17850436_5,$_LFT_XXX_17850436_6,$_LFT_XXX_17850436_7,$_LFT_XXX_17850436_8
_LFT_001_2a3204f4=`wp post create --post_title="mixmix_rec-001" --post_name="_LFT_XXX_17850436_001" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_001 --porcelain`
wp post meta update $_LFT_001_2a3204f4 _visibility visible
wp post meta update $_LFT_001_2a3204f4 attribute_edb_material 001
wp post meta update $_LFT_001_2a3204f4 _stock 2
wp post meta update $_LFT_001_2a3204f4 _stock_status instock
wp post meta update $_LFT_001_2a3204f4 _manage_stock yes
wp post meta update $_LFT_001_2a3204f4 _backorders yes
wp post meta update $_LFT_001_2a3204f4 _price 350.00
wp post meta update $_LFT_001_2a3204f4 _regular_price 350.00
wp post meta update $_LFT_001_2a3204f4 _sku LFT-001-2a3204f4
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_001_2a3204f4 --featured_image=true
_LFT_002_2a3304f5=`wp post create --post_title="mixmix_rec-002" --post_name="_LFT_XXX_17850436_002" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_002 --porcelain`
wp post meta update $_LFT_002_2a3304f5 _visibility visible
wp post meta update $_LFT_002_2a3304f5 attribute_edb_material 002
wp post meta update $_LFT_002_2a3304f5 _stock 2
wp post meta update $_LFT_002_2a3304f5 _stock_status instock
wp post meta update $_LFT_002_2a3304f5 _manage_stock yes
wp post meta update $_LFT_002_2a3304f5 _backorders yes
wp post meta update $_LFT_002_2a3304f5 _price 350.00
wp post meta update $_LFT_002_2a3304f5 _regular_price 350.00
wp post meta update $_LFT_002_2a3304f5 _sku LFT-002-2a3304f5
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_002_2a3304f5 --featured_image=true
_LFT_003_2a3404f6=`wp post create --post_title="mixmix_rec-003" --post_name="_LFT_XXX_17850436_003" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_003 --porcelain`
wp post meta update $_LFT_003_2a3404f6 _visibility visible
wp post meta update $_LFT_003_2a3404f6 attribute_edb_material 003
wp post meta update $_LFT_003_2a3404f6 _stock 2
wp post meta update $_LFT_003_2a3404f6 _stock_status instock
wp post meta update $_LFT_003_2a3404f6 _manage_stock yes
wp post meta update $_LFT_003_2a3404f6 _backorders yes
wp post meta update $_LFT_003_2a3404f6 _price 350.00
wp post meta update $_LFT_003_2a3404f6 _regular_price 350.00
wp post meta update $_LFT_003_2a3404f6 _sku LFT-003-2a3404f6
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_003_2a3404f6 --featured_image=true
_LFT_004_2a3504f7=`wp post create --post_title="mixmix_rec-004" --post_name="_LFT_XXX_17850436_004" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_004 --porcelain`
wp post meta update $_LFT_004_2a3504f7 _visibility visible
wp post meta update $_LFT_004_2a3504f7 attribute_edb_material 004
wp post meta update $_LFT_004_2a3504f7 _stock 2
wp post meta update $_LFT_004_2a3504f7 _stock_status instock
wp post meta update $_LFT_004_2a3504f7 _manage_stock yes
wp post meta update $_LFT_004_2a3504f7 _backorders yes
wp post meta update $_LFT_004_2a3504f7 _price 350.00
wp post meta update $_LFT_004_2a3504f7 _regular_price 350.00
wp post meta update $_LFT_004_2a3504f7 _sku LFT-004-2a3504f7
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_004_2a3504f7 --featured_image=true
_LFT_005_2a3604f8=`wp post create --post_title="mixmix_rec-005" --post_name="_LFT_XXX_17850436_005" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_005 --porcelain`
wp post meta update $_LFT_005_2a3604f8 _visibility visible
wp post meta update $_LFT_005_2a3604f8 attribute_edb_material 005
wp post meta update $_LFT_005_2a3604f8 _stock 2
wp post meta update $_LFT_005_2a3604f8 _stock_status instock
wp post meta update $_LFT_005_2a3604f8 _manage_stock yes
wp post meta update $_LFT_005_2a3604f8 _backorders yes
wp post meta update $_LFT_005_2a3604f8 _price 350.00
wp post meta update $_LFT_005_2a3604f8 _regular_price 350.00
wp post meta update $_LFT_005_2a3604f8 _sku LFT-005-2a3604f8
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_005_2a3604f8 --featured_image=true
_LFT_006_2a3704f9=`wp post create --post_title="mixmix_rec-006" --post_name="_LFT_XXX_17850436_006" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_006 --porcelain`
wp post meta update $_LFT_006_2a3704f9 _visibility visible
wp post meta update $_LFT_006_2a3704f9 attribute_edb_material 006
wp post meta update $_LFT_006_2a3704f9 _stock 2
wp post meta update $_LFT_006_2a3704f9 _stock_status instock
wp post meta update $_LFT_006_2a3704f9 _manage_stock yes
wp post meta update $_LFT_006_2a3704f9 _backorders yes
wp post meta update $_LFT_006_2a3704f9 _price 350.00
wp post meta update $_LFT_006_2a3704f9 _regular_price 350.00
wp post meta update $_LFT_006_2a3704f9 _sku LFT-006-2a3704f9
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_006_2a3704f9 --featured_image=true
_LFT_007_2a3804fa=`wp post create --post_title="mixmix_rec-007" --post_name="_LFT_XXX_17850436_007" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_007 --porcelain`
wp post meta update $_LFT_007_2a3804fa _visibility visible
wp post meta update $_LFT_007_2a3804fa attribute_edb_material 007
wp post meta update $_LFT_007_2a3804fa _stock 2
wp post meta update $_LFT_007_2a3804fa _stock_status instock
wp post meta update $_LFT_007_2a3804fa _manage_stock yes
wp post meta update $_LFT_007_2a3804fa _backorders yes
wp post meta update $_LFT_007_2a3804fa _price 350.00
wp post meta update $_LFT_007_2a3804fa _regular_price 350.00
wp post meta update $_LFT_007_2a3804fa _sku LFT-007-2a3804fa
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_007_2a3804fa --featured_image=true
_LFT_008_2a3904fb=`wp post create --post_title="mixmix_rec-008" --post_name="_LFT_XXX_17850436_008" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_008 --porcelain`
wp post meta update $_LFT_008_2a3904fb _visibility visible
wp post meta update $_LFT_008_2a3904fb attribute_edb_material 008
wp post meta update $_LFT_008_2a3904fb _stock 2
wp post meta update $_LFT_008_2a3904fb _stock_status instock
wp post meta update $_LFT_008_2a3904fb _manage_stock yes
wp post meta update $_LFT_008_2a3904fb _backorders yes
wp post meta update $_LFT_008_2a3904fb _price 350.00
wp post meta update $_LFT_008_2a3904fb _regular_price 350.00
wp post meta update $_LFT_008_2a3904fb _sku LFT-008-2a3904fb
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_008_2a3904fb --featured_image=true
_LFT_009_2a3a04fc=`wp post create --post_title="mixmix_rec-009" --post_name="_LFT_XXX_17850436_009" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_009 --porcelain`
wp post meta update $_LFT_009_2a3a04fc _visibility visible
wp post meta update $_LFT_009_2a3a04fc attribute_edb_material 009
wp post meta update $_LFT_009_2a3a04fc _stock 2
wp post meta update $_LFT_009_2a3a04fc _stock_status instock
wp post meta update $_LFT_009_2a3a04fc _manage_stock yes
wp post meta update $_LFT_009_2a3a04fc _backorders yes
wp post meta update $_LFT_009_2a3a04fc _price 350.00
wp post meta update $_LFT_009_2a3a04fc _regular_price 350.00
wp post meta update $_LFT_009_2a3a04fc _sku LFT-009-2a3a04fc
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_009_2a3a04fc --featured_image=true
_LFT_010_2a3304f4=`wp post create --post_title="mixmix_rec-010" --post_name="_LFT_XXX_17850436_010" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_010 --porcelain`
wp post meta update $_LFT_010_2a3304f4 _visibility visible
wp post meta update $_LFT_010_2a3304f4 attribute_edb_material 010
wp post meta update $_LFT_010_2a3304f4 _stock 2
wp post meta update $_LFT_010_2a3304f4 _stock_status instock
wp post meta update $_LFT_010_2a3304f4 _manage_stock yes
wp post meta update $_LFT_010_2a3304f4 _backorders yes
wp post meta update $_LFT_010_2a3304f4 _price 350.00
wp post meta update $_LFT_010_2a3304f4 _regular_price 350.00
wp post meta update $_LFT_010_2a3304f4 _sku LFT-010-2a3304f4
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_010_2a3304f4 --featured_image=true
_LFT_011_2a3404f5=`wp post create --post_title="mixmix_rec-011" --post_name="_LFT_XXX_17850436_011" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_011 --porcelain`
wp post meta update $_LFT_011_2a3404f5 _visibility visible
wp post meta update $_LFT_011_2a3404f5 attribute_edb_material 011
wp post meta update $_LFT_011_2a3404f5 _stock 2
wp post meta update $_LFT_011_2a3404f5 _stock_status instock
wp post meta update $_LFT_011_2a3404f5 _manage_stock yes
wp post meta update $_LFT_011_2a3404f5 _backorders yes
wp post meta update $_LFT_011_2a3404f5 _price 350.00
wp post meta update $_LFT_011_2a3404f5 _regular_price 350.00
wp post meta update $_LFT_011_2a3404f5 _sku LFT-011-2a3404f5
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_011_2a3404f5 --featured_image=true
_LFT_012_2a3504f6=`wp post create --post_title="mixmix_rec-012" --post_name="_LFT_XXX_17850436_012" --post_parent=$_LFT_XXX_17850436 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_17850436_012 --porcelain`
wp post meta update $_LFT_012_2a3504f6 _visibility visible
wp post meta update $_LFT_012_2a3504f6 attribute_edb_material 012
wp post meta update $_LFT_012_2a3504f6 _stock 2
wp post meta update $_LFT_012_2a3504f6 _stock_status instock
wp post meta update $_LFT_012_2a3504f6 _manage_stock yes
wp post meta update $_LFT_012_2a3504f6 _backorders yes
wp post meta update $_LFT_012_2a3504f6 _price 350.00
wp post meta update $_LFT_012_2a3504f6 _regular_price 350.00
wp post meta update $_LFT_012_2a3504f6 _sku LFT-012-2a3504f6
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT_012_2a3504f6 --featured_image=true
_LFT_XXX_042201b0=`wp post create --post_title="flex" --post_name="_LFT_XXX_042201b0" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_LFT_XXX_042201b0 --porcelain`
wp post meta update $_LFT_XXX_042201b0 _visibility visible
wp post meta update $_LFT_XXX_042201b0 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_LFT_XXX_042201b0 _price 350.00
wp post meta update $_LFT_XXX_042201b0 _regular_price 350.00
wp post term set $_LFT_XXX_042201b0 product_shipping_class furniture
wp post term set $_LFT_XXX_042201b0 product_cat sectionals-left-facing
wp post term set $_LFT_XXX_042201b0 product_type variable
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_XXX_042201b0 --featured_image=true
_LFT_XXX_042201b0_0=`wp media import ./data/products/12-flex/gallery/flex_0000_001.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_1=`wp media import ./data/products/12-flex/gallery/flex_0001_002.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_2=`wp media import ./data/products/12-flex/gallery/flex_0002_003.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_3=`wp media import ./data/products/12-flex/gallery/flex_0003_004.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_4=`wp media import ./data/products/12-flex/gallery/flex_0004_005.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_5=`wp media import ./data/products/12-flex/gallery/flex_0005_006.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_6=`wp media import ./data/products/12-flex/gallery/flex_0006_007.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_7=`wp media import ./data/products/12-flex/gallery/flex_0000_008.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_8=`wp media import ./data/products/12-flex/gallery/flex_0001_009.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_9=`wp media import ./data/products/12-flex/gallery/flex_0002_010.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_10=`wp media import ./data/products/12-flex/gallery/flex_0003_011.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
_LFT_XXX_042201b0_11=`wp media import ./data/products/12-flex/gallery/flex_0004_012.jpg --post_id=$_LFT_XXX_042201b0 --porcelain`
wp post meta update $_LFT_XXX_042201b0 _product_image_gallery $_LFT_XXX_042201b0_0,$_LFT_XXX_042201b0_1,$_LFT_XXX_042201b0_2,$_LFT_XXX_042201b0_3,$_LFT_XXX_042201b0_4,$_LFT_XXX_042201b0_5,$_LFT_XXX_042201b0_6,$_LFT_XXX_042201b0_7,$_LFT_XXX_042201b0_8,$_LFT_XXX_042201b0_9,$_LFT_XXX_042201b0_10,$_LFT_XXX_042201b0_11
_LFT_001_0cb7026e=`wp post create --post_title="flex-001" --post_name="_LFT_XXX_042201b0_001" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_001 --porcelain`
wp post meta update $_LFT_001_0cb7026e _visibility visible
wp post meta update $_LFT_001_0cb7026e attribute_edb_material 001
wp post meta update $_LFT_001_0cb7026e _stock 2
wp post meta update $_LFT_001_0cb7026e _stock_status instock
wp post meta update $_LFT_001_0cb7026e _manage_stock yes
wp post meta update $_LFT_001_0cb7026e _backorders yes
wp post meta update $_LFT_001_0cb7026e _price 350.00
wp post meta update $_LFT_001_0cb7026e _regular_price 350.00
wp post meta update $_LFT_001_0cb7026e _sku LFT-001-0cb7026e
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_001_0cb7026e --featured_image=true
_LFT_002_0cb8026f=`wp post create --post_title="flex-002" --post_name="_LFT_XXX_042201b0_002" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_002 --porcelain`
wp post meta update $_LFT_002_0cb8026f _visibility visible
wp post meta update $_LFT_002_0cb8026f attribute_edb_material 002
wp post meta update $_LFT_002_0cb8026f _stock 2
wp post meta update $_LFT_002_0cb8026f _stock_status instock
wp post meta update $_LFT_002_0cb8026f _manage_stock yes
wp post meta update $_LFT_002_0cb8026f _backorders yes
wp post meta update $_LFT_002_0cb8026f _price 350.00
wp post meta update $_LFT_002_0cb8026f _regular_price 350.00
wp post meta update $_LFT_002_0cb8026f _sku LFT-002-0cb8026f
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_002_0cb8026f --featured_image=true
_LFT_003_0cb90270=`wp post create --post_title="flex-003" --post_name="_LFT_XXX_042201b0_003" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_003 --porcelain`
wp post meta update $_LFT_003_0cb90270 _visibility visible
wp post meta update $_LFT_003_0cb90270 attribute_edb_material 003
wp post meta update $_LFT_003_0cb90270 _stock 2
wp post meta update $_LFT_003_0cb90270 _stock_status instock
wp post meta update $_LFT_003_0cb90270 _manage_stock yes
wp post meta update $_LFT_003_0cb90270 _backorders yes
wp post meta update $_LFT_003_0cb90270 _price 350.00
wp post meta update $_LFT_003_0cb90270 _regular_price 350.00
wp post meta update $_LFT_003_0cb90270 _sku LFT-003-0cb90270
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_003_0cb90270 --featured_image=true
_LFT_004_0cba0271=`wp post create --post_title="flex-004" --post_name="_LFT_XXX_042201b0_004" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_004 --porcelain`
wp post meta update $_LFT_004_0cba0271 _visibility visible
wp post meta update $_LFT_004_0cba0271 attribute_edb_material 004
wp post meta update $_LFT_004_0cba0271 _stock 2
wp post meta update $_LFT_004_0cba0271 _stock_status instock
wp post meta update $_LFT_004_0cba0271 _manage_stock yes
wp post meta update $_LFT_004_0cba0271 _backorders yes
wp post meta update $_LFT_004_0cba0271 _price 350.00
wp post meta update $_LFT_004_0cba0271 _regular_price 350.00
wp post meta update $_LFT_004_0cba0271 _sku LFT-004-0cba0271
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_004_0cba0271 --featured_image=true
_LFT_005_0cbb0272=`wp post create --post_title="flex-005" --post_name="_LFT_XXX_042201b0_005" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_005 --porcelain`
wp post meta update $_LFT_005_0cbb0272 _visibility visible
wp post meta update $_LFT_005_0cbb0272 attribute_edb_material 005
wp post meta update $_LFT_005_0cbb0272 _stock 2
wp post meta update $_LFT_005_0cbb0272 _stock_status instock
wp post meta update $_LFT_005_0cbb0272 _manage_stock yes
wp post meta update $_LFT_005_0cbb0272 _backorders yes
wp post meta update $_LFT_005_0cbb0272 _price 350.00
wp post meta update $_LFT_005_0cbb0272 _regular_price 350.00
wp post meta update $_LFT_005_0cbb0272 _sku LFT-005-0cbb0272
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_005_0cbb0272 --featured_image=true
_LFT_006_0cbc0273=`wp post create --post_title="flex-006" --post_name="_LFT_XXX_042201b0_006" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_006 --porcelain`
wp post meta update $_LFT_006_0cbc0273 _visibility visible
wp post meta update $_LFT_006_0cbc0273 attribute_edb_material 006
wp post meta update $_LFT_006_0cbc0273 _stock 2
wp post meta update $_LFT_006_0cbc0273 _stock_status instock
wp post meta update $_LFT_006_0cbc0273 _manage_stock yes
wp post meta update $_LFT_006_0cbc0273 _backorders yes
wp post meta update $_LFT_006_0cbc0273 _price 350.00
wp post meta update $_LFT_006_0cbc0273 _regular_price 350.00
wp post meta update $_LFT_006_0cbc0273 _sku LFT-006-0cbc0273
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_006_0cbc0273 --featured_image=true
_LFT_007_0cbd0274=`wp post create --post_title="flex-007" --post_name="_LFT_XXX_042201b0_007" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_007 --porcelain`
wp post meta update $_LFT_007_0cbd0274 _visibility visible
wp post meta update $_LFT_007_0cbd0274 attribute_edb_material 007
wp post meta update $_LFT_007_0cbd0274 _stock 2
wp post meta update $_LFT_007_0cbd0274 _stock_status instock
wp post meta update $_LFT_007_0cbd0274 _manage_stock yes
wp post meta update $_LFT_007_0cbd0274 _backorders yes
wp post meta update $_LFT_007_0cbd0274 _price 350.00
wp post meta update $_LFT_007_0cbd0274 _regular_price 350.00
wp post meta update $_LFT_007_0cbd0274 _sku LFT-007-0cbd0274
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_007_0cbd0274 --featured_image=true
_LFT_008_0cbe0275=`wp post create --post_title="flex-008" --post_name="_LFT_XXX_042201b0_008" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_008 --porcelain`
wp post meta update $_LFT_008_0cbe0275 _visibility visible
wp post meta update $_LFT_008_0cbe0275 attribute_edb_material 008
wp post meta update $_LFT_008_0cbe0275 _stock 2
wp post meta update $_LFT_008_0cbe0275 _stock_status instock
wp post meta update $_LFT_008_0cbe0275 _manage_stock yes
wp post meta update $_LFT_008_0cbe0275 _backorders yes
wp post meta update $_LFT_008_0cbe0275 _price 350.00
wp post meta update $_LFT_008_0cbe0275 _regular_price 350.00
wp post meta update $_LFT_008_0cbe0275 _sku LFT-008-0cbe0275
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_008_0cbe0275 --featured_image=true
_LFT_009_0cbf0276=`wp post create --post_title="flex-009" --post_name="_LFT_XXX_042201b0_009" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_009 --porcelain`
wp post meta update $_LFT_009_0cbf0276 _visibility visible
wp post meta update $_LFT_009_0cbf0276 attribute_edb_material 009
wp post meta update $_LFT_009_0cbf0276 _stock 2
wp post meta update $_LFT_009_0cbf0276 _stock_status instock
wp post meta update $_LFT_009_0cbf0276 _manage_stock yes
wp post meta update $_LFT_009_0cbf0276 _backorders yes
wp post meta update $_LFT_009_0cbf0276 _price 350.00
wp post meta update $_LFT_009_0cbf0276 _regular_price 350.00
wp post meta update $_LFT_009_0cbf0276 _sku LFT-009-0cbf0276
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_009_0cbf0276 --featured_image=true
_LFT_010_0cb8026e=`wp post create --post_title="flex-010" --post_name="_LFT_XXX_042201b0_010" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_010 --porcelain`
wp post meta update $_LFT_010_0cb8026e _visibility visible
wp post meta update $_LFT_010_0cb8026e attribute_edb_material 010
wp post meta update $_LFT_010_0cb8026e _stock 2
wp post meta update $_LFT_010_0cb8026e _stock_status instock
wp post meta update $_LFT_010_0cb8026e _manage_stock yes
wp post meta update $_LFT_010_0cb8026e _backorders yes
wp post meta update $_LFT_010_0cb8026e _price 350.00
wp post meta update $_LFT_010_0cb8026e _regular_price 350.00
wp post meta update $_LFT_010_0cb8026e _sku LFT-010-0cb8026e
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_010_0cb8026e --featured_image=true
_LFT_011_0cb9026f=`wp post create --post_title="flex-011" --post_name="_LFT_XXX_042201b0_011" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_011 --porcelain`
wp post meta update $_LFT_011_0cb9026f _visibility visible
wp post meta update $_LFT_011_0cb9026f attribute_edb_material 011
wp post meta update $_LFT_011_0cb9026f _stock 2
wp post meta update $_LFT_011_0cb9026f _stock_status instock
wp post meta update $_LFT_011_0cb9026f _manage_stock yes
wp post meta update $_LFT_011_0cb9026f _backorders yes
wp post meta update $_LFT_011_0cb9026f _price 350.00
wp post meta update $_LFT_011_0cb9026f _regular_price 350.00
wp post meta update $_LFT_011_0cb9026f _sku LFT-011-0cb9026f
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_011_0cb9026f --featured_image=true
_LFT_012_0cba0270=`wp post create --post_title="flex-012" --post_name="_LFT_XXX_042201b0_012" --post_parent=$_LFT_XXX_042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_042201b0_012 --porcelain`
wp post meta update $_LFT_012_0cba0270 _visibility visible
wp post meta update $_LFT_012_0cba0270 attribute_edb_material 012
wp post meta update $_LFT_012_0cba0270 _stock 2
wp post meta update $_LFT_012_0cba0270 _stock_status instock
wp post meta update $_LFT_012_0cba0270 _manage_stock yes
wp post meta update $_LFT_012_0cba0270 _backorders yes
wp post meta update $_LFT_012_0cba0270 _price 350.00
wp post meta update $_LFT_012_0cba0270 _regular_price 350.00
wp post meta update $_LFT_012_0cba0270 _sku LFT-012-0cba0270
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT_012_0cba0270 --featured_image=true
_LFT_XXX_0f140350=`wp post create --post_title="panorama" --post_name="_LFT_XXX_0f140350" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_LFT_XXX_0f140350 --porcelain`
wp post meta update $_LFT_XXX_0f140350 _visibility visible
wp post meta update $_LFT_XXX_0f140350 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_LFT_XXX_0f140350 _price 350.00
wp post meta update $_LFT_XXX_0f140350 _regular_price 350.00
wp post term set $_LFT_XXX_0f140350 product_shipping_class furniture
wp post term set $_LFT_XXX_0f140350 product_cat sectionals-left-facing
wp post term set $_LFT_XXX_0f140350 product_type variable
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_XXX_0f140350 --featured_image=true
_LFT_XXX_0f140350_0=`wp media import ./data/products/11-panorama/gallery/panorama_left_0000_001.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_1=`wp media import ./data/products/11-panorama/gallery/panorama_left_0001_002.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_2=`wp media import ./data/products/11-panorama/gallery/panorama_left_0002_003.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_3=`wp media import ./data/products/11-panorama/gallery/panorama_left_0003_004.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_4=`wp media import ./data/products/11-panorama/gallery/panorama_left_0004_005.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_5=`wp media import ./data/products/11-panorama/gallery/panorama_left_0005_006.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_6=`wp media import ./data/products/11-panorama/gallery/panorama_left_0006_007.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_7=`wp media import ./data/products/11-panorama/gallery/panorama_left_0000_008.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_8=`wp media import ./data/products/11-panorama/gallery/panorama_left_0001_009.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_9=`wp media import ./data/products/11-panorama/gallery/panorama_left_0002_010.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_10=`wp media import ./data/products/11-panorama/gallery/panorama_left_0003_011.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
_LFT_XXX_0f140350_11=`wp media import ./data/products/11-panorama/gallery/panorama_left_0004_012.jpg --post_id=$_LFT_XXX_0f140350 --porcelain`
wp post meta update $_LFT_XXX_0f140350 _product_image_gallery $_LFT_XXX_0f140350_0,$_LFT_XXX_0f140350_1,$_LFT_XXX_0f140350_2,$_LFT_XXX_0f140350_3,$_LFT_XXX_0f140350_4,$_LFT_XXX_0f140350_5,$_LFT_XXX_0f140350_6,$_LFT_XXX_0f140350_7,$_LFT_XXX_0f140350_8,$_LFT_XXX_0f140350_9,$_LFT_XXX_0f140350_10,$_LFT_XXX_0f140350_11
_LFT_001_1e29040e=`wp post create --post_title="panorama-001" --post_name="_LFT_XXX_0f140350_001" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_001 --porcelain`
wp post meta update $_LFT_001_1e29040e _visibility visible
wp post meta update $_LFT_001_1e29040e attribute_edb_material 001
wp post meta update $_LFT_001_1e29040e _stock 2
wp post meta update $_LFT_001_1e29040e _stock_status instock
wp post meta update $_LFT_001_1e29040e _manage_stock yes
wp post meta update $_LFT_001_1e29040e _backorders yes
wp post meta update $_LFT_001_1e29040e _price 350.00
wp post meta update $_LFT_001_1e29040e _regular_price 350.00
wp post meta update $_LFT_001_1e29040e _sku LFT-001-1e29040e
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_001_1e29040e --featured_image=true
_LFT_002_1e2a040f=`wp post create --post_title="panorama-002" --post_name="_LFT_XXX_0f140350_002" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_002 --porcelain`
wp post meta update $_LFT_002_1e2a040f _visibility visible
wp post meta update $_LFT_002_1e2a040f attribute_edb_material 002
wp post meta update $_LFT_002_1e2a040f _stock 2
wp post meta update $_LFT_002_1e2a040f _stock_status instock
wp post meta update $_LFT_002_1e2a040f _manage_stock yes
wp post meta update $_LFT_002_1e2a040f _backorders yes
wp post meta update $_LFT_002_1e2a040f _price 350.00
wp post meta update $_LFT_002_1e2a040f _regular_price 350.00
wp post meta update $_LFT_002_1e2a040f _sku LFT-002-1e2a040f
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_002_1e2a040f --featured_image=true
_LFT_003_1e2b0410=`wp post create --post_title="panorama-003" --post_name="_LFT_XXX_0f140350_003" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_003 --porcelain`
wp post meta update $_LFT_003_1e2b0410 _visibility visible
wp post meta update $_LFT_003_1e2b0410 attribute_edb_material 003
wp post meta update $_LFT_003_1e2b0410 _stock 2
wp post meta update $_LFT_003_1e2b0410 _stock_status instock
wp post meta update $_LFT_003_1e2b0410 _manage_stock yes
wp post meta update $_LFT_003_1e2b0410 _backorders yes
wp post meta update $_LFT_003_1e2b0410 _price 350.00
wp post meta update $_LFT_003_1e2b0410 _regular_price 350.00
wp post meta update $_LFT_003_1e2b0410 _sku LFT-003-1e2b0410
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_003_1e2b0410 --featured_image=true
_LFT_004_1e2c0411=`wp post create --post_title="panorama-004" --post_name="_LFT_XXX_0f140350_004" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_004 --porcelain`
wp post meta update $_LFT_004_1e2c0411 _visibility visible
wp post meta update $_LFT_004_1e2c0411 attribute_edb_material 004
wp post meta update $_LFT_004_1e2c0411 _stock 2
wp post meta update $_LFT_004_1e2c0411 _stock_status instock
wp post meta update $_LFT_004_1e2c0411 _manage_stock yes
wp post meta update $_LFT_004_1e2c0411 _backorders yes
wp post meta update $_LFT_004_1e2c0411 _price 350.00
wp post meta update $_LFT_004_1e2c0411 _regular_price 350.00
wp post meta update $_LFT_004_1e2c0411 _sku LFT-004-1e2c0411
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_004_1e2c0411 --featured_image=true
_LFT_005_1e2d0412=`wp post create --post_title="panorama-005" --post_name="_LFT_XXX_0f140350_005" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_005 --porcelain`
wp post meta update $_LFT_005_1e2d0412 _visibility visible
wp post meta update $_LFT_005_1e2d0412 attribute_edb_material 005
wp post meta update $_LFT_005_1e2d0412 _stock 2
wp post meta update $_LFT_005_1e2d0412 _stock_status instock
wp post meta update $_LFT_005_1e2d0412 _manage_stock yes
wp post meta update $_LFT_005_1e2d0412 _backorders yes
wp post meta update $_LFT_005_1e2d0412 _price 350.00
wp post meta update $_LFT_005_1e2d0412 _regular_price 350.00
wp post meta update $_LFT_005_1e2d0412 _sku LFT-005-1e2d0412
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_005_1e2d0412 --featured_image=true
_LFT_006_1e2e0413=`wp post create --post_title="panorama-006" --post_name="_LFT_XXX_0f140350_006" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_006 --porcelain`
wp post meta update $_LFT_006_1e2e0413 _visibility visible
wp post meta update $_LFT_006_1e2e0413 attribute_edb_material 006
wp post meta update $_LFT_006_1e2e0413 _stock 2
wp post meta update $_LFT_006_1e2e0413 _stock_status instock
wp post meta update $_LFT_006_1e2e0413 _manage_stock yes
wp post meta update $_LFT_006_1e2e0413 _backorders yes
wp post meta update $_LFT_006_1e2e0413 _price 350.00
wp post meta update $_LFT_006_1e2e0413 _regular_price 350.00
wp post meta update $_LFT_006_1e2e0413 _sku LFT-006-1e2e0413
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_006_1e2e0413 --featured_image=true
_LFT_007_1e2f0414=`wp post create --post_title="panorama-007" --post_name="_LFT_XXX_0f140350_007" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_007 --porcelain`
wp post meta update $_LFT_007_1e2f0414 _visibility visible
wp post meta update $_LFT_007_1e2f0414 attribute_edb_material 007
wp post meta update $_LFT_007_1e2f0414 _stock 2
wp post meta update $_LFT_007_1e2f0414 _stock_status instock
wp post meta update $_LFT_007_1e2f0414 _manage_stock yes
wp post meta update $_LFT_007_1e2f0414 _backorders yes
wp post meta update $_LFT_007_1e2f0414 _price 350.00
wp post meta update $_LFT_007_1e2f0414 _regular_price 350.00
wp post meta update $_LFT_007_1e2f0414 _sku LFT-007-1e2f0414
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_007_1e2f0414 --featured_image=true
_LFT_008_1e300415=`wp post create --post_title="panorama-008" --post_name="_LFT_XXX_0f140350_008" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_008 --porcelain`
wp post meta update $_LFT_008_1e300415 _visibility visible
wp post meta update $_LFT_008_1e300415 attribute_edb_material 008
wp post meta update $_LFT_008_1e300415 _stock 2
wp post meta update $_LFT_008_1e300415 _stock_status instock
wp post meta update $_LFT_008_1e300415 _manage_stock yes
wp post meta update $_LFT_008_1e300415 _backorders yes
wp post meta update $_LFT_008_1e300415 _price 350.00
wp post meta update $_LFT_008_1e300415 _regular_price 350.00
wp post meta update $_LFT_008_1e300415 _sku LFT-008-1e300415
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_008_1e300415 --featured_image=true
_LFT_009_1e310416=`wp post create --post_title="panorama-009" --post_name="_LFT_XXX_0f140350_009" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_009 --porcelain`
wp post meta update $_LFT_009_1e310416 _visibility visible
wp post meta update $_LFT_009_1e310416 attribute_edb_material 009
wp post meta update $_LFT_009_1e310416 _stock 2
wp post meta update $_LFT_009_1e310416 _stock_status instock
wp post meta update $_LFT_009_1e310416 _manage_stock yes
wp post meta update $_LFT_009_1e310416 _backorders yes
wp post meta update $_LFT_009_1e310416 _price 350.00
wp post meta update $_LFT_009_1e310416 _regular_price 350.00
wp post meta update $_LFT_009_1e310416 _sku LFT-009-1e310416
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_009_1e310416 --featured_image=true
_LFT_010_1e2a040e=`wp post create --post_title="panorama-010" --post_name="_LFT_XXX_0f140350_010" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_010 --porcelain`
wp post meta update $_LFT_010_1e2a040e _visibility visible
wp post meta update $_LFT_010_1e2a040e attribute_edb_material 010
wp post meta update $_LFT_010_1e2a040e _stock 2
wp post meta update $_LFT_010_1e2a040e _stock_status instock
wp post meta update $_LFT_010_1e2a040e _manage_stock yes
wp post meta update $_LFT_010_1e2a040e _backorders yes
wp post meta update $_LFT_010_1e2a040e _price 350.00
wp post meta update $_LFT_010_1e2a040e _regular_price 350.00
wp post meta update $_LFT_010_1e2a040e _sku LFT-010-1e2a040e
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_010_1e2a040e --featured_image=true
_LFT_011_1e2b040f=`wp post create --post_title="panorama-011" --post_name="_LFT_XXX_0f140350_011" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_011 --porcelain`
wp post meta update $_LFT_011_1e2b040f _visibility visible
wp post meta update $_LFT_011_1e2b040f attribute_edb_material 011
wp post meta update $_LFT_011_1e2b040f _stock 2
wp post meta update $_LFT_011_1e2b040f _stock_status instock
wp post meta update $_LFT_011_1e2b040f _manage_stock yes
wp post meta update $_LFT_011_1e2b040f _backorders yes
wp post meta update $_LFT_011_1e2b040f _price 350.00
wp post meta update $_LFT_011_1e2b040f _regular_price 350.00
wp post meta update $_LFT_011_1e2b040f _sku LFT-011-1e2b040f
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_011_1e2b040f --featured_image=true
_LFT_012_1e2c0410=`wp post create --post_title="panorama-012" --post_name="_LFT_XXX_0f140350_012" --post_parent=$_LFT_XXX_0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_LFT_XXX_0f140350_012 --porcelain`
wp post meta update $_LFT_012_1e2c0410 _visibility visible
wp post meta update $_LFT_012_1e2c0410 attribute_edb_material 012
wp post meta update $_LFT_012_1e2c0410 _stock 2
wp post meta update $_LFT_012_1e2c0410 _stock_status instock
wp post meta update $_LFT_012_1e2c0410 _manage_stock yes
wp post meta update $_LFT_012_1e2c0410 _backorders yes
wp post meta update $_LFT_012_1e2c0410 _price 350.00
wp post meta update $_LFT_012_1e2c0410 _regular_price 350.00
wp post meta update $_LFT_012_1e2c0410 _sku LFT-012-1e2c0410
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT_012_1e2c0410 --featured_image=true
_SOB_XXX_02880149=`wp post create --post_title="duo" --post_name="_SOB_XXX_02880149" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_SOB_XXX_02880149 --porcelain`
wp post meta update $_SOB_XXX_02880149 _visibility visible
wp post meta update $_SOB_XXX_02880149 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_SOB_XXX_02880149 _price 350.00
wp post meta update $_SOB_XXX_02880149 _regular_price 350.00
wp post term set $_SOB_XXX_02880149 product_shipping_class furniture
wp post term set $_SOB_XXX_02880149 product_cat sofa-beds
wp post term set $_SOB_XXX_02880149 product_type variable
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_XXX_02880149 --featured_image=true
_SOB_XXX_02880149_0=`wp media import ./data/products/10-duo/gallery/duo_sofa_0000_001.jpg --post_id=$_SOB_XXX_02880149 --porcelain`
_SOB_XXX_02880149_1=`wp media import ./data/products/10-duo/gallery/duo_sofa_0001_002.jpg --post_id=$_SOB_XXX_02880149 --porcelain`
_SOB_XXX_02880149_2=`wp media import ./data/products/10-duo/gallery/duo_sofa_0002_003.jpg --post_id=$_SOB_XXX_02880149 --porcelain`
_SOB_XXX_02880149_3=`wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004.jpg --post_id=$_SOB_XXX_02880149 --porcelain`
_SOB_XXX_02880149_4=`wp media import ./data/products/10-duo/gallery/duo_sofa_0001_005.jpg --post_id=$_SOB_XXX_02880149 --porcelain`
_SOB_XXX_02880149_5=`wp media import ./data/products/10-duo/gallery/duo_sofa_0002_006.jpg --post_id=$_SOB_XXX_02880149 --porcelain`
_SOB_XXX_02880149_6=`wp media import ./data/products/10-duo/gallery/duo_sofa_0003_007.jpg --post_id=$_SOB_XXX_02880149 --porcelain`
_SOB_XXX_02880149_7=`wp media import ./data/products/10-duo/gallery/duo_sofa_0004_008.jpg --post_id=$_SOB_XXX_02880149 --porcelain`
wp post meta update $_SOB_XXX_02880149 _product_image_gallery $_SOB_XXX_02880149_0,$_SOB_XXX_02880149_1,$_SOB_XXX_02880149_2,$_SOB_XXX_02880149_3,$_SOB_XXX_02880149_4,$_SOB_XXX_02880149_5,$_SOB_XXX_02880149_6,$_SOB_XXX_02880149_7
_SOB_001_09810207=`wp post create --post_title="duo-001" --post_name="_SOB_XXX_02880149_001" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_001 --porcelain`
wp post meta update $_SOB_001_09810207 _visibility visible
wp post meta update $_SOB_001_09810207 attribute_edb_material 001
wp post meta update $_SOB_001_09810207 _stock 2
wp post meta update $_SOB_001_09810207 _stock_status instock
wp post meta update $_SOB_001_09810207 _manage_stock yes
wp post meta update $_SOB_001_09810207 _backorders yes
wp post meta update $_SOB_001_09810207 _price 350.00
wp post meta update $_SOB_001_09810207 _regular_price 350.00
wp post meta update $_SOB_001_09810207 _sku SOB-001-09810207
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_001_09810207 --featured_image=true
_SOB_002_09820208=`wp post create --post_title="duo-002" --post_name="_SOB_XXX_02880149_002" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_002 --porcelain`
wp post meta update $_SOB_002_09820208 _visibility visible
wp post meta update $_SOB_002_09820208 attribute_edb_material 002
wp post meta update $_SOB_002_09820208 _stock 2
wp post meta update $_SOB_002_09820208 _stock_status instock
wp post meta update $_SOB_002_09820208 _manage_stock yes
wp post meta update $_SOB_002_09820208 _backorders yes
wp post meta update $_SOB_002_09820208 _price 350.00
wp post meta update $_SOB_002_09820208 _regular_price 350.00
wp post meta update $_SOB_002_09820208 _sku SOB-002-09820208
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_002_09820208 --featured_image=true
_SOB_003_09830209=`wp post create --post_title="duo-003" --post_name="_SOB_XXX_02880149_003" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_003 --porcelain`
wp post meta update $_SOB_003_09830209 _visibility visible
wp post meta update $_SOB_003_09830209 attribute_edb_material 003
wp post meta update $_SOB_003_09830209 _stock 2
wp post meta update $_SOB_003_09830209 _stock_status instock
wp post meta update $_SOB_003_09830209 _manage_stock yes
wp post meta update $_SOB_003_09830209 _backorders yes
wp post meta update $_SOB_003_09830209 _price 350.00
wp post meta update $_SOB_003_09830209 _regular_price 350.00
wp post meta update $_SOB_003_09830209 _sku SOB-003-09830209
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_003_09830209 --featured_image=true
_SOB_004_0984020a=`wp post create --post_title="duo-004" --post_name="_SOB_XXX_02880149_004" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_004 --porcelain`
wp post meta update $_SOB_004_0984020a _visibility visible
wp post meta update $_SOB_004_0984020a attribute_edb_material 004
wp post meta update $_SOB_004_0984020a _stock 2
wp post meta update $_SOB_004_0984020a _stock_status instock
wp post meta update $_SOB_004_0984020a _manage_stock yes
wp post meta update $_SOB_004_0984020a _backorders yes
wp post meta update $_SOB_004_0984020a _price 350.00
wp post meta update $_SOB_004_0984020a _regular_price 350.00
wp post meta update $_SOB_004_0984020a _sku SOB-004-0984020a
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_004_0984020a --featured_image=true
_SOB_005_0985020b=`wp post create --post_title="duo-005" --post_name="_SOB_XXX_02880149_005" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_005 --porcelain`
wp post meta update $_SOB_005_0985020b _visibility visible
wp post meta update $_SOB_005_0985020b attribute_edb_material 005
wp post meta update $_SOB_005_0985020b _stock 2
wp post meta update $_SOB_005_0985020b _stock_status instock
wp post meta update $_SOB_005_0985020b _manage_stock yes
wp post meta update $_SOB_005_0985020b _backorders yes
wp post meta update $_SOB_005_0985020b _price 350.00
wp post meta update $_SOB_005_0985020b _regular_price 350.00
wp post meta update $_SOB_005_0985020b _sku SOB-005-0985020b
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_005_0985020b --featured_image=true
_SOB_006_0986020c=`wp post create --post_title="duo-006" --post_name="_SOB_XXX_02880149_006" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_006 --porcelain`
wp post meta update $_SOB_006_0986020c _visibility visible
wp post meta update $_SOB_006_0986020c attribute_edb_material 006
wp post meta update $_SOB_006_0986020c _stock 2
wp post meta update $_SOB_006_0986020c _stock_status instock
wp post meta update $_SOB_006_0986020c _manage_stock yes
wp post meta update $_SOB_006_0986020c _backorders yes
wp post meta update $_SOB_006_0986020c _price 350.00
wp post meta update $_SOB_006_0986020c _regular_price 350.00
wp post meta update $_SOB_006_0986020c _sku SOB-006-0986020c
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_006_0986020c --featured_image=true
_SOB_007_0987020d=`wp post create --post_title="duo-007" --post_name="_SOB_XXX_02880149_007" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_007 --porcelain`
wp post meta update $_SOB_007_0987020d _visibility visible
wp post meta update $_SOB_007_0987020d attribute_edb_material 007
wp post meta update $_SOB_007_0987020d _stock 2
wp post meta update $_SOB_007_0987020d _stock_status instock
wp post meta update $_SOB_007_0987020d _manage_stock yes
wp post meta update $_SOB_007_0987020d _backorders yes
wp post meta update $_SOB_007_0987020d _price 350.00
wp post meta update $_SOB_007_0987020d _regular_price 350.00
wp post meta update $_SOB_007_0987020d _sku SOB-007-0987020d
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_007_0987020d --featured_image=true
_SOB_008_0988020e=`wp post create --post_title="duo-008" --post_name="_SOB_XXX_02880149_008" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_008 --porcelain`
wp post meta update $_SOB_008_0988020e _visibility visible
wp post meta update $_SOB_008_0988020e attribute_edb_material 008
wp post meta update $_SOB_008_0988020e _stock 2
wp post meta update $_SOB_008_0988020e _stock_status instock
wp post meta update $_SOB_008_0988020e _manage_stock yes
wp post meta update $_SOB_008_0988020e _backorders yes
wp post meta update $_SOB_008_0988020e _price 350.00
wp post meta update $_SOB_008_0988020e _regular_price 350.00
wp post meta update $_SOB_008_0988020e _sku SOB-008-0988020e
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_008_0988020e --featured_image=true
_SOB_009_0989020f=`wp post create --post_title="duo-009" --post_name="_SOB_XXX_02880149_009" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_009 --porcelain`
wp post meta update $_SOB_009_0989020f _visibility visible
wp post meta update $_SOB_009_0989020f attribute_edb_material 009
wp post meta update $_SOB_009_0989020f _stock 2
wp post meta update $_SOB_009_0989020f _stock_status instock
wp post meta update $_SOB_009_0989020f _manage_stock yes
wp post meta update $_SOB_009_0989020f _backorders yes
wp post meta update $_SOB_009_0989020f _price 350.00
wp post meta update $_SOB_009_0989020f _regular_price 350.00
wp post meta update $_SOB_009_0989020f _sku SOB-009-0989020f
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_009_0989020f --featured_image=true
_SOB_010_09820207=`wp post create --post_title="duo-010" --post_name="_SOB_XXX_02880149_010" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_010 --porcelain`
wp post meta update $_SOB_010_09820207 _visibility visible
wp post meta update $_SOB_010_09820207 attribute_edb_material 010
wp post meta update $_SOB_010_09820207 _stock 2
wp post meta update $_SOB_010_09820207 _stock_status instock
wp post meta update $_SOB_010_09820207 _manage_stock yes
wp post meta update $_SOB_010_09820207 _backorders yes
wp post meta update $_SOB_010_09820207 _price 350.00
wp post meta update $_SOB_010_09820207 _regular_price 350.00
wp post meta update $_SOB_010_09820207 _sku SOB-010-09820207
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_010_09820207 --featured_image=true
_SOB_011_09830208=`wp post create --post_title="duo-011" --post_name="_SOB_XXX_02880149_011" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_011 --porcelain`
wp post meta update $_SOB_011_09830208 _visibility visible
wp post meta update $_SOB_011_09830208 attribute_edb_material 011
wp post meta update $_SOB_011_09830208 _stock 2
wp post meta update $_SOB_011_09830208 _stock_status instock
wp post meta update $_SOB_011_09830208 _manage_stock yes
wp post meta update $_SOB_011_09830208 _backorders yes
wp post meta update $_SOB_011_09830208 _price 350.00
wp post meta update $_SOB_011_09830208 _regular_price 350.00
wp post meta update $_SOB_011_09830208 _sku SOB-011-09830208
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_011_09830208 --featured_image=true
_SOB_012_09840209=`wp post create --post_title="duo-012" --post_name="_SOB_XXX_02880149_012" --post_parent=$_SOB_XXX_02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_02880149_012 --porcelain`
wp post meta update $_SOB_012_09840209 _visibility visible
wp post meta update $_SOB_012_09840209 attribute_edb_material 012
wp post meta update $_SOB_012_09840209 _stock 2
wp post meta update $_SOB_012_09840209 _stock_status instock
wp post meta update $_SOB_012_09840209 _manage_stock yes
wp post meta update $_SOB_012_09840209 _backorders yes
wp post meta update $_SOB_012_09840209 _price 350.00
wp post meta update $_SOB_012_09840209 _regular_price 350.00
wp post meta update $_SOB_012_09840209 _sku SOB-012-09840209
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB_012_09840209 --featured_image=true
_SOB_XXX_0bc002ea=`wp post create --post_title="teatime" --post_name="_SOB_XXX_0bc002ea" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_SOB_XXX_0bc002ea --porcelain`
wp post meta update $_SOB_XXX_0bc002ea _visibility visible
wp post meta update $_SOB_XXX_0bc002ea _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_SOB_XXX_0bc002ea _price 350.00
wp post meta update $_SOB_XXX_0bc002ea _regular_price 350.00
wp post term set $_SOB_XXX_0bc002ea product_shipping_class furniture
wp post term set $_SOB_XXX_0bc002ea product_cat sofa-beds
wp post term set $_SOB_XXX_0bc002ea product_type variable
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_XXX_0bc002ea --featured_image=true
_SOB_XXX_0bc002ea_0=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_001.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_1=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0001_002.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_2=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0002_003.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_3=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_4=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0001_005.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_5=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0002_006.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_6=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0003_007.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_7=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0004_008.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
wp post meta update $_SOB_XXX_0bc002ea _product_image_gallery $_SOB_XXX_0bc002ea_0,$_SOB_XXX_0bc002ea_1,$_SOB_XXX_0bc002ea_2,$_SOB_XXX_0bc002ea_3,$_SOB_XXX_0bc002ea_4,$_SOB_XXX_0bc002ea_5,$_SOB_XXX_0bc002ea_6,$_SOB_XXX_0bc002ea_7
_SOB_001_193d03a8=`wp post create --post_title="teatime-001" --post_name="_SOB_XXX_0bc002ea_001" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_001 --porcelain`
wp post meta update $_SOB_001_193d03a8 _visibility visible
wp post meta update $_SOB_001_193d03a8 attribute_edb_material 001
wp post meta update $_SOB_001_193d03a8 _stock 2
wp post meta update $_SOB_001_193d03a8 _stock_status instock
wp post meta update $_SOB_001_193d03a8 _manage_stock yes
wp post meta update $_SOB_001_193d03a8 _backorders yes
wp post meta update $_SOB_001_193d03a8 _price 350.00
wp post meta update $_SOB_001_193d03a8 _regular_price 350.00
wp post meta update $_SOB_001_193d03a8 _sku SOB-001-193d03a8
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_001_193d03a8 --featured_image=true
_SOB_002_193e03a9=`wp post create --post_title="teatime-002" --post_name="_SOB_XXX_0bc002ea_002" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_002 --porcelain`
wp post meta update $_SOB_002_193e03a9 _visibility visible
wp post meta update $_SOB_002_193e03a9 attribute_edb_material 002
wp post meta update $_SOB_002_193e03a9 _stock 2
wp post meta update $_SOB_002_193e03a9 _stock_status instock
wp post meta update $_SOB_002_193e03a9 _manage_stock yes
wp post meta update $_SOB_002_193e03a9 _backorders yes
wp post meta update $_SOB_002_193e03a9 _price 350.00
wp post meta update $_SOB_002_193e03a9 _regular_price 350.00
wp post meta update $_SOB_002_193e03a9 _sku SOB-002-193e03a9
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_002_193e03a9 --featured_image=true
_SOB_003_193f03aa=`wp post create --post_title="teatime-003" --post_name="_SOB_XXX_0bc002ea_003" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_003 --porcelain`
wp post meta update $_SOB_003_193f03aa _visibility visible
wp post meta update $_SOB_003_193f03aa attribute_edb_material 003
wp post meta update $_SOB_003_193f03aa _stock 2
wp post meta update $_SOB_003_193f03aa _stock_status instock
wp post meta update $_SOB_003_193f03aa _manage_stock yes
wp post meta update $_SOB_003_193f03aa _backorders yes
wp post meta update $_SOB_003_193f03aa _price 350.00
wp post meta update $_SOB_003_193f03aa _regular_price 350.00
wp post meta update $_SOB_003_193f03aa _sku SOB-003-193f03aa
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_003_193f03aa --featured_image=true
_SOB_004_194003ab=`wp post create --post_title="teatime-004" --post_name="_SOB_XXX_0bc002ea_004" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_004 --porcelain`
wp post meta update $_SOB_004_194003ab _visibility visible
wp post meta update $_SOB_004_194003ab attribute_edb_material 004
wp post meta update $_SOB_004_194003ab _stock 2
wp post meta update $_SOB_004_194003ab _stock_status instock
wp post meta update $_SOB_004_194003ab _manage_stock yes
wp post meta update $_SOB_004_194003ab _backorders yes
wp post meta update $_SOB_004_194003ab _price 350.00
wp post meta update $_SOB_004_194003ab _regular_price 350.00
wp post meta update $_SOB_004_194003ab _sku SOB-004-194003ab
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_004_194003ab --featured_image=true
_SOB_005_194103ac=`wp post create --post_title="teatime-005" --post_name="_SOB_XXX_0bc002ea_005" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_005 --porcelain`
wp post meta update $_SOB_005_194103ac _visibility visible
wp post meta update $_SOB_005_194103ac attribute_edb_material 005
wp post meta update $_SOB_005_194103ac _stock 2
wp post meta update $_SOB_005_194103ac _stock_status instock
wp post meta update $_SOB_005_194103ac _manage_stock yes
wp post meta update $_SOB_005_194103ac _backorders yes
wp post meta update $_SOB_005_194103ac _price 350.00
wp post meta update $_SOB_005_194103ac _regular_price 350.00
wp post meta update $_SOB_005_194103ac _sku SOB-005-194103ac
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_005_194103ac --featured_image=true
_SOB_006_194203ad=`wp post create --post_title="teatime-006" --post_name="_SOB_XXX_0bc002ea_006" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_006 --porcelain`
wp post meta update $_SOB_006_194203ad _visibility visible
wp post meta update $_SOB_006_194203ad attribute_edb_material 006
wp post meta update $_SOB_006_194203ad _stock 2
wp post meta update $_SOB_006_194203ad _stock_status instock
wp post meta update $_SOB_006_194203ad _manage_stock yes
wp post meta update $_SOB_006_194203ad _backorders yes
wp post meta update $_SOB_006_194203ad _price 350.00
wp post meta update $_SOB_006_194203ad _regular_price 350.00
wp post meta update $_SOB_006_194203ad _sku SOB-006-194203ad
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_006_194203ad --featured_image=true
_SOB_007_194303ae=`wp post create --post_title="teatime-007" --post_name="_SOB_XXX_0bc002ea_007" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_007 --porcelain`
wp post meta update $_SOB_007_194303ae _visibility visible
wp post meta update $_SOB_007_194303ae attribute_edb_material 007
wp post meta update $_SOB_007_194303ae _stock 2
wp post meta update $_SOB_007_194303ae _stock_status instock
wp post meta update $_SOB_007_194303ae _manage_stock yes
wp post meta update $_SOB_007_194303ae _backorders yes
wp post meta update $_SOB_007_194303ae _price 350.00
wp post meta update $_SOB_007_194303ae _regular_price 350.00
wp post meta update $_SOB_007_194303ae _sku SOB-007-194303ae
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_007_194303ae --featured_image=true
_SOB_008_194403af=`wp post create --post_title="teatime-008" --post_name="_SOB_XXX_0bc002ea_008" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_008 --porcelain`
wp post meta update $_SOB_008_194403af _visibility visible
wp post meta update $_SOB_008_194403af attribute_edb_material 008
wp post meta update $_SOB_008_194403af _stock 2
wp post meta update $_SOB_008_194403af _stock_status instock
wp post meta update $_SOB_008_194403af _manage_stock yes
wp post meta update $_SOB_008_194403af _backorders yes
wp post meta update $_SOB_008_194403af _price 350.00
wp post meta update $_SOB_008_194403af _regular_price 350.00
wp post meta update $_SOB_008_194403af _sku SOB-008-194403af
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_008_194403af --featured_image=true
_SOB_009_194503b0=`wp post create --post_title="teatime-009" --post_name="_SOB_XXX_0bc002ea_009" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_009 --porcelain`
wp post meta update $_SOB_009_194503b0 _visibility visible
wp post meta update $_SOB_009_194503b0 attribute_edb_material 009
wp post meta update $_SOB_009_194503b0 _stock 2
wp post meta update $_SOB_009_194503b0 _stock_status instock
wp post meta update $_SOB_009_194503b0 _manage_stock yes
wp post meta update $_SOB_009_194503b0 _backorders yes
wp post meta update $_SOB_009_194503b0 _price 350.00
wp post meta update $_SOB_009_194503b0 _regular_price 350.00
wp post meta update $_SOB_009_194503b0 _sku SOB-009-194503b0
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_009_194503b0 --featured_image=true
_SOB_010_193e03a8=`wp post create --post_title="teatime-010" --post_name="_SOB_XXX_0bc002ea_010" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_010 --porcelain`
wp post meta update $_SOB_010_193e03a8 _visibility visible
wp post meta update $_SOB_010_193e03a8 attribute_edb_material 010
wp post meta update $_SOB_010_193e03a8 _stock 2
wp post meta update $_SOB_010_193e03a8 _stock_status instock
wp post meta update $_SOB_010_193e03a8 _manage_stock yes
wp post meta update $_SOB_010_193e03a8 _backorders yes
wp post meta update $_SOB_010_193e03a8 _price 350.00
wp post meta update $_SOB_010_193e03a8 _regular_price 350.00
wp post meta update $_SOB_010_193e03a8 _sku SOB-010-193e03a8
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_010_193e03a8 --featured_image=true
_SOB_011_193f03a9=`wp post create --post_title="teatime-011" --post_name="_SOB_XXX_0bc002ea_011" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_011 --porcelain`
wp post meta update $_SOB_011_193f03a9 _visibility visible
wp post meta update $_SOB_011_193f03a9 attribute_edb_material 011
wp post meta update $_SOB_011_193f03a9 _stock 2
wp post meta update $_SOB_011_193f03a9 _stock_status instock
wp post meta update $_SOB_011_193f03a9 _manage_stock yes
wp post meta update $_SOB_011_193f03a9 _backorders yes
wp post meta update $_SOB_011_193f03a9 _price 350.00
wp post meta update $_SOB_011_193f03a9 _regular_price 350.00
wp post meta update $_SOB_011_193f03a9 _sku SOB-011-193f03a9
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_011_193f03a9 --featured_image=true
_SOB_012_194003aa=`wp post create --post_title="teatime-012" --post_name="_SOB_XXX_0bc002ea_012" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_012 --porcelain`
wp post meta update $_SOB_012_194003aa _visibility visible
wp post meta update $_SOB_012_194003aa attribute_edb_material 012
wp post meta update $_SOB_012_194003aa _stock 2
wp post meta update $_SOB_012_194003aa _stock_status instock
wp post meta update $_SOB_012_194003aa _manage_stock yes
wp post meta update $_SOB_012_194003aa _backorders yes
wp post meta update $_SOB_012_194003aa _price 350.00
wp post meta update $_SOB_012_194003aa _regular_price 350.00
wp post meta update $_SOB_012_194003aa _sku SOB-012-194003aa
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB_012_194003aa --featured_image=true
_SOB_XXX_0bc002ea=`wp post create --post_title="teatime" --post_name="_SOB_XXX_0bc002ea" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_SOB_XXX_0bc002ea --porcelain`
wp post meta update $_SOB_XXX_0bc002ea _visibility visible
wp post meta update $_SOB_XXX_0bc002ea _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_SOB_XXX_0bc002ea _price 350.00
wp post meta update $_SOB_XXX_0bc002ea _regular_price 350.00
wp post term set $_SOB_XXX_0bc002ea product_shipping_class furniture
wp post term set $_SOB_XXX_0bc002ea product_cat sofa-beds
wp post term set $_SOB_XXX_0bc002ea product_type variable
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_XXX_0bc002ea --featured_image=true
_SOB_XXX_0bc002ea_0=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_001.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_1=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0001_002.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_2=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0002_003.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_3=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_4=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0001_005.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_5=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0002_006.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_6=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0003_007.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_7=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0004_008.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_8=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0005_009.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_9=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0006_010.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
_SOB_XXX_0bc002ea_10=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0007_011.jpg --post_id=$_SOB_XXX_0bc002ea --porcelain`
wp post meta update $_SOB_XXX_0bc002ea _product_image_gallery $_SOB_XXX_0bc002ea_0,$_SOB_XXX_0bc002ea_1,$_SOB_XXX_0bc002ea_2,$_SOB_XXX_0bc002ea_3,$_SOB_XXX_0bc002ea_4,$_SOB_XXX_0bc002ea_5,$_SOB_XXX_0bc002ea_6,$_SOB_XXX_0bc002ea_7,$_SOB_XXX_0bc002ea_8,$_SOB_XXX_0bc002ea_9,$_SOB_XXX_0bc002ea_10
_SOB_001_193d03a8=`wp post create --post_title="teatime-001" --post_name="_SOB_XXX_0bc002ea_001" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_001 --porcelain`
wp post meta update $_SOB_001_193d03a8 _visibility visible
wp post meta update $_SOB_001_193d03a8 attribute_edb_material 001
wp post meta update $_SOB_001_193d03a8 _stock 2
wp post meta update $_SOB_001_193d03a8 _stock_status instock
wp post meta update $_SOB_001_193d03a8 _manage_stock yes
wp post meta update $_SOB_001_193d03a8 _backorders yes
wp post meta update $_SOB_001_193d03a8 _price 350.00
wp post meta update $_SOB_001_193d03a8 _regular_price 350.00
wp post meta update $_SOB_001_193d03a8 _sku SOB-001-193d03a8
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_001_193d03a8 --featured_image=true
_SOB_002_193e03a9=`wp post create --post_title="teatime-002" --post_name="_SOB_XXX_0bc002ea_002" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_002 --porcelain`
wp post meta update $_SOB_002_193e03a9 _visibility visible
wp post meta update $_SOB_002_193e03a9 attribute_edb_material 002
wp post meta update $_SOB_002_193e03a9 _stock 2
wp post meta update $_SOB_002_193e03a9 _stock_status instock
wp post meta update $_SOB_002_193e03a9 _manage_stock yes
wp post meta update $_SOB_002_193e03a9 _backorders yes
wp post meta update $_SOB_002_193e03a9 _price 350.00
wp post meta update $_SOB_002_193e03a9 _regular_price 350.00
wp post meta update $_SOB_002_193e03a9 _sku SOB-002-193e03a9
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_002_193e03a9 --featured_image=true
_SOB_003_193f03aa=`wp post create --post_title="teatime-003" --post_name="_SOB_XXX_0bc002ea_003" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_003 --porcelain`
wp post meta update $_SOB_003_193f03aa _visibility visible
wp post meta update $_SOB_003_193f03aa attribute_edb_material 003
wp post meta update $_SOB_003_193f03aa _stock 2
wp post meta update $_SOB_003_193f03aa _stock_status instock
wp post meta update $_SOB_003_193f03aa _manage_stock yes
wp post meta update $_SOB_003_193f03aa _backorders yes
wp post meta update $_SOB_003_193f03aa _price 350.00
wp post meta update $_SOB_003_193f03aa _regular_price 350.00
wp post meta update $_SOB_003_193f03aa _sku SOB-003-193f03aa
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_003_193f03aa --featured_image=true
_SOB_004_194003ab=`wp post create --post_title="teatime-004" --post_name="_SOB_XXX_0bc002ea_004" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_004 --porcelain`
wp post meta update $_SOB_004_194003ab _visibility visible
wp post meta update $_SOB_004_194003ab attribute_edb_material 004
wp post meta update $_SOB_004_194003ab _stock 2
wp post meta update $_SOB_004_194003ab _stock_status instock
wp post meta update $_SOB_004_194003ab _manage_stock yes
wp post meta update $_SOB_004_194003ab _backorders yes
wp post meta update $_SOB_004_194003ab _price 350.00
wp post meta update $_SOB_004_194003ab _regular_price 350.00
wp post meta update $_SOB_004_194003ab _sku SOB-004-194003ab
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_004_194003ab --featured_image=true
_SOB_005_194103ac=`wp post create --post_title="teatime-005" --post_name="_SOB_XXX_0bc002ea_005" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_005 --porcelain`
wp post meta update $_SOB_005_194103ac _visibility visible
wp post meta update $_SOB_005_194103ac attribute_edb_material 005
wp post meta update $_SOB_005_194103ac _stock 2
wp post meta update $_SOB_005_194103ac _stock_status instock
wp post meta update $_SOB_005_194103ac _manage_stock yes
wp post meta update $_SOB_005_194103ac _backorders yes
wp post meta update $_SOB_005_194103ac _price 350.00
wp post meta update $_SOB_005_194103ac _regular_price 350.00
wp post meta update $_SOB_005_194103ac _sku SOB-005-194103ac
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_005_194103ac --featured_image=true
_SOB_006_194203ad=`wp post create --post_title="teatime-006" --post_name="_SOB_XXX_0bc002ea_006" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_006 --porcelain`
wp post meta update $_SOB_006_194203ad _visibility visible
wp post meta update $_SOB_006_194203ad attribute_edb_material 006
wp post meta update $_SOB_006_194203ad _stock 2
wp post meta update $_SOB_006_194203ad _stock_status instock
wp post meta update $_SOB_006_194203ad _manage_stock yes
wp post meta update $_SOB_006_194203ad _backorders yes
wp post meta update $_SOB_006_194203ad _price 350.00
wp post meta update $_SOB_006_194203ad _regular_price 350.00
wp post meta update $_SOB_006_194203ad _sku SOB-006-194203ad
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_006_194203ad --featured_image=true
_SOB_007_194303ae=`wp post create --post_title="teatime-007" --post_name="_SOB_XXX_0bc002ea_007" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_007 --porcelain`
wp post meta update $_SOB_007_194303ae _visibility visible
wp post meta update $_SOB_007_194303ae attribute_edb_material 007
wp post meta update $_SOB_007_194303ae _stock 2
wp post meta update $_SOB_007_194303ae _stock_status instock
wp post meta update $_SOB_007_194303ae _manage_stock yes
wp post meta update $_SOB_007_194303ae _backorders yes
wp post meta update $_SOB_007_194303ae _price 350.00
wp post meta update $_SOB_007_194303ae _regular_price 350.00
wp post meta update $_SOB_007_194303ae _sku SOB-007-194303ae
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_007_194303ae --featured_image=true
_SOB_008_194403af=`wp post create --post_title="teatime-008" --post_name="_SOB_XXX_0bc002ea_008" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_008 --porcelain`
wp post meta update $_SOB_008_194403af _visibility visible
wp post meta update $_SOB_008_194403af attribute_edb_material 008
wp post meta update $_SOB_008_194403af _stock 2
wp post meta update $_SOB_008_194403af _stock_status instock
wp post meta update $_SOB_008_194403af _manage_stock yes
wp post meta update $_SOB_008_194403af _backorders yes
wp post meta update $_SOB_008_194403af _price 350.00
wp post meta update $_SOB_008_194403af _regular_price 350.00
wp post meta update $_SOB_008_194403af _sku SOB-008-194403af
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_008_194403af --featured_image=true
_SOB_009_194503b0=`wp post create --post_title="teatime-009" --post_name="_SOB_XXX_0bc002ea_009" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_009 --porcelain`
wp post meta update $_SOB_009_194503b0 _visibility visible
wp post meta update $_SOB_009_194503b0 attribute_edb_material 009
wp post meta update $_SOB_009_194503b0 _stock 2
wp post meta update $_SOB_009_194503b0 _stock_status instock
wp post meta update $_SOB_009_194503b0 _manage_stock yes
wp post meta update $_SOB_009_194503b0 _backorders yes
wp post meta update $_SOB_009_194503b0 _price 350.00
wp post meta update $_SOB_009_194503b0 _regular_price 350.00
wp post meta update $_SOB_009_194503b0 _sku SOB-009-194503b0
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_009_194503b0 --featured_image=true
_SOB_010_193e03a8=`wp post create --post_title="teatime-010" --post_name="_SOB_XXX_0bc002ea_010" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_010 --porcelain`
wp post meta update $_SOB_010_193e03a8 _visibility visible
wp post meta update $_SOB_010_193e03a8 attribute_edb_material 010
wp post meta update $_SOB_010_193e03a8 _stock 2
wp post meta update $_SOB_010_193e03a8 _stock_status instock
wp post meta update $_SOB_010_193e03a8 _manage_stock yes
wp post meta update $_SOB_010_193e03a8 _backorders yes
wp post meta update $_SOB_010_193e03a8 _price 350.00
wp post meta update $_SOB_010_193e03a8 _regular_price 350.00
wp post meta update $_SOB_010_193e03a8 _sku SOB-010-193e03a8
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_010_193e03a8 --featured_image=true
_SOB_011_193f03a9=`wp post create --post_title="teatime-011" --post_name="_SOB_XXX_0bc002ea_011" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_011 --porcelain`
wp post meta update $_SOB_011_193f03a9 _visibility visible
wp post meta update $_SOB_011_193f03a9 attribute_edb_material 011
wp post meta update $_SOB_011_193f03a9 _stock 2
wp post meta update $_SOB_011_193f03a9 _stock_status instock
wp post meta update $_SOB_011_193f03a9 _manage_stock yes
wp post meta update $_SOB_011_193f03a9 _backorders yes
wp post meta update $_SOB_011_193f03a9 _price 350.00
wp post meta update $_SOB_011_193f03a9 _regular_price 350.00
wp post meta update $_SOB_011_193f03a9 _sku SOB-011-193f03a9
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_011_193f03a9 --featured_image=true
_SOB_012_194003aa=`wp post create --post_title="teatime-012" --post_name="_SOB_XXX_0bc002ea_012" --post_parent=$_SOB_XXX_0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_SOB_XXX_0bc002ea_012 --porcelain`
wp post meta update $_SOB_012_194003aa _visibility visible
wp post meta update $_SOB_012_194003aa attribute_edb_material 012
wp post meta update $_SOB_012_194003aa _stock 2
wp post meta update $_SOB_012_194003aa _stock_status instock
wp post meta update $_SOB_012_194003aa _manage_stock yes
wp post meta update $_SOB_012_194003aa _backorders yes
wp post meta update $_SOB_012_194003aa _price 350.00
wp post meta update $_SOB_012_194003aa _regular_price 350.00
wp post meta update $_SOB_012_194003aa _sku SOB-012-194003aa
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB_012_194003aa --featured_image=true
_3ST_XXX_06860224=`wp post create --post_title="slope" --post_name="_3ST_XXX_06860224" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_3ST_XXX_06860224 --porcelain`
wp post meta update $_3ST_XXX_06860224 _visibility visible
wp post meta update $_3ST_XXX_06860224 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3ST_XXX_06860224 _price 350.00
wp post meta update $_3ST_XXX_06860224 _regular_price 350.00
wp post term set $_3ST_XXX_06860224 product_shipping_class furniture
wp post term set $_3ST_XXX_06860224 product_cat sofas-3-seater
wp post term set $_3ST_XXX_06860224 product_type variable
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_XXX_06860224 --featured_image=true
_3ST_XXX_06860224_0=`wp media import ./data/products/07-slope/gallery/slope_sofa_0000_001.jpg --post_id=$_3ST_XXX_06860224 --porcelain`
_3ST_XXX_06860224_1=`wp media import ./data/products/07-slope/gallery/slope_sofa_0001_002.jpg --post_id=$_3ST_XXX_06860224 --porcelain`
_3ST_XXX_06860224_2=`wp media import ./data/products/07-slope/gallery/slope_sofa_0002_003.jpg --post_id=$_3ST_XXX_06860224 --porcelain`
_3ST_XXX_06860224_3=`wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004.jpg --post_id=$_3ST_XXX_06860224 --porcelain`
_3ST_XXX_06860224_4=`wp media import ./data/products/07-slope/gallery/slope_sofa_0001_005.jpg --post_id=$_3ST_XXX_06860224 --porcelain`
_3ST_XXX_06860224_5=`wp media import ./data/products/07-slope/gallery/slope_sofa_0002_006.jpg --post_id=$_3ST_XXX_06860224 --porcelain`
wp post meta update $_3ST_XXX_06860224 _product_image_gallery $_3ST_XXX_06860224_0,$_3ST_XXX_06860224_1,$_3ST_XXX_06860224_2,$_3ST_XXX_06860224_3,$_3ST_XXX_06860224_4,$_3ST_XXX_06860224_5
_3ST_001_10eb02e2=`wp post create --post_title="slope-001" --post_name="_3ST_XXX_06860224_001" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_001 --porcelain`
wp post meta update $_3ST_001_10eb02e2 _visibility visible
wp post meta update $_3ST_001_10eb02e2 attribute_edb_material 001
wp post meta update $_3ST_001_10eb02e2 _stock 2
wp post meta update $_3ST_001_10eb02e2 _stock_status instock
wp post meta update $_3ST_001_10eb02e2 _manage_stock yes
wp post meta update $_3ST_001_10eb02e2 _backorders yes
wp post meta update $_3ST_001_10eb02e2 _price 350.00
wp post meta update $_3ST_001_10eb02e2 _regular_price 350.00
wp post meta update $_3ST_001_10eb02e2 _sku 3ST-001-10eb02e2
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_001_10eb02e2 --featured_image=true
_3ST_002_10ec02e3=`wp post create --post_title="slope-002" --post_name="_3ST_XXX_06860224_002" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_002 --porcelain`
wp post meta update $_3ST_002_10ec02e3 _visibility visible
wp post meta update $_3ST_002_10ec02e3 attribute_edb_material 002
wp post meta update $_3ST_002_10ec02e3 _stock 2
wp post meta update $_3ST_002_10ec02e3 _stock_status instock
wp post meta update $_3ST_002_10ec02e3 _manage_stock yes
wp post meta update $_3ST_002_10ec02e3 _backorders yes
wp post meta update $_3ST_002_10ec02e3 _price 350.00
wp post meta update $_3ST_002_10ec02e3 _regular_price 350.00
wp post meta update $_3ST_002_10ec02e3 _sku 3ST-002-10ec02e3
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_002_10ec02e3 --featured_image=true
_3ST_003_10ed02e4=`wp post create --post_title="slope-003" --post_name="_3ST_XXX_06860224_003" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_003 --porcelain`
wp post meta update $_3ST_003_10ed02e4 _visibility visible
wp post meta update $_3ST_003_10ed02e4 attribute_edb_material 003
wp post meta update $_3ST_003_10ed02e4 _stock 2
wp post meta update $_3ST_003_10ed02e4 _stock_status instock
wp post meta update $_3ST_003_10ed02e4 _manage_stock yes
wp post meta update $_3ST_003_10ed02e4 _backorders yes
wp post meta update $_3ST_003_10ed02e4 _price 350.00
wp post meta update $_3ST_003_10ed02e4 _regular_price 350.00
wp post meta update $_3ST_003_10ed02e4 _sku 3ST-003-10ed02e4
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_003_10ed02e4 --featured_image=true
_3ST_004_10ee02e5=`wp post create --post_title="slope-004" --post_name="_3ST_XXX_06860224_004" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_004 --porcelain`
wp post meta update $_3ST_004_10ee02e5 _visibility visible
wp post meta update $_3ST_004_10ee02e5 attribute_edb_material 004
wp post meta update $_3ST_004_10ee02e5 _stock 2
wp post meta update $_3ST_004_10ee02e5 _stock_status instock
wp post meta update $_3ST_004_10ee02e5 _manage_stock yes
wp post meta update $_3ST_004_10ee02e5 _backorders yes
wp post meta update $_3ST_004_10ee02e5 _price 350.00
wp post meta update $_3ST_004_10ee02e5 _regular_price 350.00
wp post meta update $_3ST_004_10ee02e5 _sku 3ST-004-10ee02e5
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_004_10ee02e5 --featured_image=true
_3ST_005_10ef02e6=`wp post create --post_title="slope-005" --post_name="_3ST_XXX_06860224_005" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_005 --porcelain`
wp post meta update $_3ST_005_10ef02e6 _visibility visible
wp post meta update $_3ST_005_10ef02e6 attribute_edb_material 005
wp post meta update $_3ST_005_10ef02e6 _stock 2
wp post meta update $_3ST_005_10ef02e6 _stock_status instock
wp post meta update $_3ST_005_10ef02e6 _manage_stock yes
wp post meta update $_3ST_005_10ef02e6 _backorders yes
wp post meta update $_3ST_005_10ef02e6 _price 350.00
wp post meta update $_3ST_005_10ef02e6 _regular_price 350.00
wp post meta update $_3ST_005_10ef02e6 _sku 3ST-005-10ef02e6
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_005_10ef02e6 --featured_image=true
_3ST_006_10f002e7=`wp post create --post_title="slope-006" --post_name="_3ST_XXX_06860224_006" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_006 --porcelain`
wp post meta update $_3ST_006_10f002e7 _visibility visible
wp post meta update $_3ST_006_10f002e7 attribute_edb_material 006
wp post meta update $_3ST_006_10f002e7 _stock 2
wp post meta update $_3ST_006_10f002e7 _stock_status instock
wp post meta update $_3ST_006_10f002e7 _manage_stock yes
wp post meta update $_3ST_006_10f002e7 _backorders yes
wp post meta update $_3ST_006_10f002e7 _price 350.00
wp post meta update $_3ST_006_10f002e7 _regular_price 350.00
wp post meta update $_3ST_006_10f002e7 _sku 3ST-006-10f002e7
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_006_10f002e7 --featured_image=true
_3ST_007_10f102e8=`wp post create --post_title="slope-007" --post_name="_3ST_XXX_06860224_007" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_007 --porcelain`
wp post meta update $_3ST_007_10f102e8 _visibility visible
wp post meta update $_3ST_007_10f102e8 attribute_edb_material 007
wp post meta update $_3ST_007_10f102e8 _stock 2
wp post meta update $_3ST_007_10f102e8 _stock_status instock
wp post meta update $_3ST_007_10f102e8 _manage_stock yes
wp post meta update $_3ST_007_10f102e8 _backorders yes
wp post meta update $_3ST_007_10f102e8 _price 350.00
wp post meta update $_3ST_007_10f102e8 _regular_price 350.00
wp post meta update $_3ST_007_10f102e8 _sku 3ST-007-10f102e8
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_007_10f102e8 --featured_image=true
_3ST_008_10f202e9=`wp post create --post_title="slope-008" --post_name="_3ST_XXX_06860224_008" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_008 --porcelain`
wp post meta update $_3ST_008_10f202e9 _visibility visible
wp post meta update $_3ST_008_10f202e9 attribute_edb_material 008
wp post meta update $_3ST_008_10f202e9 _stock 2
wp post meta update $_3ST_008_10f202e9 _stock_status instock
wp post meta update $_3ST_008_10f202e9 _manage_stock yes
wp post meta update $_3ST_008_10f202e9 _backorders yes
wp post meta update $_3ST_008_10f202e9 _price 350.00
wp post meta update $_3ST_008_10f202e9 _regular_price 350.00
wp post meta update $_3ST_008_10f202e9 _sku 3ST-008-10f202e9
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_008_10f202e9 --featured_image=true
_3ST_009_10f302ea=`wp post create --post_title="slope-009" --post_name="_3ST_XXX_06860224_009" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_009 --porcelain`
wp post meta update $_3ST_009_10f302ea _visibility visible
wp post meta update $_3ST_009_10f302ea attribute_edb_material 009
wp post meta update $_3ST_009_10f302ea _stock 2
wp post meta update $_3ST_009_10f302ea _stock_status instock
wp post meta update $_3ST_009_10f302ea _manage_stock yes
wp post meta update $_3ST_009_10f302ea _backorders yes
wp post meta update $_3ST_009_10f302ea _price 350.00
wp post meta update $_3ST_009_10f302ea _regular_price 350.00
wp post meta update $_3ST_009_10f302ea _sku 3ST-009-10f302ea
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_009_10f302ea --featured_image=true
_3ST_010_10ec02e2=`wp post create --post_title="slope-010" --post_name="_3ST_XXX_06860224_010" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_010 --porcelain`
wp post meta update $_3ST_010_10ec02e2 _visibility visible
wp post meta update $_3ST_010_10ec02e2 attribute_edb_material 010
wp post meta update $_3ST_010_10ec02e2 _stock 2
wp post meta update $_3ST_010_10ec02e2 _stock_status instock
wp post meta update $_3ST_010_10ec02e2 _manage_stock yes
wp post meta update $_3ST_010_10ec02e2 _backorders yes
wp post meta update $_3ST_010_10ec02e2 _price 350.00
wp post meta update $_3ST_010_10ec02e2 _regular_price 350.00
wp post meta update $_3ST_010_10ec02e2 _sku 3ST-010-10ec02e2
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_010_10ec02e2 --featured_image=true
_3ST_011_10ed02e3=`wp post create --post_title="slope-011" --post_name="_3ST_XXX_06860224_011" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_011 --porcelain`
wp post meta update $_3ST_011_10ed02e3 _visibility visible
wp post meta update $_3ST_011_10ed02e3 attribute_edb_material 011
wp post meta update $_3ST_011_10ed02e3 _stock 2
wp post meta update $_3ST_011_10ed02e3 _stock_status instock
wp post meta update $_3ST_011_10ed02e3 _manage_stock yes
wp post meta update $_3ST_011_10ed02e3 _backorders yes
wp post meta update $_3ST_011_10ed02e3 _price 350.00
wp post meta update $_3ST_011_10ed02e3 _regular_price 350.00
wp post meta update $_3ST_011_10ed02e3 _sku 3ST-011-10ed02e3
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_011_10ed02e3 --featured_image=true
_3ST_012_10ee02e4=`wp post create --post_title="slope-012" --post_name="_3ST_XXX_06860224_012" --post_parent=$_3ST_XXX_06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06860224_012 --porcelain`
wp post meta update $_3ST_012_10ee02e4 _visibility visible
wp post meta update $_3ST_012_10ee02e4 attribute_edb_material 012
wp post meta update $_3ST_012_10ee02e4 _stock 2
wp post meta update $_3ST_012_10ee02e4 _stock_status instock
wp post meta update $_3ST_012_10ee02e4 _manage_stock yes
wp post meta update $_3ST_012_10ee02e4 _backorders yes
wp post meta update $_3ST_012_10ee02e4 _price 350.00
wp post meta update $_3ST_012_10ee02e4 _regular_price 350.00
wp post meta update $_3ST_012_10ee02e4 _sku 3ST-012-10ee02e4
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST_012_10ee02e4 --featured_image=true
_3ST_XXX_045001b7=`wp post create --post_title="taxi" --post_name="_3ST_XXX_045001b7" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_3ST_XXX_045001b7 --porcelain`
wp post meta update $_3ST_XXX_045001b7 _visibility visible
wp post meta update $_3ST_XXX_045001b7 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3ST_XXX_045001b7 _price 350.00
wp post meta update $_3ST_XXX_045001b7 _regular_price 350.00
wp post term set $_3ST_XXX_045001b7 product_shipping_class furniture
wp post term set $_3ST_XXX_045001b7 product_cat sofas-3-seater
wp post term set $_3ST_XXX_045001b7 product_type variable
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_XXX_045001b7 --featured_image=true
_3ST_XXX_045001b7_0=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_001.jpg --post_id=$_3ST_XXX_045001b7 --porcelain`
_3ST_XXX_045001b7_1=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0001_002.jpg --post_id=$_3ST_XXX_045001b7 --porcelain`
_3ST_XXX_045001b7_2=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0002_003.jpg --post_id=$_3ST_XXX_045001b7 --porcelain`
_3ST_XXX_045001b7_3=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004.jpg --post_id=$_3ST_XXX_045001b7 --porcelain`
_3ST_XXX_045001b7_4=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0001_005.jpg --post_id=$_3ST_XXX_045001b7 --porcelain`
_3ST_XXX_045001b7_5=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0002_006.jpg --post_id=$_3ST_XXX_045001b7 --porcelain`
wp post meta update $_3ST_XXX_045001b7 _product_image_gallery $_3ST_XXX_045001b7_0,$_3ST_XXX_045001b7_1,$_3ST_XXX_045001b7_2,$_3ST_XXX_045001b7_3,$_3ST_XXX_045001b7_4,$_3ST_XXX_045001b7_5
_3ST_001_0d010275=`wp post create --post_title="taxi-001" --post_name="_3ST_XXX_045001b7_001" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_001 --porcelain`
wp post meta update $_3ST_001_0d010275 _visibility visible
wp post meta update $_3ST_001_0d010275 attribute_edb_material 001
wp post meta update $_3ST_001_0d010275 _stock 2
wp post meta update $_3ST_001_0d010275 _stock_status instock
wp post meta update $_3ST_001_0d010275 _manage_stock yes
wp post meta update $_3ST_001_0d010275 _backorders yes
wp post meta update $_3ST_001_0d010275 _price 350.00
wp post meta update $_3ST_001_0d010275 _regular_price 350.00
wp post meta update $_3ST_001_0d010275 _sku 3ST-001-0d010275
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_001_0d010275 --featured_image=true
_3ST_002_0d020276=`wp post create --post_title="taxi-002" --post_name="_3ST_XXX_045001b7_002" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_002 --porcelain`
wp post meta update $_3ST_002_0d020276 _visibility visible
wp post meta update $_3ST_002_0d020276 attribute_edb_material 002
wp post meta update $_3ST_002_0d020276 _stock 2
wp post meta update $_3ST_002_0d020276 _stock_status instock
wp post meta update $_3ST_002_0d020276 _manage_stock yes
wp post meta update $_3ST_002_0d020276 _backorders yes
wp post meta update $_3ST_002_0d020276 _price 350.00
wp post meta update $_3ST_002_0d020276 _regular_price 350.00
wp post meta update $_3ST_002_0d020276 _sku 3ST-002-0d020276
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_002_0d020276 --featured_image=true
_3ST_003_0d030277=`wp post create --post_title="taxi-003" --post_name="_3ST_XXX_045001b7_003" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_003 --porcelain`
wp post meta update $_3ST_003_0d030277 _visibility visible
wp post meta update $_3ST_003_0d030277 attribute_edb_material 003
wp post meta update $_3ST_003_0d030277 _stock 2
wp post meta update $_3ST_003_0d030277 _stock_status instock
wp post meta update $_3ST_003_0d030277 _manage_stock yes
wp post meta update $_3ST_003_0d030277 _backorders yes
wp post meta update $_3ST_003_0d030277 _price 350.00
wp post meta update $_3ST_003_0d030277 _regular_price 350.00
wp post meta update $_3ST_003_0d030277 _sku 3ST-003-0d030277
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_003_0d030277 --featured_image=true
_3ST_004_0d040278=`wp post create --post_title="taxi-004" --post_name="_3ST_XXX_045001b7_004" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_004 --porcelain`
wp post meta update $_3ST_004_0d040278 _visibility visible
wp post meta update $_3ST_004_0d040278 attribute_edb_material 004
wp post meta update $_3ST_004_0d040278 _stock 2
wp post meta update $_3ST_004_0d040278 _stock_status instock
wp post meta update $_3ST_004_0d040278 _manage_stock yes
wp post meta update $_3ST_004_0d040278 _backorders yes
wp post meta update $_3ST_004_0d040278 _price 350.00
wp post meta update $_3ST_004_0d040278 _regular_price 350.00
wp post meta update $_3ST_004_0d040278 _sku 3ST-004-0d040278
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_004_0d040278 --featured_image=true
_3ST_005_0d050279=`wp post create --post_title="taxi-005" --post_name="_3ST_XXX_045001b7_005" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_005 --porcelain`
wp post meta update $_3ST_005_0d050279 _visibility visible
wp post meta update $_3ST_005_0d050279 attribute_edb_material 005
wp post meta update $_3ST_005_0d050279 _stock 2
wp post meta update $_3ST_005_0d050279 _stock_status instock
wp post meta update $_3ST_005_0d050279 _manage_stock yes
wp post meta update $_3ST_005_0d050279 _backorders yes
wp post meta update $_3ST_005_0d050279 _price 350.00
wp post meta update $_3ST_005_0d050279 _regular_price 350.00
wp post meta update $_3ST_005_0d050279 _sku 3ST-005-0d050279
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_005_0d050279 --featured_image=true
_3ST_006_0d06027a=`wp post create --post_title="taxi-006" --post_name="_3ST_XXX_045001b7_006" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_006 --porcelain`
wp post meta update $_3ST_006_0d06027a _visibility visible
wp post meta update $_3ST_006_0d06027a attribute_edb_material 006
wp post meta update $_3ST_006_0d06027a _stock 2
wp post meta update $_3ST_006_0d06027a _stock_status instock
wp post meta update $_3ST_006_0d06027a _manage_stock yes
wp post meta update $_3ST_006_0d06027a _backorders yes
wp post meta update $_3ST_006_0d06027a _price 350.00
wp post meta update $_3ST_006_0d06027a _regular_price 350.00
wp post meta update $_3ST_006_0d06027a _sku 3ST-006-0d06027a
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_006_0d06027a --featured_image=true
_3ST_007_0d07027b=`wp post create --post_title="taxi-007" --post_name="_3ST_XXX_045001b7_007" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_007 --porcelain`
wp post meta update $_3ST_007_0d07027b _visibility visible
wp post meta update $_3ST_007_0d07027b attribute_edb_material 007
wp post meta update $_3ST_007_0d07027b _stock 2
wp post meta update $_3ST_007_0d07027b _stock_status instock
wp post meta update $_3ST_007_0d07027b _manage_stock yes
wp post meta update $_3ST_007_0d07027b _backorders yes
wp post meta update $_3ST_007_0d07027b _price 350.00
wp post meta update $_3ST_007_0d07027b _regular_price 350.00
wp post meta update $_3ST_007_0d07027b _sku 3ST-007-0d07027b
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_007_0d07027b --featured_image=true
_3ST_008_0d08027c=`wp post create --post_title="taxi-008" --post_name="_3ST_XXX_045001b7_008" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_008 --porcelain`
wp post meta update $_3ST_008_0d08027c _visibility visible
wp post meta update $_3ST_008_0d08027c attribute_edb_material 008
wp post meta update $_3ST_008_0d08027c _stock 2
wp post meta update $_3ST_008_0d08027c _stock_status instock
wp post meta update $_3ST_008_0d08027c _manage_stock yes
wp post meta update $_3ST_008_0d08027c _backorders yes
wp post meta update $_3ST_008_0d08027c _price 350.00
wp post meta update $_3ST_008_0d08027c _regular_price 350.00
wp post meta update $_3ST_008_0d08027c _sku 3ST-008-0d08027c
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_008_0d08027c --featured_image=true
_3ST_009_0d09027d=`wp post create --post_title="taxi-009" --post_name="_3ST_XXX_045001b7_009" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_009 --porcelain`
wp post meta update $_3ST_009_0d09027d _visibility visible
wp post meta update $_3ST_009_0d09027d attribute_edb_material 009
wp post meta update $_3ST_009_0d09027d _stock 2
wp post meta update $_3ST_009_0d09027d _stock_status instock
wp post meta update $_3ST_009_0d09027d _manage_stock yes
wp post meta update $_3ST_009_0d09027d _backorders yes
wp post meta update $_3ST_009_0d09027d _price 350.00
wp post meta update $_3ST_009_0d09027d _regular_price 350.00
wp post meta update $_3ST_009_0d09027d _sku 3ST-009-0d09027d
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_009_0d09027d --featured_image=true
_3ST_010_0d020275=`wp post create --post_title="taxi-010" --post_name="_3ST_XXX_045001b7_010" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_010 --porcelain`
wp post meta update $_3ST_010_0d020275 _visibility visible
wp post meta update $_3ST_010_0d020275 attribute_edb_material 010
wp post meta update $_3ST_010_0d020275 _stock 2
wp post meta update $_3ST_010_0d020275 _stock_status instock
wp post meta update $_3ST_010_0d020275 _manage_stock yes
wp post meta update $_3ST_010_0d020275 _backorders yes
wp post meta update $_3ST_010_0d020275 _price 350.00
wp post meta update $_3ST_010_0d020275 _regular_price 350.00
wp post meta update $_3ST_010_0d020275 _sku 3ST-010-0d020275
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_010_0d020275 --featured_image=true
_3ST_011_0d030276=`wp post create --post_title="taxi-011" --post_name="_3ST_XXX_045001b7_011" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_011 --porcelain`
wp post meta update $_3ST_011_0d030276 _visibility visible
wp post meta update $_3ST_011_0d030276 attribute_edb_material 011
wp post meta update $_3ST_011_0d030276 _stock 2
wp post meta update $_3ST_011_0d030276 _stock_status instock
wp post meta update $_3ST_011_0d030276 _manage_stock yes
wp post meta update $_3ST_011_0d030276 _backorders yes
wp post meta update $_3ST_011_0d030276 _price 350.00
wp post meta update $_3ST_011_0d030276 _regular_price 350.00
wp post meta update $_3ST_011_0d030276 _sku 3ST-011-0d030276
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_011_0d030276 --featured_image=true
_3ST_012_0d040277=`wp post create --post_title="taxi-012" --post_name="_3ST_XXX_045001b7_012" --post_parent=$_3ST_XXX_045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_045001b7_012 --porcelain`
wp post meta update $_3ST_012_0d040277 _visibility visible
wp post meta update $_3ST_012_0d040277 attribute_edb_material 012
wp post meta update $_3ST_012_0d040277 _stock 2
wp post meta update $_3ST_012_0d040277 _stock_status instock
wp post meta update $_3ST_012_0d040277 _manage_stock yes
wp post meta update $_3ST_012_0d040277 _backorders yes
wp post meta update $_3ST_012_0d040277 _price 350.00
wp post meta update $_3ST_012_0d040277 _regular_price 350.00
wp post meta update $_3ST_012_0d040277 _sku 3ST-012-0d040277
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST_012_0d040277 --featured_image=true
_3ST_XXX_08ea0293=`wp post create --post_title="atrium" --post_name="_3ST_XXX_08ea0293" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_3ST_XXX_08ea0293 --porcelain`
wp post meta update $_3ST_XXX_08ea0293 _visibility visible
wp post meta update $_3ST_XXX_08ea0293 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3ST_XXX_08ea0293 _price 350.00
wp post meta update $_3ST_XXX_08ea0293 _regular_price 350.00
wp post term set $_3ST_XXX_08ea0293 product_shipping_class furniture
wp post term set $_3ST_XXX_08ea0293 product_cat sofas-3-seater
wp post term set $_3ST_XXX_08ea0293 product_type variable
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_XXX_08ea0293 --featured_image=true
_3ST_XXX_08ea0293_0=`wp media import ./data/products/05-atrium/gallery/atrium_sofa_0000_001.jpg --post_id=$_3ST_XXX_08ea0293 --porcelain`
_3ST_XXX_08ea0293_1=`wp media import ./data/products/05-atrium/gallery/atrium_sofa_0001_002.jpg --post_id=$_3ST_XXX_08ea0293 --porcelain`
_3ST_XXX_08ea0293_2=`wp media import ./data/products/05-atrium/gallery/atrium_sofa_0002_003.jpg --post_id=$_3ST_XXX_08ea0293 --porcelain`
_3ST_XXX_08ea0293_3=`wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004.jpg --post_id=$_3ST_XXX_08ea0293 --porcelain`
_3ST_XXX_08ea0293_4=`wp media import ./data/products/05-atrium/gallery/atrium_natural_0001_005.jpg --post_id=$_3ST_XXX_08ea0293 --porcelain`
_3ST_XXX_08ea0293_5=`wp media import ./data/products/05-atrium/gallery/atrium_natural_0002_006.jpg --post_id=$_3ST_XXX_08ea0293 --porcelain`
wp post meta update $_3ST_XXX_08ea0293 _product_image_gallery $_3ST_XXX_08ea0293_0,$_3ST_XXX_08ea0293_1,$_3ST_XXX_08ea0293_2,$_3ST_XXX_08ea0293_3,$_3ST_XXX_08ea0293_4,$_3ST_XXX_08ea0293_5
_3ST_001_150b0351=`wp post create --post_title="atrium-001" --post_name="_3ST_XXX_08ea0293_001" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_001 --porcelain`
wp post meta update $_3ST_001_150b0351 _visibility visible
wp post meta update $_3ST_001_150b0351 attribute_edb_material 001
wp post meta update $_3ST_001_150b0351 _stock 2
wp post meta update $_3ST_001_150b0351 _stock_status instock
wp post meta update $_3ST_001_150b0351 _manage_stock yes
wp post meta update $_3ST_001_150b0351 _backorders yes
wp post meta update $_3ST_001_150b0351 _price 350.00
wp post meta update $_3ST_001_150b0351 _regular_price 350.00
wp post meta update $_3ST_001_150b0351 _sku 3ST-001-150b0351
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_001_150b0351 --featured_image=true
_3ST_002_150c0352=`wp post create --post_title="atrium-002" --post_name="_3ST_XXX_08ea0293_002" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_002 --porcelain`
wp post meta update $_3ST_002_150c0352 _visibility visible
wp post meta update $_3ST_002_150c0352 attribute_edb_material 002
wp post meta update $_3ST_002_150c0352 _stock 2
wp post meta update $_3ST_002_150c0352 _stock_status instock
wp post meta update $_3ST_002_150c0352 _manage_stock yes
wp post meta update $_3ST_002_150c0352 _backorders yes
wp post meta update $_3ST_002_150c0352 _price 350.00
wp post meta update $_3ST_002_150c0352 _regular_price 350.00
wp post meta update $_3ST_002_150c0352 _sku 3ST-002-150c0352
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_002_150c0352 --featured_image=true
_3ST_003_150d0353=`wp post create --post_title="atrium-003" --post_name="_3ST_XXX_08ea0293_003" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_003 --porcelain`
wp post meta update $_3ST_003_150d0353 _visibility visible
wp post meta update $_3ST_003_150d0353 attribute_edb_material 003
wp post meta update $_3ST_003_150d0353 _stock 2
wp post meta update $_3ST_003_150d0353 _stock_status instock
wp post meta update $_3ST_003_150d0353 _manage_stock yes
wp post meta update $_3ST_003_150d0353 _backorders yes
wp post meta update $_3ST_003_150d0353 _price 350.00
wp post meta update $_3ST_003_150d0353 _regular_price 350.00
wp post meta update $_3ST_003_150d0353 _sku 3ST-003-150d0353
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_003_150d0353 --featured_image=true
_3ST_004_150e0354=`wp post create --post_title="atrium-004" --post_name="_3ST_XXX_08ea0293_004" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_004 --porcelain`
wp post meta update $_3ST_004_150e0354 _visibility visible
wp post meta update $_3ST_004_150e0354 attribute_edb_material 004
wp post meta update $_3ST_004_150e0354 _stock 2
wp post meta update $_3ST_004_150e0354 _stock_status instock
wp post meta update $_3ST_004_150e0354 _manage_stock yes
wp post meta update $_3ST_004_150e0354 _backorders yes
wp post meta update $_3ST_004_150e0354 _price 350.00
wp post meta update $_3ST_004_150e0354 _regular_price 350.00
wp post meta update $_3ST_004_150e0354 _sku 3ST-004-150e0354
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_004_150e0354 --featured_image=true
_3ST_005_150f0355=`wp post create --post_title="atrium-005" --post_name="_3ST_XXX_08ea0293_005" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_005 --porcelain`
wp post meta update $_3ST_005_150f0355 _visibility visible
wp post meta update $_3ST_005_150f0355 attribute_edb_material 005
wp post meta update $_3ST_005_150f0355 _stock 2
wp post meta update $_3ST_005_150f0355 _stock_status instock
wp post meta update $_3ST_005_150f0355 _manage_stock yes
wp post meta update $_3ST_005_150f0355 _backorders yes
wp post meta update $_3ST_005_150f0355 _price 350.00
wp post meta update $_3ST_005_150f0355 _regular_price 350.00
wp post meta update $_3ST_005_150f0355 _sku 3ST-005-150f0355
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_005_150f0355 --featured_image=true
_3ST_006_15100356=`wp post create --post_title="atrium-006" --post_name="_3ST_XXX_08ea0293_006" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_006 --porcelain`
wp post meta update $_3ST_006_15100356 _visibility visible
wp post meta update $_3ST_006_15100356 attribute_edb_material 006
wp post meta update $_3ST_006_15100356 _stock 2
wp post meta update $_3ST_006_15100356 _stock_status instock
wp post meta update $_3ST_006_15100356 _manage_stock yes
wp post meta update $_3ST_006_15100356 _backorders yes
wp post meta update $_3ST_006_15100356 _price 350.00
wp post meta update $_3ST_006_15100356 _regular_price 350.00
wp post meta update $_3ST_006_15100356 _sku 3ST-006-15100356
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_006_15100356 --featured_image=true
_3ST_007_15110357=`wp post create --post_title="atrium-007" --post_name="_3ST_XXX_08ea0293_007" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_007 --porcelain`
wp post meta update $_3ST_007_15110357 _visibility visible
wp post meta update $_3ST_007_15110357 attribute_edb_material 007
wp post meta update $_3ST_007_15110357 _stock 2
wp post meta update $_3ST_007_15110357 _stock_status instock
wp post meta update $_3ST_007_15110357 _manage_stock yes
wp post meta update $_3ST_007_15110357 _backorders yes
wp post meta update $_3ST_007_15110357 _price 350.00
wp post meta update $_3ST_007_15110357 _regular_price 350.00
wp post meta update $_3ST_007_15110357 _sku 3ST-007-15110357
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_007_15110357 --featured_image=true
_3ST_008_15120358=`wp post create --post_title="atrium-008" --post_name="_3ST_XXX_08ea0293_008" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_008 --porcelain`
wp post meta update $_3ST_008_15120358 _visibility visible
wp post meta update $_3ST_008_15120358 attribute_edb_material 008
wp post meta update $_3ST_008_15120358 _stock 2
wp post meta update $_3ST_008_15120358 _stock_status instock
wp post meta update $_3ST_008_15120358 _manage_stock yes
wp post meta update $_3ST_008_15120358 _backorders yes
wp post meta update $_3ST_008_15120358 _price 350.00
wp post meta update $_3ST_008_15120358 _regular_price 350.00
wp post meta update $_3ST_008_15120358 _sku 3ST-008-15120358
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_008_15120358 --featured_image=true
_3ST_009_15130359=`wp post create --post_title="atrium-009" --post_name="_3ST_XXX_08ea0293_009" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_009 --porcelain`
wp post meta update $_3ST_009_15130359 _visibility visible
wp post meta update $_3ST_009_15130359 attribute_edb_material 009
wp post meta update $_3ST_009_15130359 _stock 2
wp post meta update $_3ST_009_15130359 _stock_status instock
wp post meta update $_3ST_009_15130359 _manage_stock yes
wp post meta update $_3ST_009_15130359 _backorders yes
wp post meta update $_3ST_009_15130359 _price 350.00
wp post meta update $_3ST_009_15130359 _regular_price 350.00
wp post meta update $_3ST_009_15130359 _sku 3ST-009-15130359
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_009_15130359 --featured_image=true
_3ST_010_150c0351=`wp post create --post_title="atrium-010" --post_name="_3ST_XXX_08ea0293_010" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_010 --porcelain`
wp post meta update $_3ST_010_150c0351 _visibility visible
wp post meta update $_3ST_010_150c0351 attribute_edb_material 010
wp post meta update $_3ST_010_150c0351 _stock 2
wp post meta update $_3ST_010_150c0351 _stock_status instock
wp post meta update $_3ST_010_150c0351 _manage_stock yes
wp post meta update $_3ST_010_150c0351 _backorders yes
wp post meta update $_3ST_010_150c0351 _price 350.00
wp post meta update $_3ST_010_150c0351 _regular_price 350.00
wp post meta update $_3ST_010_150c0351 _sku 3ST-010-150c0351
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_010_150c0351 --featured_image=true
_3ST_011_150d0352=`wp post create --post_title="atrium-011" --post_name="_3ST_XXX_08ea0293_011" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_011 --porcelain`
wp post meta update $_3ST_011_150d0352 _visibility visible
wp post meta update $_3ST_011_150d0352 attribute_edb_material 011
wp post meta update $_3ST_011_150d0352 _stock 2
wp post meta update $_3ST_011_150d0352 _stock_status instock
wp post meta update $_3ST_011_150d0352 _manage_stock yes
wp post meta update $_3ST_011_150d0352 _backorders yes
wp post meta update $_3ST_011_150d0352 _price 350.00
wp post meta update $_3ST_011_150d0352 _regular_price 350.00
wp post meta update $_3ST_011_150d0352 _sku 3ST-011-150d0352
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_011_150d0352 --featured_image=true
_3ST_012_150e0353=`wp post create --post_title="atrium-012" --post_name="_3ST_XXX_08ea0293_012" --post_parent=$_3ST_XXX_08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_08ea0293_012 --porcelain`
wp post meta update $_3ST_012_150e0353 _visibility visible
wp post meta update $_3ST_012_150e0353 attribute_edb_material 012
wp post meta update $_3ST_012_150e0353 _stock 2
wp post meta update $_3ST_012_150e0353 _stock_status instock
wp post meta update $_3ST_012_150e0353 _manage_stock yes
wp post meta update $_3ST_012_150e0353 _backorders yes
wp post meta update $_3ST_012_150e0353 _price 350.00
wp post meta update $_3ST_012_150e0353 _regular_price 350.00
wp post meta update $_3ST_012_150e0353 _sku 3ST-012-150e0353
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST_012_150e0353 --featured_image=true
_3ST_XXX_06b4023a=`wp post create --post_title="study" --post_name="_3ST_XXX_06b4023a" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_3ST_XXX_06b4023a --porcelain`
wp post meta update $_3ST_XXX_06b4023a _visibility visible
wp post meta update $_3ST_XXX_06b4023a _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3ST_XXX_06b4023a _price 350.00
wp post meta update $_3ST_XXX_06b4023a _regular_price 350.00
wp post term set $_3ST_XXX_06b4023a product_shipping_class furniture
wp post term set $_3ST_XXX_06b4023a product_cat sofas-3-seater
wp post term set $_3ST_XXX_06b4023a product_type variable
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_XXX_06b4023a --featured_image=true
_3ST_XXX_06b4023a_0=`wp media import ./data/products/04-study/gallery/study_sofa_0000_001.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_1=`wp media import ./data/products/04-study/gallery/study_sofa_0001_002.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_2=`wp media import ./data/products/04-study/gallery/study_sofa_0002_003.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_3=`wp media import ./data/products/04-study/gallery/study_sofa_0003_004.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_4=`wp media import ./data/products/04-study/gallery/study_sofa_0004_005.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_5=`wp media import ./data/products/04-study/gallery/study_sofa_0005_006.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_6=`wp media import ./data/products/04-study/gallery/study_sofa_0006_007.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_7=`wp media import ./data/products/04-study/gallery/study_sofa_0000_008.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_8=`wp media import ./data/products/04-study/gallery/study_sofa_0000_009.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_9=`wp media import ./data/products/04-study/gallery/study_sofa_0000_010.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_10=`wp media import ./data/products/04-study/gallery/study_sofa_0000_011.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
_3ST_XXX_06b4023a_11=`wp media import ./data/products/04-study/gallery/study_sofa_0000_012.jpg --post_id=$_3ST_XXX_06b4023a --porcelain`
wp post meta update $_3ST_XXX_06b4023a _product_image_gallery $_3ST_XXX_06b4023a_0,$_3ST_XXX_06b4023a_1,$_3ST_XXX_06b4023a_2,$_3ST_XXX_06b4023a_3,$_3ST_XXX_06b4023a_4,$_3ST_XXX_06b4023a_5,$_3ST_XXX_06b4023a_6,$_3ST_XXX_06b4023a_7,$_3ST_XXX_06b4023a_8,$_3ST_XXX_06b4023a_9,$_3ST_XXX_06b4023a_10,$_3ST_XXX_06b4023a_11
_3ST_001_117102f8=`wp post create --post_title="study-001" --post_name="_3ST_XXX_06b4023a_001" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_001 --porcelain`
wp post meta update $_3ST_001_117102f8 _visibility visible
wp post meta update $_3ST_001_117102f8 attribute_edb_material 001
wp post meta update $_3ST_001_117102f8 _stock 2
wp post meta update $_3ST_001_117102f8 _stock_status instock
wp post meta update $_3ST_001_117102f8 _manage_stock yes
wp post meta update $_3ST_001_117102f8 _backorders yes
wp post meta update $_3ST_001_117102f8 _price 350.00
wp post meta update $_3ST_001_117102f8 _regular_price 350.00
wp post meta update $_3ST_001_117102f8 _sku 3ST-001-117102f8
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_001_117102f8 --featured_image=true
_3ST_002_117202f9=`wp post create --post_title="study-002" --post_name="_3ST_XXX_06b4023a_002" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_002 --porcelain`
wp post meta update $_3ST_002_117202f9 _visibility visible
wp post meta update $_3ST_002_117202f9 attribute_edb_material 002
wp post meta update $_3ST_002_117202f9 _stock 2
wp post meta update $_3ST_002_117202f9 _stock_status instock
wp post meta update $_3ST_002_117202f9 _manage_stock yes
wp post meta update $_3ST_002_117202f9 _backorders yes
wp post meta update $_3ST_002_117202f9 _price 350.00
wp post meta update $_3ST_002_117202f9 _regular_price 350.00
wp post meta update $_3ST_002_117202f9 _sku 3ST-002-117202f9
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_002_117202f9 --featured_image=true
_3ST_003_117302fa=`wp post create --post_title="study-003" --post_name="_3ST_XXX_06b4023a_003" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_003 --porcelain`
wp post meta update $_3ST_003_117302fa _visibility visible
wp post meta update $_3ST_003_117302fa attribute_edb_material 003
wp post meta update $_3ST_003_117302fa _stock 2
wp post meta update $_3ST_003_117302fa _stock_status instock
wp post meta update $_3ST_003_117302fa _manage_stock yes
wp post meta update $_3ST_003_117302fa _backorders yes
wp post meta update $_3ST_003_117302fa _price 350.00
wp post meta update $_3ST_003_117302fa _regular_price 350.00
wp post meta update $_3ST_003_117302fa _sku 3ST-003-117302fa
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_003_117302fa --featured_image=true
_3ST_004_117402fb=`wp post create --post_title="study-004" --post_name="_3ST_XXX_06b4023a_004" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_004 --porcelain`
wp post meta update $_3ST_004_117402fb _visibility visible
wp post meta update $_3ST_004_117402fb attribute_edb_material 004
wp post meta update $_3ST_004_117402fb _stock 2
wp post meta update $_3ST_004_117402fb _stock_status instock
wp post meta update $_3ST_004_117402fb _manage_stock yes
wp post meta update $_3ST_004_117402fb _backorders yes
wp post meta update $_3ST_004_117402fb _price 350.00
wp post meta update $_3ST_004_117402fb _regular_price 350.00
wp post meta update $_3ST_004_117402fb _sku 3ST-004-117402fb
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_004_117402fb --featured_image=true
_3ST_005_117502fc=`wp post create --post_title="study-005" --post_name="_3ST_XXX_06b4023a_005" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_005 --porcelain`
wp post meta update $_3ST_005_117502fc _visibility visible
wp post meta update $_3ST_005_117502fc attribute_edb_material 005
wp post meta update $_3ST_005_117502fc _stock 2
wp post meta update $_3ST_005_117502fc _stock_status instock
wp post meta update $_3ST_005_117502fc _manage_stock yes
wp post meta update $_3ST_005_117502fc _backorders yes
wp post meta update $_3ST_005_117502fc _price 350.00
wp post meta update $_3ST_005_117502fc _regular_price 350.00
wp post meta update $_3ST_005_117502fc _sku 3ST-005-117502fc
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_005_117502fc --featured_image=true
_3ST_006_117602fd=`wp post create --post_title="study-006" --post_name="_3ST_XXX_06b4023a_006" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_006 --porcelain`
wp post meta update $_3ST_006_117602fd _visibility visible
wp post meta update $_3ST_006_117602fd attribute_edb_material 006
wp post meta update $_3ST_006_117602fd _stock 2
wp post meta update $_3ST_006_117602fd _stock_status instock
wp post meta update $_3ST_006_117602fd _manage_stock yes
wp post meta update $_3ST_006_117602fd _backorders yes
wp post meta update $_3ST_006_117602fd _price 350.00
wp post meta update $_3ST_006_117602fd _regular_price 350.00
wp post meta update $_3ST_006_117602fd _sku 3ST-006-117602fd
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_006_117602fd --featured_image=true
_3ST_007_117702fe=`wp post create --post_title="study-007" --post_name="_3ST_XXX_06b4023a_007" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_007 --porcelain`
wp post meta update $_3ST_007_117702fe _visibility visible
wp post meta update $_3ST_007_117702fe attribute_edb_material 007
wp post meta update $_3ST_007_117702fe _stock 2
wp post meta update $_3ST_007_117702fe _stock_status instock
wp post meta update $_3ST_007_117702fe _manage_stock yes
wp post meta update $_3ST_007_117702fe _backorders yes
wp post meta update $_3ST_007_117702fe _price 350.00
wp post meta update $_3ST_007_117702fe _regular_price 350.00
wp post meta update $_3ST_007_117702fe _sku 3ST-007-117702fe
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_007_117702fe --featured_image=true
_3ST_008_117802ff=`wp post create --post_title="study-008" --post_name="_3ST_XXX_06b4023a_008" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_008 --porcelain`
wp post meta update $_3ST_008_117802ff _visibility visible
wp post meta update $_3ST_008_117802ff attribute_edb_material 008
wp post meta update $_3ST_008_117802ff _stock 2
wp post meta update $_3ST_008_117802ff _stock_status instock
wp post meta update $_3ST_008_117802ff _manage_stock yes
wp post meta update $_3ST_008_117802ff _backorders yes
wp post meta update $_3ST_008_117802ff _price 350.00
wp post meta update $_3ST_008_117802ff _regular_price 350.00
wp post meta update $_3ST_008_117802ff _sku 3ST-008-117802ff
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_008_117802ff --featured_image=true
_3ST_009_11790300=`wp post create --post_title="study-009" --post_name="_3ST_XXX_06b4023a_009" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_009 --porcelain`
wp post meta update $_3ST_009_11790300 _visibility visible
wp post meta update $_3ST_009_11790300 attribute_edb_material 009
wp post meta update $_3ST_009_11790300 _stock 2
wp post meta update $_3ST_009_11790300 _stock_status instock
wp post meta update $_3ST_009_11790300 _manage_stock yes
wp post meta update $_3ST_009_11790300 _backorders yes
wp post meta update $_3ST_009_11790300 _price 350.00
wp post meta update $_3ST_009_11790300 _regular_price 350.00
wp post meta update $_3ST_009_11790300 _sku 3ST-009-11790300
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_009_11790300 --featured_image=true
_3ST_010_117202f8=`wp post create --post_title="study-010" --post_name="_3ST_XXX_06b4023a_010" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_010 --porcelain`
wp post meta update $_3ST_010_117202f8 _visibility visible
wp post meta update $_3ST_010_117202f8 attribute_edb_material 010
wp post meta update $_3ST_010_117202f8 _stock 2
wp post meta update $_3ST_010_117202f8 _stock_status instock
wp post meta update $_3ST_010_117202f8 _manage_stock yes
wp post meta update $_3ST_010_117202f8 _backorders yes
wp post meta update $_3ST_010_117202f8 _price 350.00
wp post meta update $_3ST_010_117202f8 _regular_price 350.00
wp post meta update $_3ST_010_117202f8 _sku 3ST-010-117202f8
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_010_117202f8 --featured_image=true
_3ST_011_117302f9=`wp post create --post_title="study-011" --post_name="_3ST_XXX_06b4023a_011" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_011 --porcelain`
wp post meta update $_3ST_011_117302f9 _visibility visible
wp post meta update $_3ST_011_117302f9 attribute_edb_material 011
wp post meta update $_3ST_011_117302f9 _stock 2
wp post meta update $_3ST_011_117302f9 _stock_status instock
wp post meta update $_3ST_011_117302f9 _manage_stock yes
wp post meta update $_3ST_011_117302f9 _backorders yes
wp post meta update $_3ST_011_117302f9 _price 350.00
wp post meta update $_3ST_011_117302f9 _regular_price 350.00
wp post meta update $_3ST_011_117302f9 _sku 3ST-011-117302f9
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_011_117302f9 --featured_image=true
_3ST_012_117402fa=`wp post create --post_title="study-012" --post_name="_3ST_XXX_06b4023a_012" --post_parent=$_3ST_XXX_06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_06b4023a_012 --porcelain`
wp post meta update $_3ST_012_117402fa _visibility visible
wp post meta update $_3ST_012_117402fa attribute_edb_material 012
wp post meta update $_3ST_012_117402fa _stock 2
wp post meta update $_3ST_012_117402fa _stock_status instock
wp post meta update $_3ST_012_117402fa _manage_stock yes
wp post meta update $_3ST_012_117402fa _backorders yes
wp post meta update $_3ST_012_117402fa _price 350.00
wp post meta update $_3ST_012_117402fa _regular_price 350.00
wp post meta update $_3ST_012_117402fa _sku 3ST-012-117402fa
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST_012_117402fa --featured_image=true
_3ST_XXX_0c4f030b=`wp post create --post_title="stripes" --post_name="_3ST_XXX_0c4f030b" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_3ST_XXX_0c4f030b --porcelain`
wp post meta update $_3ST_XXX_0c4f030b _visibility visible
wp post meta update $_3ST_XXX_0c4f030b _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3ST_XXX_0c4f030b _price 350.00
wp post meta update $_3ST_XXX_0c4f030b _regular_price 350.00
wp post term set $_3ST_XXX_0c4f030b product_shipping_class furniture
wp post term set $_3ST_XXX_0c4f030b product_cat sofas-3-seater
wp post term set $_3ST_XXX_0c4f030b product_type variable
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_XXX_0c4f030b --featured_image=true
_3ST_XXX_0c4f030b_0=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_001.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_1=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0001_002.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_2=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0002_003.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_3=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0003_004.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_4=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0004_005.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_5=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0005_006.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_6=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0006_007.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_7=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_8=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0001_009.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_9=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0002_010.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_10=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0003_011.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
_3ST_XXX_0c4f030b_11=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0004_012.jpg --post_id=$_3ST_XXX_0c4f030b --porcelain`
wp post meta update $_3ST_XXX_0c4f030b _product_image_gallery $_3ST_XXX_0c4f030b_0,$_3ST_XXX_0c4f030b_1,$_3ST_XXX_0c4f030b_2,$_3ST_XXX_0c4f030b_3,$_3ST_XXX_0c4f030b_4,$_3ST_XXX_0c4f030b_5,$_3ST_XXX_0c4f030b_6,$_3ST_XXX_0c4f030b_7,$_3ST_XXX_0c4f030b_8,$_3ST_XXX_0c4f030b_9,$_3ST_XXX_0c4f030b_10,$_3ST_XXX_0c4f030b_11
_3ST_001_1a5003c9=`wp post create --post_title="stripes-001" --post_name="_3ST_XXX_0c4f030b_001" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_001 --porcelain`
wp post meta update $_3ST_001_1a5003c9 _visibility visible
wp post meta update $_3ST_001_1a5003c9 attribute_edb_material 001
wp post meta update $_3ST_001_1a5003c9 _stock 2
wp post meta update $_3ST_001_1a5003c9 _stock_status instock
wp post meta update $_3ST_001_1a5003c9 _manage_stock yes
wp post meta update $_3ST_001_1a5003c9 _backorders yes
wp post meta update $_3ST_001_1a5003c9 _price 350.00
wp post meta update $_3ST_001_1a5003c9 _regular_price 350.00
wp post meta update $_3ST_001_1a5003c9 _sku 3ST-001-1a5003c9
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_001_1a5003c9 --featured_image=true
_3ST_002_1a5103ca=`wp post create --post_title="stripes-002" --post_name="_3ST_XXX_0c4f030b_002" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_002 --porcelain`
wp post meta update $_3ST_002_1a5103ca _visibility visible
wp post meta update $_3ST_002_1a5103ca attribute_edb_material 002
wp post meta update $_3ST_002_1a5103ca _stock 2
wp post meta update $_3ST_002_1a5103ca _stock_status instock
wp post meta update $_3ST_002_1a5103ca _manage_stock yes
wp post meta update $_3ST_002_1a5103ca _backorders yes
wp post meta update $_3ST_002_1a5103ca _price 350.00
wp post meta update $_3ST_002_1a5103ca _regular_price 350.00
wp post meta update $_3ST_002_1a5103ca _sku 3ST-002-1a5103ca
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_002_1a5103ca --featured_image=true
_3ST_003_1a5203cb=`wp post create --post_title="stripes-003" --post_name="_3ST_XXX_0c4f030b_003" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_003 --porcelain`
wp post meta update $_3ST_003_1a5203cb _visibility visible
wp post meta update $_3ST_003_1a5203cb attribute_edb_material 003
wp post meta update $_3ST_003_1a5203cb _stock 2
wp post meta update $_3ST_003_1a5203cb _stock_status instock
wp post meta update $_3ST_003_1a5203cb _manage_stock yes
wp post meta update $_3ST_003_1a5203cb _backorders yes
wp post meta update $_3ST_003_1a5203cb _price 350.00
wp post meta update $_3ST_003_1a5203cb _regular_price 350.00
wp post meta update $_3ST_003_1a5203cb _sku 3ST-003-1a5203cb
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_003_1a5203cb --featured_image=true
_3ST_004_1a5303cc=`wp post create --post_title="stripes-004" --post_name="_3ST_XXX_0c4f030b_004" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_004 --porcelain`
wp post meta update $_3ST_004_1a5303cc _visibility visible
wp post meta update $_3ST_004_1a5303cc attribute_edb_material 004
wp post meta update $_3ST_004_1a5303cc _stock 2
wp post meta update $_3ST_004_1a5303cc _stock_status instock
wp post meta update $_3ST_004_1a5303cc _manage_stock yes
wp post meta update $_3ST_004_1a5303cc _backorders yes
wp post meta update $_3ST_004_1a5303cc _price 350.00
wp post meta update $_3ST_004_1a5303cc _regular_price 350.00
wp post meta update $_3ST_004_1a5303cc _sku 3ST-004-1a5303cc
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_004_1a5303cc --featured_image=true
_3ST_005_1a5403cd=`wp post create --post_title="stripes-005" --post_name="_3ST_XXX_0c4f030b_005" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_005 --porcelain`
wp post meta update $_3ST_005_1a5403cd _visibility visible
wp post meta update $_3ST_005_1a5403cd attribute_edb_material 005
wp post meta update $_3ST_005_1a5403cd _stock 2
wp post meta update $_3ST_005_1a5403cd _stock_status instock
wp post meta update $_3ST_005_1a5403cd _manage_stock yes
wp post meta update $_3ST_005_1a5403cd _backorders yes
wp post meta update $_3ST_005_1a5403cd _price 350.00
wp post meta update $_3ST_005_1a5403cd _regular_price 350.00
wp post meta update $_3ST_005_1a5403cd _sku 3ST-005-1a5403cd
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_005_1a5403cd --featured_image=true
_3ST_006_1a5503ce=`wp post create --post_title="stripes-006" --post_name="_3ST_XXX_0c4f030b_006" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_006 --porcelain`
wp post meta update $_3ST_006_1a5503ce _visibility visible
wp post meta update $_3ST_006_1a5503ce attribute_edb_material 006
wp post meta update $_3ST_006_1a5503ce _stock 2
wp post meta update $_3ST_006_1a5503ce _stock_status instock
wp post meta update $_3ST_006_1a5503ce _manage_stock yes
wp post meta update $_3ST_006_1a5503ce _backorders yes
wp post meta update $_3ST_006_1a5503ce _price 350.00
wp post meta update $_3ST_006_1a5503ce _regular_price 350.00
wp post meta update $_3ST_006_1a5503ce _sku 3ST-006-1a5503ce
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_006_1a5503ce --featured_image=true
_3ST_007_1a5603cf=`wp post create --post_title="stripes-007" --post_name="_3ST_XXX_0c4f030b_007" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_007 --porcelain`
wp post meta update $_3ST_007_1a5603cf _visibility visible
wp post meta update $_3ST_007_1a5603cf attribute_edb_material 007
wp post meta update $_3ST_007_1a5603cf _stock 2
wp post meta update $_3ST_007_1a5603cf _stock_status instock
wp post meta update $_3ST_007_1a5603cf _manage_stock yes
wp post meta update $_3ST_007_1a5603cf _backorders yes
wp post meta update $_3ST_007_1a5603cf _price 350.00
wp post meta update $_3ST_007_1a5603cf _regular_price 350.00
wp post meta update $_3ST_007_1a5603cf _sku 3ST-007-1a5603cf
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_007_1a5603cf --featured_image=true
_3ST_008_1a5703d0=`wp post create --post_title="stripes-008" --post_name="_3ST_XXX_0c4f030b_008" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_008 --porcelain`
wp post meta update $_3ST_008_1a5703d0 _visibility visible
wp post meta update $_3ST_008_1a5703d0 attribute_edb_material 008
wp post meta update $_3ST_008_1a5703d0 _stock 2
wp post meta update $_3ST_008_1a5703d0 _stock_status instock
wp post meta update $_3ST_008_1a5703d0 _manage_stock yes
wp post meta update $_3ST_008_1a5703d0 _backorders yes
wp post meta update $_3ST_008_1a5703d0 _price 350.00
wp post meta update $_3ST_008_1a5703d0 _regular_price 350.00
wp post meta update $_3ST_008_1a5703d0 _sku 3ST-008-1a5703d0
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_008_1a5703d0 --featured_image=true
_3ST_009_1a5803d1=`wp post create --post_title="stripes-009" --post_name="_3ST_XXX_0c4f030b_009" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_009 --porcelain`
wp post meta update $_3ST_009_1a5803d1 _visibility visible
wp post meta update $_3ST_009_1a5803d1 attribute_edb_material 009
wp post meta update $_3ST_009_1a5803d1 _stock 2
wp post meta update $_3ST_009_1a5803d1 _stock_status instock
wp post meta update $_3ST_009_1a5803d1 _manage_stock yes
wp post meta update $_3ST_009_1a5803d1 _backorders yes
wp post meta update $_3ST_009_1a5803d1 _price 350.00
wp post meta update $_3ST_009_1a5803d1 _regular_price 350.00
wp post meta update $_3ST_009_1a5803d1 _sku 3ST-009-1a5803d1
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_009_1a5803d1 --featured_image=true
_3ST_010_1a5103c9=`wp post create --post_title="stripes-010" --post_name="_3ST_XXX_0c4f030b_010" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_010 --porcelain`
wp post meta update $_3ST_010_1a5103c9 _visibility visible
wp post meta update $_3ST_010_1a5103c9 attribute_edb_material 010
wp post meta update $_3ST_010_1a5103c9 _stock 2
wp post meta update $_3ST_010_1a5103c9 _stock_status instock
wp post meta update $_3ST_010_1a5103c9 _manage_stock yes
wp post meta update $_3ST_010_1a5103c9 _backorders yes
wp post meta update $_3ST_010_1a5103c9 _price 350.00
wp post meta update $_3ST_010_1a5103c9 _regular_price 350.00
wp post meta update $_3ST_010_1a5103c9 _sku 3ST-010-1a5103c9
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_010_1a5103c9 --featured_image=true
_3ST_011_1a5203ca=`wp post create --post_title="stripes-011" --post_name="_3ST_XXX_0c4f030b_011" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_011 --porcelain`
wp post meta update $_3ST_011_1a5203ca _visibility visible
wp post meta update $_3ST_011_1a5203ca attribute_edb_material 011
wp post meta update $_3ST_011_1a5203ca _stock 2
wp post meta update $_3ST_011_1a5203ca _stock_status instock
wp post meta update $_3ST_011_1a5203ca _manage_stock yes
wp post meta update $_3ST_011_1a5203ca _backorders yes
wp post meta update $_3ST_011_1a5203ca _price 350.00
wp post meta update $_3ST_011_1a5203ca _regular_price 350.00
wp post meta update $_3ST_011_1a5203ca _sku 3ST-011-1a5203ca
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_011_1a5203ca --featured_image=true
_3ST_012_1a5303cb=`wp post create --post_title="stripes-012" --post_name="_3ST_XXX_0c4f030b_012" --post_parent=$_3ST_XXX_0c4f030b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_0c4f030b_012 --porcelain`
wp post meta update $_3ST_012_1a5303cb _visibility visible
wp post meta update $_3ST_012_1a5303cb attribute_edb_material 012
wp post meta update $_3ST_012_1a5303cb _stock 2
wp post meta update $_3ST_012_1a5303cb _stock_status instock
wp post meta update $_3ST_012_1a5303cb _manage_stock yes
wp post meta update $_3ST_012_1a5303cb _backorders yes
wp post meta update $_3ST_012_1a5303cb _price 350.00
wp post meta update $_3ST_012_1a5303cb _regular_price 350.00
wp post meta update $_3ST_012_1a5303cb _sku 3ST-012-1a5303cb
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST_012_1a5303cb --featured_image=true
_3ST_XXX_372e067d=`wp post create --post_title="maritime-natural" --post_name="_3ST_XXX_372e067d" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_3ST_XXX_372e067d --porcelain`
wp post meta update $_3ST_XXX_372e067d _visibility visible
wp post meta update $_3ST_XXX_372e067d _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3ST_XXX_372e067d _price 350.00
wp post meta update $_3ST_XXX_372e067d _regular_price 350.00
wp post term set $_3ST_XXX_372e067d product_shipping_class furniture
wp post term set $_3ST_XXX_372e067d product_cat sofas-3-seater
wp post term set $_3ST_XXX_372e067d product_type variable
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_XXX_372e067d --featured_image=true
_3ST_XXX_372e067d_0=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_001.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_1=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0001_002.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_2=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0002_003.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_3=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0003_004.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_4=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0004_005.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_5=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0005_006.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_6=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0006_007.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_7=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_8=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0001_009.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_9=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0002_010.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_10=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0003_011.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
_3ST_XXX_372e067d_11=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0004_012.jpg --post_id=$_3ST_XXX_372e067d --porcelain`
wp post meta update $_3ST_XXX_372e067d _product_image_gallery $_3ST_XXX_372e067d_0,$_3ST_XXX_372e067d_1,$_3ST_XXX_372e067d_2,$_3ST_XXX_372e067d_3,$_3ST_XXX_372e067d_4,$_3ST_XXX_372e067d_5,$_3ST_XXX_372e067d_6,$_3ST_XXX_372e067d_7,$_3ST_XXX_372e067d_8,$_3ST_XXX_372e067d_9,$_3ST_XXX_372e067d_10,$_3ST_XXX_372e067d_11
_3ST_001_52f7073b=`wp post create --post_title="maritime-natural-001" --post_name="_3ST_XXX_372e067d_001" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_001 --porcelain`
wp post meta update $_3ST_001_52f7073b _visibility visible
wp post meta update $_3ST_001_52f7073b attribute_edb_material 001
wp post meta update $_3ST_001_52f7073b _stock 2
wp post meta update $_3ST_001_52f7073b _stock_status instock
wp post meta update $_3ST_001_52f7073b _manage_stock yes
wp post meta update $_3ST_001_52f7073b _backorders yes
wp post meta update $_3ST_001_52f7073b _price 350.00
wp post meta update $_3ST_001_52f7073b _regular_price 350.00
wp post meta update $_3ST_001_52f7073b _sku 3ST-001-52f7073b
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_001_52f7073b --featured_image=true
_3ST_002_52f8073c=`wp post create --post_title="maritime-natural-002" --post_name="_3ST_XXX_372e067d_002" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_002 --porcelain`
wp post meta update $_3ST_002_52f8073c _visibility visible
wp post meta update $_3ST_002_52f8073c attribute_edb_material 002
wp post meta update $_3ST_002_52f8073c _stock 2
wp post meta update $_3ST_002_52f8073c _stock_status instock
wp post meta update $_3ST_002_52f8073c _manage_stock yes
wp post meta update $_3ST_002_52f8073c _backorders yes
wp post meta update $_3ST_002_52f8073c _price 350.00
wp post meta update $_3ST_002_52f8073c _regular_price 350.00
wp post meta update $_3ST_002_52f8073c _sku 3ST-002-52f8073c
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_002_52f8073c --featured_image=true
_3ST_003_52f9073d=`wp post create --post_title="maritime-natural-003" --post_name="_3ST_XXX_372e067d_003" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_003 --porcelain`
wp post meta update $_3ST_003_52f9073d _visibility visible
wp post meta update $_3ST_003_52f9073d attribute_edb_material 003
wp post meta update $_3ST_003_52f9073d _stock 2
wp post meta update $_3ST_003_52f9073d _stock_status instock
wp post meta update $_3ST_003_52f9073d _manage_stock yes
wp post meta update $_3ST_003_52f9073d _backorders yes
wp post meta update $_3ST_003_52f9073d _price 350.00
wp post meta update $_3ST_003_52f9073d _regular_price 350.00
wp post meta update $_3ST_003_52f9073d _sku 3ST-003-52f9073d
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_003_52f9073d --featured_image=true
_3ST_004_52fa073e=`wp post create --post_title="maritime-natural-004" --post_name="_3ST_XXX_372e067d_004" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_004 --porcelain`
wp post meta update $_3ST_004_52fa073e _visibility visible
wp post meta update $_3ST_004_52fa073e attribute_edb_material 004
wp post meta update $_3ST_004_52fa073e _stock 2
wp post meta update $_3ST_004_52fa073e _stock_status instock
wp post meta update $_3ST_004_52fa073e _manage_stock yes
wp post meta update $_3ST_004_52fa073e _backorders yes
wp post meta update $_3ST_004_52fa073e _price 350.00
wp post meta update $_3ST_004_52fa073e _regular_price 350.00
wp post meta update $_3ST_004_52fa073e _sku 3ST-004-52fa073e
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_004_52fa073e --featured_image=true
_3ST_005_52fb073f=`wp post create --post_title="maritime-natural-005" --post_name="_3ST_XXX_372e067d_005" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_005 --porcelain`
wp post meta update $_3ST_005_52fb073f _visibility visible
wp post meta update $_3ST_005_52fb073f attribute_edb_material 005
wp post meta update $_3ST_005_52fb073f _stock 2
wp post meta update $_3ST_005_52fb073f _stock_status instock
wp post meta update $_3ST_005_52fb073f _manage_stock yes
wp post meta update $_3ST_005_52fb073f _backorders yes
wp post meta update $_3ST_005_52fb073f _price 350.00
wp post meta update $_3ST_005_52fb073f _regular_price 350.00
wp post meta update $_3ST_005_52fb073f _sku 3ST-005-52fb073f
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_005_52fb073f --featured_image=true
_3ST_006_52fc0740=`wp post create --post_title="maritime-natural-006" --post_name="_3ST_XXX_372e067d_006" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_006 --porcelain`
wp post meta update $_3ST_006_52fc0740 _visibility visible
wp post meta update $_3ST_006_52fc0740 attribute_edb_material 006
wp post meta update $_3ST_006_52fc0740 _stock 2
wp post meta update $_3ST_006_52fc0740 _stock_status instock
wp post meta update $_3ST_006_52fc0740 _manage_stock yes
wp post meta update $_3ST_006_52fc0740 _backorders yes
wp post meta update $_3ST_006_52fc0740 _price 350.00
wp post meta update $_3ST_006_52fc0740 _regular_price 350.00
wp post meta update $_3ST_006_52fc0740 _sku 3ST-006-52fc0740
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_006_52fc0740 --featured_image=true
_3ST_007_52fd0741=`wp post create --post_title="maritime-natural-007" --post_name="_3ST_XXX_372e067d_007" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_007 --porcelain`
wp post meta update $_3ST_007_52fd0741 _visibility visible
wp post meta update $_3ST_007_52fd0741 attribute_edb_material 007
wp post meta update $_3ST_007_52fd0741 _stock 2
wp post meta update $_3ST_007_52fd0741 _stock_status instock
wp post meta update $_3ST_007_52fd0741 _manage_stock yes
wp post meta update $_3ST_007_52fd0741 _backorders yes
wp post meta update $_3ST_007_52fd0741 _price 350.00
wp post meta update $_3ST_007_52fd0741 _regular_price 350.00
wp post meta update $_3ST_007_52fd0741 _sku 3ST-007-52fd0741
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_007_52fd0741 --featured_image=true
_3ST_008_52fe0742=`wp post create --post_title="maritime-natural-008" --post_name="_3ST_XXX_372e067d_008" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_008 --porcelain`
wp post meta update $_3ST_008_52fe0742 _visibility visible
wp post meta update $_3ST_008_52fe0742 attribute_edb_material 008
wp post meta update $_3ST_008_52fe0742 _stock 2
wp post meta update $_3ST_008_52fe0742 _stock_status instock
wp post meta update $_3ST_008_52fe0742 _manage_stock yes
wp post meta update $_3ST_008_52fe0742 _backorders yes
wp post meta update $_3ST_008_52fe0742 _price 350.00
wp post meta update $_3ST_008_52fe0742 _regular_price 350.00
wp post meta update $_3ST_008_52fe0742 _sku 3ST-008-52fe0742
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_008_52fe0742 --featured_image=true
_3ST_009_52ff0743=`wp post create --post_title="maritime-natural-009" --post_name="_3ST_XXX_372e067d_009" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_009 --porcelain`
wp post meta update $_3ST_009_52ff0743 _visibility visible
wp post meta update $_3ST_009_52ff0743 attribute_edb_material 009
wp post meta update $_3ST_009_52ff0743 _stock 2
wp post meta update $_3ST_009_52ff0743 _stock_status instock
wp post meta update $_3ST_009_52ff0743 _manage_stock yes
wp post meta update $_3ST_009_52ff0743 _backorders yes
wp post meta update $_3ST_009_52ff0743 _price 350.00
wp post meta update $_3ST_009_52ff0743 _regular_price 350.00
wp post meta update $_3ST_009_52ff0743 _sku 3ST-009-52ff0743
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_009_52ff0743 --featured_image=true
_3ST_010_52f8073b=`wp post create --post_title="maritime-natural-010" --post_name="_3ST_XXX_372e067d_010" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_010 --porcelain`
wp post meta update $_3ST_010_52f8073b _visibility visible
wp post meta update $_3ST_010_52f8073b attribute_edb_material 010
wp post meta update $_3ST_010_52f8073b _stock 2
wp post meta update $_3ST_010_52f8073b _stock_status instock
wp post meta update $_3ST_010_52f8073b _manage_stock yes
wp post meta update $_3ST_010_52f8073b _backorders yes
wp post meta update $_3ST_010_52f8073b _price 350.00
wp post meta update $_3ST_010_52f8073b _regular_price 350.00
wp post meta update $_3ST_010_52f8073b _sku 3ST-010-52f8073b
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_010_52f8073b --featured_image=true
_3ST_011_52f9073c=`wp post create --post_title="maritime-natural-011" --post_name="_3ST_XXX_372e067d_011" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_011 --porcelain`
wp post meta update $_3ST_011_52f9073c _visibility visible
wp post meta update $_3ST_011_52f9073c attribute_edb_material 011
wp post meta update $_3ST_011_52f9073c _stock 2
wp post meta update $_3ST_011_52f9073c _stock_status instock
wp post meta update $_3ST_011_52f9073c _manage_stock yes
wp post meta update $_3ST_011_52f9073c _backorders yes
wp post meta update $_3ST_011_52f9073c _price 350.00
wp post meta update $_3ST_011_52f9073c _regular_price 350.00
wp post meta update $_3ST_011_52f9073c _sku 3ST-011-52f9073c
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_011_52f9073c --featured_image=true
_3ST_012_52fa073d=`wp post create --post_title="maritime-natural-012" --post_name="_3ST_XXX_372e067d_012" --post_parent=$_3ST_XXX_372e067d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_372e067d_012 --porcelain`
wp post meta update $_3ST_012_52fa073d _visibility visible
wp post meta update $_3ST_012_52fa073d attribute_edb_material 012
wp post meta update $_3ST_012_52fa073d _stock 2
wp post meta update $_3ST_012_52fa073d _stock_status instock
wp post meta update $_3ST_012_52fa073d _manage_stock yes
wp post meta update $_3ST_012_52fa073d _backorders yes
wp post meta update $_3ST_012_52fa073d _price 350.00
wp post meta update $_3ST_012_52fa073d _regular_price 350.00
wp post meta update $_3ST_012_52fa073d _sku 3ST-012-52fa073d
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST_012_52fa073d --featured_image=true
_3ST_XXX_30cb0621=`wp post create --post_title="maritime-walnut" --post_name="_3ST_XXX_30cb0621" --post_content="lorem ipsum dolore..." --post_type=product --post_status=publish --post_name=_3ST_XXX_30cb0621 --porcelain`
wp post meta update $_3ST_XXX_30cb0621 _visibility visible
wp post meta update $_3ST_XXX_30cb0621 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3ST_XXX_30cb0621 _price 350.00
wp post meta update $_3ST_XXX_30cb0621 _regular_price 350.00
wp post term set $_3ST_XXX_30cb0621 product_shipping_class furniture
wp post term set $_3ST_XXX_30cb0621 product_cat sofas-3-seater
wp post term set $_3ST_XXX_30cb0621 product_type variable
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_XXX_30cb0621 --featured_image=true
_3ST_XXX_30cb0621_0=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0000_maritime_walnut_001.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_1=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0001_maritime_walnut_002.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_2=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0002_maritime_walnut_003.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_3=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0003_maritime_walnut_004.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_4=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0004_maritime_walnut_005.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_5=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0005_maritime_walnut_006.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_6=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0006_maritime_walnut_007.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_7=`wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_8=`wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0001_maritime_walnut_009.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_9=`wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0002_maritime_walnut_010.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_10=`wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0003_maritime_walnut_011.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
_3ST_XXX_30cb0621_11=`wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0004_maritime_walnut_012.jpg --post_id=$_3ST_XXX_30cb0621 --porcelain`
wp post meta update $_3ST_XXX_30cb0621 _product_image_gallery $_3ST_XXX_30cb0621_0,$_3ST_XXX_30cb0621_1,$_3ST_XXX_30cb0621_2,$_3ST_XXX_30cb0621_3,$_3ST_XXX_30cb0621_4,$_3ST_XXX_30cb0621_5,$_3ST_XXX_30cb0621_6,$_3ST_XXX_30cb0621_7,$_3ST_XXX_30cb0621_8,$_3ST_XXX_30cb0621_9,$_3ST_XXX_30cb0621_10,$_3ST_XXX_30cb0621_11
_3ST_001_4b2406df=`wp post create --post_title="maritime-walnut-001" --post_name="_3ST_XXX_30cb0621_001" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_001 --porcelain`
wp post meta update $_3ST_001_4b2406df _visibility visible
wp post meta update $_3ST_001_4b2406df attribute_edb_material 001
wp post meta update $_3ST_001_4b2406df _stock 2
wp post meta update $_3ST_001_4b2406df _stock_status instock
wp post meta update $_3ST_001_4b2406df _manage_stock yes
wp post meta update $_3ST_001_4b2406df _backorders yes
wp post meta update $_3ST_001_4b2406df _price 350.00
wp post meta update $_3ST_001_4b2406df _regular_price 350.00
wp post meta update $_3ST_001_4b2406df _sku 3ST-001-4b2406df
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_001_4b2406df --featured_image=true
_3ST_002_4b2506e0=`wp post create --post_title="maritime-walnut-002" --post_name="_3ST_XXX_30cb0621_002" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_002 --porcelain`
wp post meta update $_3ST_002_4b2506e0 _visibility visible
wp post meta update $_3ST_002_4b2506e0 attribute_edb_material 002
wp post meta update $_3ST_002_4b2506e0 _stock 2
wp post meta update $_3ST_002_4b2506e0 _stock_status instock
wp post meta update $_3ST_002_4b2506e0 _manage_stock yes
wp post meta update $_3ST_002_4b2506e0 _backorders yes
wp post meta update $_3ST_002_4b2506e0 _price 350.00
wp post meta update $_3ST_002_4b2506e0 _regular_price 350.00
wp post meta update $_3ST_002_4b2506e0 _sku 3ST-002-4b2506e0
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_002_4b2506e0 --featured_image=true
_3ST_003_4b2606e1=`wp post create --post_title="maritime-walnut-003" --post_name="_3ST_XXX_30cb0621_003" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_003 --porcelain`
wp post meta update $_3ST_003_4b2606e1 _visibility visible
wp post meta update $_3ST_003_4b2606e1 attribute_edb_material 003
wp post meta update $_3ST_003_4b2606e1 _stock 2
wp post meta update $_3ST_003_4b2606e1 _stock_status instock
wp post meta update $_3ST_003_4b2606e1 _manage_stock yes
wp post meta update $_3ST_003_4b2606e1 _backorders yes
wp post meta update $_3ST_003_4b2606e1 _price 350.00
wp post meta update $_3ST_003_4b2606e1 _regular_price 350.00
wp post meta update $_3ST_003_4b2606e1 _sku 3ST-003-4b2606e1
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_003_4b2606e1 --featured_image=true
_3ST_004_4b2706e2=`wp post create --post_title="maritime-walnut-004" --post_name="_3ST_XXX_30cb0621_004" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_004 --porcelain`
wp post meta update $_3ST_004_4b2706e2 _visibility visible
wp post meta update $_3ST_004_4b2706e2 attribute_edb_material 004
wp post meta update $_3ST_004_4b2706e2 _stock 2
wp post meta update $_3ST_004_4b2706e2 _stock_status instock
wp post meta update $_3ST_004_4b2706e2 _manage_stock yes
wp post meta update $_3ST_004_4b2706e2 _backorders yes
wp post meta update $_3ST_004_4b2706e2 _price 350.00
wp post meta update $_3ST_004_4b2706e2 _regular_price 350.00
wp post meta update $_3ST_004_4b2706e2 _sku 3ST-004-4b2706e2
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_004_4b2706e2 --featured_image=true
_3ST_005_4b2806e3=`wp post create --post_title="maritime-walnut-005" --post_name="_3ST_XXX_30cb0621_005" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_005 --porcelain`
wp post meta update $_3ST_005_4b2806e3 _visibility visible
wp post meta update $_3ST_005_4b2806e3 attribute_edb_material 005
wp post meta update $_3ST_005_4b2806e3 _stock 2
wp post meta update $_3ST_005_4b2806e3 _stock_status instock
wp post meta update $_3ST_005_4b2806e3 _manage_stock yes
wp post meta update $_3ST_005_4b2806e3 _backorders yes
wp post meta update $_3ST_005_4b2806e3 _price 350.00
wp post meta update $_3ST_005_4b2806e3 _regular_price 350.00
wp post meta update $_3ST_005_4b2806e3 _sku 3ST-005-4b2806e3
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_005_4b2806e3 --featured_image=true
_3ST_006_4b2906e4=`wp post create --post_title="maritime-walnut-006" --post_name="_3ST_XXX_30cb0621_006" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_006 --porcelain`
wp post meta update $_3ST_006_4b2906e4 _visibility visible
wp post meta update $_3ST_006_4b2906e4 attribute_edb_material 006
wp post meta update $_3ST_006_4b2906e4 _stock 2
wp post meta update $_3ST_006_4b2906e4 _stock_status instock
wp post meta update $_3ST_006_4b2906e4 _manage_stock yes
wp post meta update $_3ST_006_4b2906e4 _backorders yes
wp post meta update $_3ST_006_4b2906e4 _price 350.00
wp post meta update $_3ST_006_4b2906e4 _regular_price 350.00
wp post meta update $_3ST_006_4b2906e4 _sku 3ST-006-4b2906e4
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_006_4b2906e4 --featured_image=true
_3ST_007_4b2a06e5=`wp post create --post_title="maritime-walnut-007" --post_name="_3ST_XXX_30cb0621_007" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_007 --porcelain`
wp post meta update $_3ST_007_4b2a06e5 _visibility visible
wp post meta update $_3ST_007_4b2a06e5 attribute_edb_material 007
wp post meta update $_3ST_007_4b2a06e5 _stock 2
wp post meta update $_3ST_007_4b2a06e5 _stock_status instock
wp post meta update $_3ST_007_4b2a06e5 _manage_stock yes
wp post meta update $_3ST_007_4b2a06e5 _backorders yes
wp post meta update $_3ST_007_4b2a06e5 _price 350.00
wp post meta update $_3ST_007_4b2a06e5 _regular_price 350.00
wp post meta update $_3ST_007_4b2a06e5 _sku 3ST-007-4b2a06e5
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_007_4b2a06e5 --featured_image=true
_3ST_008_4b2b06e6=`wp post create --post_title="maritime-walnut-008" --post_name="_3ST_XXX_30cb0621_008" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_008 --porcelain`
wp post meta update $_3ST_008_4b2b06e6 _visibility visible
wp post meta update $_3ST_008_4b2b06e6 attribute_edb_material 008
wp post meta update $_3ST_008_4b2b06e6 _stock 2
wp post meta update $_3ST_008_4b2b06e6 _stock_status instock
wp post meta update $_3ST_008_4b2b06e6 _manage_stock yes
wp post meta update $_3ST_008_4b2b06e6 _backorders yes
wp post meta update $_3ST_008_4b2b06e6 _price 350.00
wp post meta update $_3ST_008_4b2b06e6 _regular_price 350.00
wp post meta update $_3ST_008_4b2b06e6 _sku 3ST-008-4b2b06e6
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_008_4b2b06e6 --featured_image=true
_3ST_009_4b2c06e7=`wp post create --post_title="maritime-walnut-009" --post_name="_3ST_XXX_30cb0621_009" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_009 --porcelain`
wp post meta update $_3ST_009_4b2c06e7 _visibility visible
wp post meta update $_3ST_009_4b2c06e7 attribute_edb_material 009
wp post meta update $_3ST_009_4b2c06e7 _stock 2
wp post meta update $_3ST_009_4b2c06e7 _stock_status instock
wp post meta update $_3ST_009_4b2c06e7 _manage_stock yes
wp post meta update $_3ST_009_4b2c06e7 _backorders yes
wp post meta update $_3ST_009_4b2c06e7 _price 350.00
wp post meta update $_3ST_009_4b2c06e7 _regular_price 350.00
wp post meta update $_3ST_009_4b2c06e7 _sku 3ST-009-4b2c06e7
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_009_4b2c06e7 --featured_image=true
_3ST_010_4b2506df=`wp post create --post_title="maritime-walnut-010" --post_name="_3ST_XXX_30cb0621_010" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_010 --porcelain`
wp post meta update $_3ST_010_4b2506df _visibility visible
wp post meta update $_3ST_010_4b2506df attribute_edb_material 010
wp post meta update $_3ST_010_4b2506df _stock 2
wp post meta update $_3ST_010_4b2506df _stock_status instock
wp post meta update $_3ST_010_4b2506df _manage_stock yes
wp post meta update $_3ST_010_4b2506df _backorders yes
wp post meta update $_3ST_010_4b2506df _price 350.00
wp post meta update $_3ST_010_4b2506df _regular_price 350.00
wp post meta update $_3ST_010_4b2506df _sku 3ST-010-4b2506df
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_010_4b2506df --featured_image=true
_3ST_011_4b2606e0=`wp post create --post_title="maritime-walnut-011" --post_name="_3ST_XXX_30cb0621_011" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_011 --porcelain`
wp post meta update $_3ST_011_4b2606e0 _visibility visible
wp post meta update $_3ST_011_4b2606e0 attribute_edb_material 011
wp post meta update $_3ST_011_4b2606e0 _stock 2
wp post meta update $_3ST_011_4b2606e0 _stock_status instock
wp post meta update $_3ST_011_4b2606e0 _manage_stock yes
wp post meta update $_3ST_011_4b2606e0 _backorders yes
wp post meta update $_3ST_011_4b2606e0 _price 350.00
wp post meta update $_3ST_011_4b2606e0 _regular_price 350.00
wp post meta update $_3ST_011_4b2606e0 _sku 3ST-011-4b2606e0
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_011_4b2606e0 --featured_image=true
_3ST_012_4b2706e1=`wp post create --post_title="maritime-walnut-012" --post_name="_3ST_XXX_30cb0621_012" --post_parent=$_3ST_XXX_30cb0621 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=_3ST_XXX_30cb0621_012 --porcelain`
wp post meta update $_3ST_012_4b2706e1 _visibility visible
wp post meta update $_3ST_012_4b2706e1 attribute_edb_material 012
wp post meta update $_3ST_012_4b2706e1 _stock 2
wp post meta update $_3ST_012_4b2706e1 _stock_status instock
wp post meta update $_3ST_012_4b2706e1 _manage_stock yes
wp post meta update $_3ST_012_4b2706e1 _backorders yes
wp post meta update $_3ST_012_4b2706e1 _price 350.00
wp post meta update $_3ST_012_4b2706e1 _regular_price 350.00
wp post meta update $_3ST_012_4b2706e1 _sku 3ST-012-4b2706e1
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST_012_4b2706e1 --featured_image=true