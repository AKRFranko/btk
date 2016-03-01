#!/bin/bash
echo "Creating Product: nautique-green"
_PILXXX2b3505ab=`wp post create --post_title="nautique-green" --menu_order=48 --post_name="nautique_green_pilxxx2b3505ab" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: nautique-green"
wp post meta update $_PILXXX2b3505ab _visibility visible
wp post meta update $_PILXXX2b3505ab _product_attributes '{"edb_material":{"name":"edb_material","value":"106","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_PILXXX2b3505ab _price 15.00
wp post meta update $_PILXXX2b3505ab _regular_price 15.00
wp post term set $_PILXXX2b3505ab product_shipping_class accessories
wp post term set $_PILXXX2b3505ab product_cat accessories-pillows
wp post term set $_PILXXX2b3505ab product_type variable
wp media import ./data/products/48-nautique-green/gallery/nautique_green_0000_000.jpg --post_id=$_PILXXX2b3505ab --featured_image=true
_PILXXX2b3505ab_0=`wp media import ./data/products/48-nautique-green/gallery/nautique_green_0001_001.jpg --post_id=$_PILXXX2b3505ab --porcelain`
_PILXXX2b3505ab_1=`wp media import ./data/products/48-nautique-green/gallery/nautique_green_0000_002.jpg --post_id=$_PILXXX2b3505ab --porcelain`
wp post meta update $_PILXXX2b3505ab _product_image_gallery $_PILXXX2b3505ab_0,$_PILXXX2b3505ab_1
echo "Creating Variation: nautique-green-106"
_PIL10643be066f=`wp post create --post_title="nautique-green-106" --post_parent=$_PILXXX2b3505ab --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=nautique_green_pilxxx2b3505ab106 --porcelain`
echo "Setting meta for product: nautique-green-106 Variation: 106"
wp post meta update $_PIL10643be066f _visibility visible
wp post meta update $_PIL10643be066f attribute_edb_material 106
wp post meta update $_PIL10643be066f _stock 2
wp post meta update $_PIL10643be066f _stock_status instock
wp post meta update $_PIL10643be066f _manage_stock yes
wp post meta update $_PIL10643be066f _backorders yes
wp post meta update $_PIL10643be066f _price 15.00
wp post meta update $_PIL10643be066f _regular_price 15.00
wp post meta update $_PIL10643be066f _sku PIL10643be066f
wp media import ./data/products/48-nautique-green/gallery/nautique_green_0000_000.jpg --post_id=$_PIL10643be066f --featured_image=true
echo "Creating Product: nautique-white"
_PILXXX2b7e05bb=`wp post create --post_title="nautique-white" --menu_order=47 --post_name="nautique_white_pilxxx2b7e05bb" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: nautique-white"
wp post meta update $_PILXXX2b7e05bb _visibility visible
wp post meta update $_PILXXX2b7e05bb _product_attributes '{"edb_material":{"name":"edb_material","value":"105","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_PILXXX2b7e05bb _price 15.00
wp post meta update $_PILXXX2b7e05bb _regular_price 15.00
wp post term set $_PILXXX2b7e05bb product_shipping_class accessories
wp post term set $_PILXXX2b7e05bb product_cat accessories-pillows
wp post term set $_PILXXX2b7e05bb product_type variable
wp media import ./data/products/47-nautique-white/gallery/nautique_white_0000_000.jpg --post_id=$_PILXXX2b7e05bb --featured_image=true
_PILXXX2b7e05bb_0=`wp media import ./data/products/47-nautique-white/gallery/nautique_white_0001_001.jpg --post_id=$_PILXXX2b7e05bb --porcelain`
_PILXXX2b7e05bb_1=`wp media import ./data/products/47-nautique-white/gallery/nautique_white_0000_002.jpg --post_id=$_PILXXX2b7e05bb --porcelain`
wp post meta update $_PILXXX2b7e05bb _product_image_gallery $_PILXXX2b7e05bb_0,$_PILXXX2b7e05bb_1
echo "Creating Variation: nautique-white-105"
_PIL1054446067e=`wp post create --post_title="nautique-white-105" --post_parent=$_PILXXX2b7e05bb --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=nautique_white_pilxxx2b7e05bb105 --porcelain`
echo "Setting meta for product: nautique-white-105 Variation: 105"
wp post meta update $_PIL1054446067e _visibility visible
wp post meta update $_PIL1054446067e attribute_edb_material 105
wp post meta update $_PIL1054446067e _stock 2
wp post meta update $_PIL1054446067e _stock_status instock
wp post meta update $_PIL1054446067e _manage_stock yes
wp post meta update $_PIL1054446067e _backorders yes
wp post meta update $_PIL1054446067e _price 15.00
wp post meta update $_PIL1054446067e _regular_price 15.00
wp post meta update $_PIL1054446067e _sku PIL1054446067e
wp media import ./data/products/47-nautique-white/gallery/nautique_white_0000_000.jpg --post_id=$_PIL1054446067e --featured_image=true
echo "Creating Product: majuscule-orange"
_PILXXX37870673=`wp post create --post_title="majuscule-orange" --menu_order=46 --post_name="majuscule_orange_pilxxx37870673" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: majuscule-orange"
wp post meta update $_PILXXX37870673 _visibility visible
wp post meta update $_PILXXX37870673 _product_attributes '{"edb_material":{"name":"edb_material","value":"104","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_PILXXX37870673 _price 15.00
wp post meta update $_PILXXX37870673 _regular_price 15.00
wp post term set $_PILXXX37870673 product_shipping_class accessories
wp post term set $_PILXXX37870673 product_cat accessories-pillows
wp post term set $_PILXXX37870673 product_type variable
wp media import ./data/products/46-majuscule-orange/gallery/majuscule_orange_0000_000.jpg --post_id=$_PILXXX37870673 --featured_image=true
_PILXXX37870673_0=`wp media import ./data/products/46-majuscule-orange/gallery/majuscule_orange_0000_001.jpg --post_id=$_PILXXX37870673 --porcelain`
_PILXXX37870673_1=`wp media import ./data/products/46-majuscule-orange/gallery/majuscule_orange_0001_002.jpg --post_id=$_PILXXX37870673 --porcelain`
_PILXXX37870673_2=`wp media import ./data/products/46-majuscule-orange/gallery/majuscule_orange_0002_003.jpg --post_id=$_PILXXX37870673 --porcelain`
_PILXXX37870673_3=`wp media import ./data/products/46-majuscule-orange/gallery/majuscule_orange_0003_004.jpg --post_id=$_PILXXX37870673 --porcelain`
wp post meta update $_PILXXX37870673 _product_image_gallery $_PILXXX37870673_0,$_PILXXX37870673_1,$_PILXXX37870673_2,$_PILXXX37870673_3
echo "Creating Variation: majuscule-orange-104"
_PIL104532e0735=`wp post create --post_title="majuscule-orange-104" --post_parent=$_PILXXX37870673 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=majuscule_orange_pilxxx37870673104 --porcelain`
echo "Setting meta for product: majuscule-orange-104 Variation: 104"
wp post meta update $_PIL104532e0735 _visibility visible
wp post meta update $_PIL104532e0735 attribute_edb_material 104
wp post meta update $_PIL104532e0735 _stock 2
wp post meta update $_PIL104532e0735 _stock_status instock
wp post meta update $_PIL104532e0735 _manage_stock yes
wp post meta update $_PIL104532e0735 _backorders yes
wp post meta update $_PIL104532e0735 _price 15.00
wp post meta update $_PIL104532e0735 _regular_price 15.00
wp post meta update $_PIL104532e0735 _sku PIL104532e0735
wp media import ./data/products/46-majuscule-orange/gallery/majuscule_orange_0000_000.jpg --post_id=$_PIL104532e0735 --featured_image=true
echo "Creating Product: majuscule-pink"
_PILXXX2b0605a9=`wp post create --post_title="majuscule-pink" --menu_order=45 --post_name="majuscule_pink_pilxxx2b0605a9" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: majuscule-pink"
wp post meta update $_PILXXX2b0605a9 _visibility visible
wp post meta update $_PILXXX2b0605a9 _product_attributes '{"edb_material":{"name":"edb_material","value":"103","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_PILXXX2b0605a9 _price 15.00
wp post meta update $_PILXXX2b0605a9 _regular_price 15.00
wp post term set $_PILXXX2b0605a9 product_shipping_class accessories
wp post term set $_PILXXX2b0605a9 product_cat accessories-pillows
wp post term set $_PILXXX2b0605a9 product_type variable
wp media import ./data/products/45-majuscule-pink/gallery/majuscule_yellow_0001_000.jpg --post_id=$_PILXXX2b0605a9 --featured_image=true
_PILXXX2b0605a9_0=`wp media import ./data/products/45-majuscule-pink/gallery/majuscule_yellow_0000_001.jpg --post_id=$_PILXXX2b0605a9 --porcelain`
_PILXXX2b0605a9_1=`wp media import ./data/products/45-majuscule-pink/gallery/majuscule_yellow_0001_002.jpg --post_id=$_PILXXX2b0605a9 --porcelain`
_PILXXX2b0605a9_2=`wp media import ./data/products/45-majuscule-pink/gallery/majuscule_yellow_0002_003.jpg --post_id=$_PILXXX2b0605a9 --porcelain`
_PILXXX2b0605a9_3=`wp media import ./data/products/45-majuscule-pink/gallery/majuscule_yellow_0003_004.jpg --post_id=$_PILXXX2b0605a9 --porcelain`
wp post meta update $_PILXXX2b0605a9 _product_image_gallery $_PILXXX2b0605a9_0,$_PILXXX2b0605a9_1,$_PILXXX2b0605a9_2,$_PILXXX2b0605a9_3
echo "Creating Variation: majuscule-pink-103"
_PIL1034384066a=`wp post create --post_title="majuscule-pink-103" --post_parent=$_PILXXX2b0605a9 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=majuscule_pink_pilxxx2b0605a9103 --porcelain`
echo "Setting meta for product: majuscule-pink-103 Variation: 103"
wp post meta update $_PIL1034384066a _visibility visible
wp post meta update $_PIL1034384066a attribute_edb_material 103
wp post meta update $_PIL1034384066a _stock 2
wp post meta update $_PIL1034384066a _stock_status instock
wp post meta update $_PIL1034384066a _manage_stock yes
wp post meta update $_PIL1034384066a _backorders yes
wp post meta update $_PIL1034384066a _price 15.00
wp post meta update $_PIL1034384066a _regular_price 15.00
wp post meta update $_PIL1034384066a _sku PIL1034384066a
wp media import ./data/products/45-majuscule-pink/gallery/majuscule_yellow_0001_000.jpg --post_id=$_PIL1034384066a --featured_image=true
echo "Creating Product: majuscule-blue"
_PILXXX2adf059f=`wp post create --post_title="majuscule-blue" --menu_order=44 --post_name="majuscule_blue_pilxxx2adf059f" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: majuscule-blue"
wp post meta update $_PILXXX2adf059f _visibility visible
wp post meta update $_PILXXX2adf059f _product_attributes '{"edb_material":{"name":"edb_material","value":"102","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_PILXXX2adf059f _price 15.00
wp post meta update $_PILXXX2adf059f _regular_price 15.00
wp post term set $_PILXXX2adf059f product_shipping_class accessories
wp post term set $_PILXXX2adf059f product_cat accessories-pillows
wp post term set $_PILXXX2adf059f product_type variable
wp media import ./data/products/44-majuscule-blue/gallery/majuscule_blue_0001_000.jpg --post_id=$_PILXXX2adf059f --featured_image=true
_PILXXX2adf059f_0=`wp media import ./data/products/44-majuscule-blue/gallery/majuscule_blue_0000_001.jpg --post_id=$_PILXXX2adf059f --porcelain`
_PILXXX2adf059f_1=`wp media import ./data/products/44-majuscule-blue/gallery/majuscule_blue_0001_002.jpg --post_id=$_PILXXX2adf059f --porcelain`
_PILXXX2adf059f_2=`wp media import ./data/products/44-majuscule-blue/gallery/majuscule_blue_0002_003.jpg --post_id=$_PILXXX2adf059f --porcelain`
_PILXXX2adf059f_3=`wp media import ./data/products/44-majuscule-blue/gallery/majuscule_blue_0003_004.jpg --post_id=$_PILXXX2adf059f --porcelain`
wp post meta update $_PILXXX2adf059f _product_image_gallery $_PILXXX2adf059f_0,$_PILXXX2adf059f_1,$_PILXXX2adf059f_2,$_PILXXX2adf059f_3
echo "Creating Variation: majuscule-blue-102"
_PIL1024334065f=`wp post create --post_title="majuscule-blue-102" --post_parent=$_PILXXX2adf059f --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=majuscule_blue_pilxxx2adf059f102 --porcelain`
echo "Setting meta for product: majuscule-blue-102 Variation: 102"
wp post meta update $_PIL1024334065f _visibility visible
wp post meta update $_PIL1024334065f attribute_edb_material 102
wp post meta update $_PIL1024334065f _stock 2
wp post meta update $_PIL1024334065f _stock_status instock
wp post meta update $_PIL1024334065f _manage_stock yes
wp post meta update $_PIL1024334065f _backorders yes
wp post meta update $_PIL1024334065f _price 15.00
wp post meta update $_PIL1024334065f _regular_price 15.00
wp post meta update $_PIL1024334065f _sku PIL1024334065f
wp media import ./data/products/44-majuscule-blue/gallery/majuscule_blue_0001_000.jpg --post_id=$_PIL1024334065f --featured_image=true
echo "Creating Product: mutation"
_PILXXX0f970372=`wp post create --post_title="mutation" --menu_order=43 --post_name="mutation_pilxxx0f970372" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: mutation"
wp post meta update $_PILXXX0f970372 _visibility visible
wp post meta update $_PILXXX0f970372 _product_attributes '{"edb_material":{"name":"edb_material","value":"101","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_PILXXX0f970372 _price 15.00
wp post meta update $_PILXXX0f970372 _regular_price 15.00
wp post term set $_PILXXX0f970372 product_shipping_class accessories
wp post term set $_PILXXX0f970372 product_cat accessories-pillows
wp post term set $_PILXXX0f970372 product_type variable
wp media import ./data/products/43-mutation/gallery/mutation_0000_000.jpg --post_id=$_PILXXX0f970372 --featured_image=true
_PILXXX0f970372_0=`wp media import ./data/products/43-mutation/gallery/mutation_0001_001.jpg --post_id=$_PILXXX0f970372 --porcelain`
_PILXXX0f970372_1=`wp media import ./data/products/43-mutation/gallery/mutation_0000_002.jpg --post_id=$_PILXXX0f970372 --porcelain`
wp post meta update $_PILXXX0f970372 _product_image_gallery $_PILXXX0f970372_0,$_PILXXX0f970372_1
echo "Creating Variation: mutation-101"
_PIL1011f370431=`wp post create --post_title="mutation-101" --post_parent=$_PILXXX0f970372 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mutation_pilxxx0f970372101 --porcelain`
echo "Setting meta for product: mutation-101 Variation: 101"
wp post meta update $_PIL1011f370431 _visibility visible
wp post meta update $_PIL1011f370431 attribute_edb_material 101
wp post meta update $_PIL1011f370431 _stock 2
wp post meta update $_PIL1011f370431 _stock_status instock
wp post meta update $_PIL1011f370431 _manage_stock yes
wp post meta update $_PIL1011f370431 _backorders yes
wp post meta update $_PIL1011f370431 _price 15.00
wp post meta update $_PIL1011f370431 _regular_price 15.00
wp post meta update $_PIL1011f370431 _sku PIL1011f370431
wp media import ./data/products/43-mutation/gallery/mutation_0000_000.jpg --post_id=$_PIL1011f370431 --featured_image=true
echo "Creating Product: vintage"
_TABXXX0c0302ef=`wp post create --post_title="vintage" --menu_order=42 --post_name="vintage_tabxxx0c0302ef" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: vintage"
wp post meta update $_TABXXX0c0302ef _subtitle "{:en}white{:}{:fr}white{:}"
wp post meta update $_TABXXX0c0302ef _visibility visible
wp post meta update $_TABXXX0c0302ef _product_attributes '{"edb_material":{"name":"edb_material","value":"063","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX0c0302ef _price 350.00
wp post meta update $_TABXXX0c0302ef _regular_price 350.00
wp post term set $_TABXXX0c0302ef product_shipping_class furniture
wp post term set $_TABXXX0c0302ef product_cat side-tables
wp post term set $_TABXXX0c0302ef product_type variable
wp post meta update $_TABXXX0c0302ef _subtitle "{:en}white{:}{:fr}white{:}"
wp media import ./data/products/42-vintage_white/gallery/vintage_white_0002_000.jpg --post_id=$_TABXXX0c0302ef --featured_image=true
_TABXXX0c0302ef_0=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0000_001.jpg --post_id=$_TABXXX0c0302ef --porcelain`
_TABXXX0c0302ef_1=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0001_002.jpg --post_id=$_TABXXX0c0302ef --porcelain`
_TABXXX0c0302ef_2=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0002_003.jpg --post_id=$_TABXXX0c0302ef --porcelain`
_TABXXX0c0302ef_3=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0003_004.jpg --post_id=$_TABXXX0c0302ef --porcelain`
_TABXXX0c0302ef_4=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0004_005.jpg --post_id=$_TABXXX0c0302ef --porcelain`
_TABXXX0c0302ef_5=`wp media import ./data/products/42-vintage_white/gallery/vintage_white_0005_006.jpg --post_id=$_TABXXX0c0302ef --porcelain`
wp post meta update $_TABXXX0c0302ef _product_image_gallery $_TABXXX0c0302ef_0,$_TABXXX0c0302ef_1,$_TABXXX0c0302ef_2,$_TABXXX0c0302ef_3,$_TABXXX0c0302ef_4,$_TABXXX0c0302ef_5
echo "Creating Variation: vintage-063"
_TAB06319a203b5=`wp post create --post_title="vintage-063" --post_parent=$_TABXXX0c0302ef --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=vintage_tabxxx0c0302ef063 --porcelain`
echo "Setting meta for product: vintage-063 Variation: 063"
wp post meta update $_TAB06319a203b5 _visibility visible
wp post meta update $_TAB06319a203b5 attribute_edb_material 063
wp post meta update $_TAB06319a203b5 _stock 2
wp post meta update $_TAB06319a203b5 _stock_status instock
wp post meta update $_TAB06319a203b5 _manage_stock yes
wp post meta update $_TAB06319a203b5 _backorders yes
wp post meta update $_TAB06319a203b5 _price 350.00
wp post meta update $_TAB06319a203b5 _regular_price 350.00
wp post meta update $_TAB06319a203b5 _sku TAB06319a203b5
wp media import ./data/products/42-vintage_white/gallery/vintage_white_0002_000.jpg --post_id=$_TAB06319a203b5 --featured_image=true
echo "Creating Product: t-table"
_TABXXX0a6c02aa=`wp post create --post_title="t-table" --menu_order=41 --post_name="t_table_tabxxx0a6c02aa" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: t-table"
wp post meta update $_TABXXX0a6c02aa _subtitle "{:en}yellow{:}{:fr}yellow{:}"
wp post meta update $_TABXXX0a6c02aa _visibility visible
wp post meta update $_TABXXX0a6c02aa _product_attributes '{"edb_material":{"name":"edb_material","value":"062","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX0a6c02aa _price 350.00
wp post meta update $_TABXXX0a6c02aa _regular_price 350.00
wp post term set $_TABXXX0a6c02aa product_shipping_class furniture
wp post term set $_TABXXX0a6c02aa product_cat side-tables
wp post term set $_TABXXX0a6c02aa product_type variable
wp post meta update $_TABXXX0a6c02aa _subtitle "{:en}yellow{:}{:fr}yellow{:}"
wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_000.jpg --post_id=$_TABXXX0a6c02aa --featured_image=true
_TABXXX0a6c02aa_0=`wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_0000_001.jpg --post_id=$_TABXXX0a6c02aa --porcelain`
_TABXXX0a6c02aa_1=`wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_0001_002.jpg --post_id=$_TABXXX0a6c02aa --porcelain`
_TABXXX0a6c02aa_2=`wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_0002_003.jpg --post_id=$_TABXXX0a6c02aa --porcelain`
_TABXXX0a6c02aa_3=`wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_0003_004.jpg --post_id=$_TABXXX0a6c02aa --porcelain`
_TABXXX0a6c02aa_4=`wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_0004_005.jpg --post_id=$_TABXXX0a6c02aa --porcelain`
wp post meta update $_TABXXX0a6c02aa _product_image_gallery $_TABXXX0a6c02aa_0,$_TABXXX0a6c02aa_1,$_TABXXX0a6c02aa_2,$_TABXXX0a6c02aa_3,$_TABXXX0a6c02aa_4
echo "Creating Variation: t-table-062"
_TAB06216f6036f=`wp post create --post_title="t-table-062" --post_parent=$_TABXXX0a6c02aa --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=t_table_tabxxx0a6c02aa062 --porcelain`
echo "Setting meta for product: t-table-062 Variation: 062"
wp post meta update $_TAB06216f6036f _visibility visible
wp post meta update $_TAB06216f6036f attribute_edb_material 062
wp post meta update $_TAB06216f6036f _stock 2
wp post meta update $_TAB06216f6036f _stock_status instock
wp post meta update $_TAB06216f6036f _manage_stock yes
wp post meta update $_TAB06216f6036f _backorders yes
wp post meta update $_TAB06216f6036f _price 350.00
wp post meta update $_TAB06216f6036f _regular_price 350.00
wp post meta update $_TAB06216f6036f _sku TAB06216f6036f
wp media import ./data/products/41-t-table_yellow/gallery/t_table_yellow_000.jpg --post_id=$_TAB06216f6036f --featured_image=true
echo "Creating Product: perplexe-smoke"
_TABXXX2b4805b2=`wp post create --post_title="perplexe-smoke" --menu_order=38 --post_name="perplexe_smoke_tabxxx2b4805b2" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: perplexe-smoke"
wp post meta update $_TABXXX2b4805b2 _visibility visible
wp post meta update $_TABXXX2b4805b2 _product_attributes '{"edb_material":{"name":"edb_material","value":"059","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX2b4805b2 _price 350.00
wp post meta update $_TABXXX2b4805b2 _regular_price 350.00
wp post term set $_TABXXX2b4805b2 product_shipping_class furniture
wp post term set $_TABXXX2b4805b2 product_cat side-tables
wp post term set $_TABXXX2b4805b2 product_type variable
wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_000.jpg --post_id=$_TABXXX2b4805b2 --featured_image=true
_TABXXX2b4805b2_0=`wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_0000_001.jpg --post_id=$_TABXXX2b4805b2 --porcelain`
_TABXXX2b4805b2_1=`wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_0001_002.jpg --post_id=$_TABXXX2b4805b2 --porcelain`
_TABXXX2b4805b2_2=`wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_0002_003.jpg --post_id=$_TABXXX2b4805b2 --porcelain`
_TABXXX2b4805b2_3=`wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_0003_004.jpg --post_id=$_TABXXX2b4805b2 --porcelain`
wp post meta update $_TABXXX2b4805b2 _product_image_gallery $_TABXXX2b4805b2_0,$_TABXXX2b4805b2_1,$_TABXXX2b4805b2_2,$_TABXXX2b4805b2_3
echo "Creating Variation: perplexe-smoke-059"
_TAB05943f7067d=`wp post create --post_title="perplexe-smoke-059" --post_parent=$_TABXXX2b4805b2 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=perplexe_smoke_tabxxx2b4805b2059 --porcelain`
echo "Setting meta for product: perplexe-smoke-059 Variation: 059"
wp post meta update $_TAB05943f7067d _visibility visible
wp post meta update $_TAB05943f7067d attribute_edb_material 059
wp post meta update $_TAB05943f7067d _stock 2
wp post meta update $_TAB05943f7067d _stock_status instock
wp post meta update $_TAB05943f7067d _manage_stock yes
wp post meta update $_TAB05943f7067d _backorders yes
wp post meta update $_TAB05943f7067d _price 350.00
wp post meta update $_TAB05943f7067d _regular_price 350.00
wp post meta update $_TAB05943f7067d _sku TAB05943f7067d
wp media import ./data/products/38-perplexe_smoke/gallery/perplexe_smoke_000.jpg --post_id=$_TAB05943f7067d --featured_image=true
echo "Creating Product: perplexe-pink"
_TABXXX257c0545=`wp post create --post_title="perplexe-pink" --menu_order=37 --post_name="perplexe_pink_tabxxx257c0545" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: perplexe-pink"
wp post meta update $_TABXXX257c0545 _visibility visible
wp post meta update $_TABXXX257c0545 _product_attributes '{"edb_material":{"name":"edb_material","value":"058","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX257c0545 _price 350.00
wp post meta update $_TABXXX257c0545 _regular_price 350.00
wp post term set $_TABXXX257c0545 product_shipping_class furniture
wp post term set $_TABXXX257c0545 product_cat side-tables
wp post term set $_TABXXX257c0545 product_type variable
wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_000.jpg --post_id=$_TABXXX257c0545 --featured_image=true
_TABXXX257c0545_0=`wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_0000_001.jpg --post_id=$_TABXXX257c0545 --porcelain`
_TABXXX257c0545_1=`wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_0001_002.jpg --post_id=$_TABXXX257c0545 --porcelain`
_TABXXX257c0545_2=`wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_0002_003.jpg --post_id=$_TABXXX257c0545 --porcelain`
_TABXXX257c0545_3=`wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_0003_004.jpg --post_id=$_TABXXX257c0545 --porcelain`
_TABXXX257c0545_4=`wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_0004_005.jpg --post_id=$_TABXXX257c0545 --porcelain`
wp post meta update $_TABXXX257c0545 _product_image_gallery $_TABXXX257c0545_0,$_TABXXX257c0545_1,$_TABXXX257c0545_2,$_TABXXX257c0545_3,$_TABXXX257c0545_4
echo "Creating Variation: perplexe-pink-058"
_TAB0583c76060f=`wp post create --post_title="perplexe-pink-058" --post_parent=$_TABXXX257c0545 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=perplexe_pink_tabxxx257c0545058 --porcelain`
echo "Setting meta for product: perplexe-pink-058 Variation: 058"
wp post meta update $_TAB0583c76060f _visibility visible
wp post meta update $_TAB0583c76060f attribute_edb_material 058
wp post meta update $_TAB0583c76060f _stock 2
wp post meta update $_TAB0583c76060f _stock_status instock
wp post meta update $_TAB0583c76060f _manage_stock yes
wp post meta update $_TAB0583c76060f _backorders yes
wp post meta update $_TAB0583c76060f _price 350.00
wp post meta update $_TAB0583c76060f _regular_price 350.00
wp post meta update $_TAB0583c76060f _sku TAB0583c76060f
wp media import ./data/products/37-perplexe_pink/gallery/perplexe_pink_000.jpg --post_id=$_TAB0583c76060f --featured_image=true
echo "Creating Product: perplexe-azure"
_TABXXX2b4205ba=`wp post create --post_title="perplexe-azure" --menu_order=36 --post_name="perplexe_azure_tabxxx2b4205ba" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: perplexe-azure"
wp post meta update $_TABXXX2b4205ba _visibility visible
wp post meta update $_TABXXX2b4205ba _product_attributes '{"edb_material":{"name":"edb_material","value":"057","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX2b4205ba _price 350.00
wp post meta update $_TABXXX2b4205ba _regular_price 350.00
wp post term set $_TABXXX2b4205ba product_shipping_class furniture
wp post term set $_TABXXX2b4205ba product_cat side-tables
wp post term set $_TABXXX2b4205ba product_type variable
wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_000.jpg --post_id=$_TABXXX2b4205ba --featured_image=true
_TABXXX2b4205ba_0=`wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_0000_001.jpg --post_id=$_TABXXX2b4205ba --porcelain`
_TABXXX2b4205ba_1=`wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_0001_002.jpg --post_id=$_TABXXX2b4205ba --porcelain`
_TABXXX2b4205ba_2=`wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_0002_003.jpg --post_id=$_TABXXX2b4205ba --porcelain`
_TABXXX2b4205ba_3=`wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_0003_004.jpg --post_id=$_TABXXX2b4205ba --porcelain`
_TABXXX2b4205ba_4=`wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_0004_005.jpg --post_id=$_TABXXX2b4205ba --porcelain`
wp post meta update $_TABXXX2b4205ba _product_image_gallery $_TABXXX2b4205ba_0,$_TABXXX2b4205ba_1,$_TABXXX2b4205ba_2,$_TABXXX2b4205ba_3,$_TABXXX2b4205ba_4
echo "Creating Variation: perplexe-azure-057"
_TAB057440f0683=`wp post create --post_title="perplexe-azure-057" --post_parent=$_TABXXX2b4205ba --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=perplexe_azure_tabxxx2b4205ba057 --porcelain`
echo "Setting meta for product: perplexe-azure-057 Variation: 057"
wp post meta update $_TAB057440f0683 _visibility visible
wp post meta update $_TAB057440f0683 attribute_edb_material 057
wp post meta update $_TAB057440f0683 _stock 2
wp post meta update $_TAB057440f0683 _stock_status instock
wp post meta update $_TAB057440f0683 _manage_stock yes
wp post meta update $_TAB057440f0683 _backorders yes
wp post meta update $_TAB057440f0683 _price 350.00
wp post meta update $_TAB057440f0683 _regular_price 350.00
wp post meta update $_TAB057440f0683 _sku TAB057440f0683
wp media import ./data/products/36-perplexe_azure/gallery/perplexe_azure_000.jpg --post_id=$_TAB057440f0683 --featured_image=true
echo "Creating Product: tamtam"
_TABXXX08e20285=`wp post create --post_title="tamtam" --menu_order=35 --post_name="tamtam_tabxxx08e20285" --post_content='{:en}Just like candy. Giving a specific function to the Tamtam is hard. It can serve as a side table, night stand, coffee table, stool, plant stool, or simply a visual candy in any space. Made of natural rattan by hand and offered is 6 happy colors, the Tamtam will delight any landscape. The handle add extra functionality. Up to you to find its best use.{:}{:fr}La cerise sur le gâteau. Tamtam ne possède aucune fonction spécifique. Il peut servir de table de bout, de chevet, de tabouret, de porte-plante ou de simple élément visuel à admirer. Il est confectionné à la main en rotin naturel, en six couleurs bonne humeur. Sa poignée ajoute une petite note de fonctionnalité. Quel usage en ferez-vous dans votre espace?{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: tamtam"
wp post meta update $_TABXXX08e20285 _subtitle "{:en}pink{:}{:fr}pink{:}"
wp post meta update $_TABXXX08e20285 _visibility visible
wp post meta update $_TABXXX08e20285 _product_attributes '{"edb_material":{"name":"edb_material","value":"056","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX08e20285 _price 350.00
wp post meta update $_TABXXX08e20285 _regular_price 350.00
wp post term set $_TABXXX08e20285 product_shipping_class furniture
wp post term set $_TABXXX08e20285 product_cat side-tables
wp post term set $_TABXXX08e20285 product_type variable
wp post meta update $_TABXXX08e20285 _subtitle "{:en}pink{:}{:fr}pink{:}"
wp media import ./data/products/35-tamtam_pink/gallery/tamtam_pink_0000_000.jpg --post_id=$_TABXXX08e20285 --featured_image=true
_TABXXX08e20285_0=`wp media import ./data/products/35-tamtam_pink/gallery/tamtam_pink_0001_002.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_1=`wp media import ./data/products/35-tamtam_pink/gallery/tamtam_pink_0002_003.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_2=`wp media import ./data/products/35-tamtam_pink/gallery/tamtam_pink_0000_004.jpg --post_id=$_TABXXX08e20285 --porcelain`
wp post meta update $_TABXXX08e20285 _product_image_gallery $_TABXXX08e20285_0,$_TABXXX08e20285_1,$_TABXXX08e20285_2
echo "Creating Variation: tamtam-056"
_TAB05614da034d=`wp post create --post_title="tamtam-056" --post_parent=$_TABXXX08e20285 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=tamtam_tabxxx08e20285056 --porcelain`
echo "Setting meta for product: tamtam-056 Variation: 056"
wp post meta update $_TAB05614da034d _visibility visible
wp post meta update $_TAB05614da034d attribute_edb_material 056
wp post meta update $_TAB05614da034d _stock 2
wp post meta update $_TAB05614da034d _stock_status instock
wp post meta update $_TAB05614da034d _manage_stock yes
wp post meta update $_TAB05614da034d _backorders yes
wp post meta update $_TAB05614da034d _price 350.00
wp post meta update $_TAB05614da034d _regular_price 350.00
wp post meta update $_TAB05614da034d _sku TAB05614da034d
wp media import ./data/products/35-tamtam_pink/gallery/tamtam_pink_0000_000.jpg --post_id=$_TAB05614da034d --featured_image=true
echo "Creating Product: tamtam"
_TABXXX08e20285=`wp post create --post_title="tamtam" --menu_order=34 --post_name="tamtam_tabxxx08e20285" --post_content='{:en}Just like candy. Giving a specific function to the Tamtam is hard. It can serve as a side table, night stand, coffee table, stool, plant stool, or simply a visual candy in any space. Made of natural rattan by hand and offered is 6 happy colors, the Tamtam will delight any landscape. The handle add extra functionality. Up to you to find its best use.{:}{:fr}La cerise sur le gâteau. Tamtam ne possède aucune fonction spécifique. Il peut servir de table de bout, de chevet, de tabouret, de porte-plante ou de simple élément visuel à admirer. Il est confectionné à la main en rotin naturel, en six couleurs bonne humeur. Sa poignée ajoute une petite note de fonctionnalité. Quel usage en ferez-vous dans votre espace?{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: tamtam"
wp post meta update $_TABXXX08e20285 _subtitle "{:en}blue{:}{:fr}blue{:}"
wp post meta update $_TABXXX08e20285 _visibility visible
wp post meta update $_TABXXX08e20285 _product_attributes '{"edb_material":{"name":"edb_material","value":"055","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX08e20285 _price 350.00
wp post meta update $_TABXXX08e20285 _regular_price 350.00
wp post term set $_TABXXX08e20285 product_shipping_class furniture
wp post term set $_TABXXX08e20285 product_cat side-tables
wp post term set $_TABXXX08e20285 product_type variable
wp post meta update $_TABXXX08e20285 _subtitle "{:en}blue{:}{:fr}blue{:}"
wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0000_000.jpg --post_id=$_TABXXX08e20285 --featured_image=true
_TABXXX08e20285_0=`wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0001_002.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_1=`wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0002_003.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_2=`wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0003_004.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_3=`wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0000_005.jpg --post_id=$_TABXXX08e20285 --porcelain`
wp post meta update $_TABXXX08e20285 _product_image_gallery $_TABXXX08e20285_0,$_TABXXX08e20285_1,$_TABXXX08e20285_2,$_TABXXX08e20285_3
echo "Creating Variation: tamtam-055"
_TAB05514d9034c=`wp post create --post_title="tamtam-055" --post_parent=$_TABXXX08e20285 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=tamtam_tabxxx08e20285055 --porcelain`
echo "Setting meta for product: tamtam-055 Variation: 055"
wp post meta update $_TAB05514d9034c _visibility visible
wp post meta update $_TAB05514d9034c attribute_edb_material 055
wp post meta update $_TAB05514d9034c _stock 2
wp post meta update $_TAB05514d9034c _stock_status instock
wp post meta update $_TAB05514d9034c _manage_stock yes
wp post meta update $_TAB05514d9034c _backorders yes
wp post meta update $_TAB05514d9034c _price 350.00
wp post meta update $_TAB05514d9034c _regular_price 350.00
wp post meta update $_TAB05514d9034c _sku TAB05514d9034c
wp media import ./data/products/34-tamtam_blue/gallery/tamtam_blue_0000_000.jpg --post_id=$_TAB05514d9034c --featured_image=true
echo "Creating Product: tamtam"
_TABXXX08e20285=`wp post create --post_title="tamtam" --menu_order=33 --post_name="tamtam_tabxxx08e20285" --post_content='{:en}Just like candy. Giving a specific function to the Tamtam is hard. It can serve as a side table, night stand, coffee table, stool, plant stool, or simply a visual candy in any space. Made of natural rattan by hand and offered is 6 happy colors, the Tamtam will delight any landscape. The handle add extra functionality. Up to you to find its best use.{:}{:fr}La cerise sur le gâteau. Tamtam ne possède aucune fonction spécifique. Il peut servir de table de bout, de chevet, de tabouret, de porte-plante ou de simple élément visuel à admirer. Il est confectionné à la main en rotin naturel, en six couleurs bonne humeur. Sa poignée ajoute une petite note de fonctionnalité. Quel usage en ferez-vous dans votre espace?{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: tamtam"
wp post meta update $_TABXXX08e20285 _subtitle "{:en}grey{:}{:fr}grey{:}"
wp post meta update $_TABXXX08e20285 _visibility visible
wp post meta update $_TABXXX08e20285 _product_attributes '{"edb_material":{"name":"edb_material","value":"054","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX08e20285 _price 350.00
wp post meta update $_TABXXX08e20285 _regular_price 350.00
wp post term set $_TABXXX08e20285 product_shipping_class furniture
wp post term set $_TABXXX08e20285 product_cat side-tables
wp post term set $_TABXXX08e20285 product_type variable
wp post meta update $_TABXXX08e20285 _subtitle "{:en}grey{:}{:fr}grey{:}"
wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_000.jpg --post_id=$_TABXXX08e20285 --featured_image=true
_TABXXX08e20285_0=`wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_0001_002.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_1=`wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_0002_003.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_2=`wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_0003_004.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_3=`wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_000_005.jpg --post_id=$_TABXXX08e20285 --porcelain`
wp post meta update $_TABXXX08e20285 _product_image_gallery $_TABXXX08e20285_0,$_TABXXX08e20285_1,$_TABXXX08e20285_2,$_TABXXX08e20285_3
echo "Creating Variation: tamtam-054"
_TAB05414d8034b=`wp post create --post_title="tamtam-054" --post_parent=$_TABXXX08e20285 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=tamtam_tabxxx08e20285054 --porcelain`
echo "Setting meta for product: tamtam-054 Variation: 054"
wp post meta update $_TAB05414d8034b _visibility visible
wp post meta update $_TAB05414d8034b attribute_edb_material 054
wp post meta update $_TAB05414d8034b _stock 2
wp post meta update $_TAB05414d8034b _stock_status instock
wp post meta update $_TAB05414d8034b _manage_stock yes
wp post meta update $_TAB05414d8034b _backorders yes
wp post meta update $_TAB05414d8034b _price 350.00
wp post meta update $_TAB05414d8034b _regular_price 350.00
wp post meta update $_TAB05414d8034b _sku TAB05414d8034b
wp media import ./data/products/33-tamtam_grey/gallery/tamtam_grey_000.jpg --post_id=$_TAB05414d8034b --featured_image=true
echo "Creating Product: tamtam"
_TABXXX08e20285=`wp post create --post_title="tamtam" --menu_order=32 --post_name="tamtam_tabxxx08e20285" --post_content='{:en}Just like candy. Giving a specific function to the Tamtam is hard. It can serve as a side table, night stand, coffee table, stool, plant stool, or simply a visual candy in any space. Made of natural rattan by hand and offered is 6 happy colors, the Tamtam will delight any landscape. The handle add extra functionality. Up to you to find its best use.{:}{:fr}La cerise sur le gâteau. Tamtam ne possède aucune fonction spécifique. Il peut servir de table de bout, de chevet, de tabouret, de porte-plante ou de simple élément visuel à admirer. Il est confectionné à la main en rotin naturel, en six couleurs bonne humeur. Sa poignée ajoute une petite note de fonctionnalité. Quel usage en ferez-vous dans votre espace?{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: tamtam"
wp post meta update $_TABXXX08e20285 _subtitle "{:en}green{:}{:fr}green{:}"
wp post meta update $_TABXXX08e20285 _visibility visible
wp post meta update $_TABXXX08e20285 _product_attributes '{"edb_material":{"name":"edb_material","value":"053","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX08e20285 _price 350.00
wp post meta update $_TABXXX08e20285 _regular_price 350.00
wp post term set $_TABXXX08e20285 product_shipping_class furniture
wp post term set $_TABXXX08e20285 product_cat side-tables
wp post term set $_TABXXX08e20285 product_type variable
wp post meta update $_TABXXX08e20285 _subtitle "{:en}green{:}{:fr}green{:}"
wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_000.jpg --post_id=$_TABXXX08e20285 --featured_image=true
_TABXXX08e20285_0=`wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_0001_002.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_1=`wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_0002_003.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_2=`wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_0003_004.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_3=`wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_0000_005.jpg --post_id=$_TABXXX08e20285 --porcelain`
wp post meta update $_TABXXX08e20285 _product_image_gallery $_TABXXX08e20285_0,$_TABXXX08e20285_1,$_TABXXX08e20285_2,$_TABXXX08e20285_3
echo "Creating Variation: tamtam-053"
_TAB05314d7034a=`wp post create --post_title="tamtam-053" --post_parent=$_TABXXX08e20285 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=tamtam_tabxxx08e20285053 --porcelain`
echo "Setting meta for product: tamtam-053 Variation: 053"
wp post meta update $_TAB05314d7034a _visibility visible
wp post meta update $_TAB05314d7034a attribute_edb_material 053
wp post meta update $_TAB05314d7034a _stock 2
wp post meta update $_TAB05314d7034a _stock_status instock
wp post meta update $_TAB05314d7034a _manage_stock yes
wp post meta update $_TAB05314d7034a _backorders yes
wp post meta update $_TAB05314d7034a _price 350.00
wp post meta update $_TAB05314d7034a _regular_price 350.00
wp post meta update $_TAB05314d7034a _sku TAB05314d7034a
wp media import ./data/products/32-tamtam_green/gallery/tamtam_green_000.jpg --post_id=$_TAB05314d7034a --featured_image=true
echo "Creating Product: tamtam"
_TABXXX08e20285=`wp post create --post_title="tamtam" --menu_order=31 --post_name="tamtam_tabxxx08e20285" --post_content='{:en}Just like candy. Giving a specific function to the Tamtam is hard. It can serve as a side table, night stand, coffee table, stool, plant stool, or simply a visual candy in any space. Made of natural rattan by hand and offered is 6 happy colors, the Tamtam will delight any landscape. The handle add extra functionality. Up to you to find its best use.{:}{:fr}La cerise sur le gâteau. Tamtam ne possède aucune fonction spécifique. Il peut servir de table de bout, de chevet, de tabouret, de porte-plante ou de simple élément visuel à admirer. Il est confectionné à la main en rotin naturel, en six couleurs bonne humeur. Sa poignée ajoute une petite note de fonctionnalité. Quel usage en ferez-vous dans votre espace?{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: tamtam"
wp post meta update $_TABXXX08e20285 _subtitle "{:en}orange{:}{:fr}orange{:}"
wp post meta update $_TABXXX08e20285 _visibility visible
wp post meta update $_TABXXX08e20285 _product_attributes '{"edb_material":{"name":"edb_material","value":"052","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX08e20285 _price 350.00
wp post meta update $_TABXXX08e20285 _regular_price 350.00
wp post term set $_TABXXX08e20285 product_shipping_class furniture
wp post term set $_TABXXX08e20285 product_cat side-tables
wp post term set $_TABXXX08e20285 product_type variable
wp post meta update $_TABXXX08e20285 _subtitle "{:en}orange{:}{:fr}orange{:}"
wp media import ./data/products/31-tamtam_orange/gallery/tamtam_orange_0000_000.jpg --post_id=$_TABXXX08e20285 --featured_image=true
_TABXXX08e20285_0=`wp media import ./data/products/31-tamtam_orange/gallery/tamtam_orange_0001_002.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_1=`wp media import ./data/products/31-tamtam_orange/gallery/tamtam_orange_0002_003.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_2=`wp media import ./data/products/31-tamtam_orange/gallery/tamtam_orange_0000_005.jpg --post_id=$_TABXXX08e20285 --porcelain`
wp post meta update $_TABXXX08e20285 _product_image_gallery $_TABXXX08e20285_0,$_TABXXX08e20285_1,$_TABXXX08e20285_2
echo "Creating Variation: tamtam-052"
_TAB05214d60349=`wp post create --post_title="tamtam-052" --post_parent=$_TABXXX08e20285 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=tamtam_tabxxx08e20285052 --porcelain`
echo "Setting meta for product: tamtam-052 Variation: 052"
wp post meta update $_TAB05214d60349 _visibility visible
wp post meta update $_TAB05214d60349 attribute_edb_material 052
wp post meta update $_TAB05214d60349 _stock 2
wp post meta update $_TAB05214d60349 _stock_status instock
wp post meta update $_TAB05214d60349 _manage_stock yes
wp post meta update $_TAB05214d60349 _backorders yes
wp post meta update $_TAB05214d60349 _price 350.00
wp post meta update $_TAB05214d60349 _regular_price 350.00
wp post meta update $_TAB05214d60349 _sku TAB05214d60349
wp media import ./data/products/31-tamtam_orange/gallery/tamtam_orange_0000_000.jpg --post_id=$_TAB05214d60349 --featured_image=true
echo "Creating Product: tamtam"
_TABXXX08e20285=`wp post create --post_title="tamtam" --menu_order=30 --post_name="tamtam_tabxxx08e20285" --post_content='{:en}Just like candy. Giving a specific function to the Tamtam is hard. It can serve as a side table, night stand, coffee table, stool, plant stool, or simply a visual candy in any space. Made of natural rattan by hand and offered is 6 happy colors, the Tamtam will delight any landscape. The handle add extra functionality. Up to you to find its best use.{:}{:fr}La cerise sur le gâteau. Tamtam ne possède aucune fonction spécifique. Il peut servir de table de bout, de chevet, de tabouret, de porte-plante ou de simple élément visuel à admirer. Il est confectionné à la main en rotin naturel, en six couleurs bonne humeur. Sa poignée ajoute une petite note de fonctionnalité. Quel usage en ferez-vous dans votre espace?{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: tamtam"
wp post meta update $_TABXXX08e20285 _subtitle "{:en}yellow{:}{:fr}yellow{:}"
wp post meta update $_TABXXX08e20285 _visibility visible
wp post meta update $_TABXXX08e20285 _product_attributes '{"edb_material":{"name":"edb_material","value":"051","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_TABXXX08e20285 _price 350.00
wp post meta update $_TABXXX08e20285 _regular_price 350.00
wp post term set $_TABXXX08e20285 product_shipping_class furniture
wp post term set $_TABXXX08e20285 product_cat side-tables
wp post term set $_TABXXX08e20285 product_type variable
wp post meta update $_TABXXX08e20285 _subtitle "{:en}yellow{:}{:fr}yellow{:}"
wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_000.jpg --post_id=$_TABXXX08e20285 --featured_image=true
_TABXXX08e20285_0=`wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_0001_002.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_1=`wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_0002_003.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_2=`wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_0003_004.jpg --post_id=$_TABXXX08e20285 --porcelain`
_TABXXX08e20285_3=`wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_0000_005.jpg --post_id=$_TABXXX08e20285 --porcelain`
wp post meta update $_TABXXX08e20285 _product_image_gallery $_TABXXX08e20285_0,$_TABXXX08e20285_1,$_TABXXX08e20285_2,$_TABXXX08e20285_3
echo "Creating Variation: tamtam-051"
_TAB05114d50348=`wp post create --post_title="tamtam-051" --post_parent=$_TABXXX08e20285 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=tamtam_tabxxx08e20285051 --porcelain`
echo "Setting meta for product: tamtam-051 Variation: 051"
wp post meta update $_TAB05114d50348 _visibility visible
wp post meta update $_TAB05114d50348 attribute_edb_material 051
wp post meta update $_TAB05114d50348 _stock 2
wp post meta update $_TAB05114d50348 _stock_status instock
wp post meta update $_TAB05114d50348 _manage_stock yes
wp post meta update $_TAB05114d50348 _backorders yes
wp post meta update $_TAB05114d50348 _price 350.00
wp post meta update $_TAB05114d50348 _regular_price 350.00
wp post meta update $_TAB05114d50348 _sku TAB05114d50348
wp media import ./data/products/30-tamtam_yellow/gallery/tamtam_yellow_000.jpg --post_id=$_TAB05114d50348 --featured_image=true
echo "Creating Product: mixmix"
_MODXXX0912029d=`wp post create --post_title="mixmix" --menu_order=27 --post_name="mixmix_modxxx0912029d" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: mixmix"
wp post meta update $_MODXXX0912029d _subtitle "{:en}ottrec{:}{:fr}ottrec{:}"
wp post meta update $_MODXXX0912029d _visibility visible
wp post meta update $_MODXXX0912029d _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_MODXXX0912029d _price 350.00
wp post meta update $_MODXXX0912029d _regular_price 350.00
wp post term set $_MODXXX0912029d product_shipping_class furniture
wp post term set $_MODXXX0912029d product_cat modular
wp post term set $_MODXXX0912029d product_type variable
wp post meta update $_MODXXX0912029d _subtitle "{:en}ottrec{:}{:fr}ottrec{:}"
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MODXXX0912029d --featured_image=true
_MODXXX0912029d_0=`wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottrec_0000_001.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_1=`wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottrec_0001_002.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_2=`wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottrec_0002_003.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_3=`wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottrec_0003_004.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_4=`wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottrec_0004_005.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_5=`wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_006.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_6=`wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0001_007.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_7=`wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0002_008.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_8=`wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0003_009.jpg --post_id=$_MODXXX0912029d --porcelain`
wp post meta update $_MODXXX0912029d _product_image_gallery $_MODXXX0912029d_0,$_MODXXX0912029d_1,$_MODXXX0912029d_2,$_MODXXX0912029d_3,$_MODXXX0912029d_4,$_MODXXX0912029d_5,$_MODXXX0912029d_6,$_MODXXX0912029d_7,$_MODXXX0912029d_8
echo "Creating Variation: mixmix-001"
_MOD001155b035b=`wp post create --post_title="mixmix-001" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d001 --porcelain`
echo "Setting meta for product: mixmix-001 Variation: 001"
wp post meta update $_MOD001155b035b _visibility visible
wp post meta update $_MOD001155b035b attribute_edb_material 001
wp post meta update $_MOD001155b035b _stock 2
wp post meta update $_MOD001155b035b _stock_status instock
wp post meta update $_MOD001155b035b _manage_stock yes
wp post meta update $_MOD001155b035b _backorders yes
wp post meta update $_MOD001155b035b _price 350.00
wp post meta update $_MOD001155b035b _regular_price 350.00
wp post meta update $_MOD001155b035b _sku MOD001155b035b
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD001155b035b --featured_image=true
echo "Creating Variation: mixmix-002"
_MOD002155c035c=`wp post create --post_title="mixmix-002" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d002 --porcelain`
echo "Setting meta for product: mixmix-002 Variation: 002"
wp post meta update $_MOD002155c035c _visibility visible
wp post meta update $_MOD002155c035c attribute_edb_material 002
wp post meta update $_MOD002155c035c _stock 2
wp post meta update $_MOD002155c035c _stock_status instock
wp post meta update $_MOD002155c035c _manage_stock yes
wp post meta update $_MOD002155c035c _backorders yes
wp post meta update $_MOD002155c035c _price 350.00
wp post meta update $_MOD002155c035c _regular_price 350.00
wp post meta update $_MOD002155c035c _sku MOD002155c035c
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD002155c035c --featured_image=true
echo "Creating Variation: mixmix-003"
_MOD003155d035d=`wp post create --post_title="mixmix-003" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d003 --porcelain`
echo "Setting meta for product: mixmix-003 Variation: 003"
wp post meta update $_MOD003155d035d _visibility visible
wp post meta update $_MOD003155d035d attribute_edb_material 003
wp post meta update $_MOD003155d035d _stock 2
wp post meta update $_MOD003155d035d _stock_status instock
wp post meta update $_MOD003155d035d _manage_stock yes
wp post meta update $_MOD003155d035d _backorders yes
wp post meta update $_MOD003155d035d _price 350.00
wp post meta update $_MOD003155d035d _regular_price 350.00
wp post meta update $_MOD003155d035d _sku MOD003155d035d
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD003155d035d --featured_image=true
echo "Creating Variation: mixmix-004"
_MOD004155e035e=`wp post create --post_title="mixmix-004" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d004 --porcelain`
echo "Setting meta for product: mixmix-004 Variation: 004"
wp post meta update $_MOD004155e035e _visibility visible
wp post meta update $_MOD004155e035e attribute_edb_material 004
wp post meta update $_MOD004155e035e _stock 2
wp post meta update $_MOD004155e035e _stock_status instock
wp post meta update $_MOD004155e035e _manage_stock yes
wp post meta update $_MOD004155e035e _backorders yes
wp post meta update $_MOD004155e035e _price 350.00
wp post meta update $_MOD004155e035e _regular_price 350.00
wp post meta update $_MOD004155e035e _sku MOD004155e035e
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD004155e035e --featured_image=true
echo "Creating Variation: mixmix-005"
_MOD005155f035f=`wp post create --post_title="mixmix-005" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d005 --porcelain`
echo "Setting meta for product: mixmix-005 Variation: 005"
wp post meta update $_MOD005155f035f _visibility visible
wp post meta update $_MOD005155f035f attribute_edb_material 005
wp post meta update $_MOD005155f035f _stock 2
wp post meta update $_MOD005155f035f _stock_status instock
wp post meta update $_MOD005155f035f _manage_stock yes
wp post meta update $_MOD005155f035f _backorders yes
wp post meta update $_MOD005155f035f _price 350.00
wp post meta update $_MOD005155f035f _regular_price 350.00
wp post meta update $_MOD005155f035f _sku MOD005155f035f
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD005155f035f --featured_image=true
echo "Creating Variation: mixmix-006"
_MOD00615600360=`wp post create --post_title="mixmix-006" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d006 --porcelain`
echo "Setting meta for product: mixmix-006 Variation: 006"
wp post meta update $_MOD00615600360 _visibility visible
wp post meta update $_MOD00615600360 attribute_edb_material 006
wp post meta update $_MOD00615600360 _stock 2
wp post meta update $_MOD00615600360 _stock_status instock
wp post meta update $_MOD00615600360 _manage_stock yes
wp post meta update $_MOD00615600360 _backorders yes
wp post meta update $_MOD00615600360 _price 350.00
wp post meta update $_MOD00615600360 _regular_price 350.00
wp post meta update $_MOD00615600360 _sku MOD00615600360
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD00615600360 --featured_image=true
echo "Creating Variation: mixmix-007"
_MOD00715610361=`wp post create --post_title="mixmix-007" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d007 --porcelain`
echo "Setting meta for product: mixmix-007 Variation: 007"
wp post meta update $_MOD00715610361 _visibility visible
wp post meta update $_MOD00715610361 attribute_edb_material 007
wp post meta update $_MOD00715610361 _stock 2
wp post meta update $_MOD00715610361 _stock_status instock
wp post meta update $_MOD00715610361 _manage_stock yes
wp post meta update $_MOD00715610361 _backorders yes
wp post meta update $_MOD00715610361 _price 350.00
wp post meta update $_MOD00715610361 _regular_price 350.00
wp post meta update $_MOD00715610361 _sku MOD00715610361
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD00715610361 --featured_image=true
echo "Creating Variation: mixmix-008"
_MOD00815620362=`wp post create --post_title="mixmix-008" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d008 --porcelain`
echo "Setting meta for product: mixmix-008 Variation: 008"
wp post meta update $_MOD00815620362 _visibility visible
wp post meta update $_MOD00815620362 attribute_edb_material 008
wp post meta update $_MOD00815620362 _stock 2
wp post meta update $_MOD00815620362 _stock_status instock
wp post meta update $_MOD00815620362 _manage_stock yes
wp post meta update $_MOD00815620362 _backorders yes
wp post meta update $_MOD00815620362 _price 350.00
wp post meta update $_MOD00815620362 _regular_price 350.00
wp post meta update $_MOD00815620362 _sku MOD00815620362
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD00815620362 --featured_image=true
echo "Creating Variation: mixmix-009"
_MOD00915630363=`wp post create --post_title="mixmix-009" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d009 --porcelain`
echo "Setting meta for product: mixmix-009 Variation: 009"
wp post meta update $_MOD00915630363 _visibility visible
wp post meta update $_MOD00915630363 attribute_edb_material 009
wp post meta update $_MOD00915630363 _stock 2
wp post meta update $_MOD00915630363 _stock_status instock
wp post meta update $_MOD00915630363 _manage_stock yes
wp post meta update $_MOD00915630363 _backorders yes
wp post meta update $_MOD00915630363 _price 350.00
wp post meta update $_MOD00915630363 _regular_price 350.00
wp post meta update $_MOD00915630363 _sku MOD00915630363
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD00915630363 --featured_image=true
echo "Creating Variation: mixmix-010"
_MOD010155c035b=`wp post create --post_title="mixmix-010" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d010 --porcelain`
echo "Setting meta for product: mixmix-010 Variation: 010"
wp post meta update $_MOD010155c035b _visibility visible
wp post meta update $_MOD010155c035b attribute_edb_material 010
wp post meta update $_MOD010155c035b _stock 2
wp post meta update $_MOD010155c035b _stock_status instock
wp post meta update $_MOD010155c035b _manage_stock yes
wp post meta update $_MOD010155c035b _backorders yes
wp post meta update $_MOD010155c035b _price 350.00
wp post meta update $_MOD010155c035b _regular_price 350.00
wp post meta update $_MOD010155c035b _sku MOD010155c035b
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD010155c035b --featured_image=true
echo "Creating Variation: mixmix-011"
_MOD011155d035c=`wp post create --post_title="mixmix-011" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d011 --porcelain`
echo "Setting meta for product: mixmix-011 Variation: 011"
wp post meta update $_MOD011155d035c _visibility visible
wp post meta update $_MOD011155d035c attribute_edb_material 011
wp post meta update $_MOD011155d035c _stock 2
wp post meta update $_MOD011155d035c _stock_status instock
wp post meta update $_MOD011155d035c _manage_stock yes
wp post meta update $_MOD011155d035c _backorders yes
wp post meta update $_MOD011155d035c _price 350.00
wp post meta update $_MOD011155d035c _regular_price 350.00
wp post meta update $_MOD011155d035c _sku MOD011155d035c
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD011155d035c --featured_image=true
echo "Creating Variation: mixmix-012"
_MOD012155e035d=`wp post create --post_title="mixmix-012" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d012 --porcelain`
echo "Setting meta for product: mixmix-012 Variation: 012"
wp post meta update $_MOD012155e035d _visibility visible
wp post meta update $_MOD012155e035d attribute_edb_material 012
wp post meta update $_MOD012155e035d _stock 2
wp post meta update $_MOD012155e035d _stock_status instock
wp post meta update $_MOD012155e035d _manage_stock yes
wp post meta update $_MOD012155e035d _backorders yes
wp post meta update $_MOD012155e035d _price 350.00
wp post meta update $_MOD012155e035d _regular_price 350.00
wp post meta update $_MOD012155e035d _sku MOD012155e035d
wp media import ./data/products/27-mixmix_ottrec/gallery/mixmix_ottorec_0000_000.jpg --post_id=$_MOD012155e035d --featured_image=true
echo "Creating Product: mixmix"
_MODXXX0912029d=`wp post create --post_title="mixmix" --menu_order=26 --post_name="mixmix_modxxx0912029d" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: mixmix"
wp post meta update $_MODXXX0912029d _subtitle "{:en}single{:}{:fr}single{:}"
wp post meta update $_MODXXX0912029d _visibility visible
wp post meta update $_MODXXX0912029d _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_MODXXX0912029d _price 350.00
wp post meta update $_MODXXX0912029d _regular_price 350.00
wp post term set $_MODXXX0912029d product_shipping_class furniture
wp post term set $_MODXXX0912029d product_cat modular
wp post term set $_MODXXX0912029d product_type variable
wp post meta update $_MODXXX0912029d _subtitle "{:en}single{:}{:fr}single{:}"
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MODXXX0912029d --featured_image=true
_MODXXX0912029d_0=`wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_001.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_1=`wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0001_002.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_2=`wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0002_003.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_3=`wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0003_004.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_4=`wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0004_005.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_5=`wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_006.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_6=`wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0001_007.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_7=`wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0002_008.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_8=`wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0003_009.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_9=`wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0004_010.jpg --post_id=$_MODXXX0912029d --porcelain`
wp post meta update $_MODXXX0912029d _product_image_gallery $_MODXXX0912029d_0,$_MODXXX0912029d_1,$_MODXXX0912029d_2,$_MODXXX0912029d_3,$_MODXXX0912029d_4,$_MODXXX0912029d_5,$_MODXXX0912029d_6,$_MODXXX0912029d_7,$_MODXXX0912029d_8,$_MODXXX0912029d_9
echo "Creating Variation: mixmix-001"
_MOD001155b035b=`wp post create --post_title="mixmix-001" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d001 --porcelain`
echo "Setting meta for product: mixmix-001 Variation: 001"
wp post meta update $_MOD001155b035b _visibility visible
wp post meta update $_MOD001155b035b attribute_edb_material 001
wp post meta update $_MOD001155b035b _stock 2
wp post meta update $_MOD001155b035b _stock_status instock
wp post meta update $_MOD001155b035b _manage_stock yes
wp post meta update $_MOD001155b035b _backorders yes
wp post meta update $_MOD001155b035b _price 350.00
wp post meta update $_MOD001155b035b _regular_price 350.00
wp post meta update $_MOD001155b035b _sku MOD001155b035b
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD001155b035b --featured_image=true
echo "Creating Variation: mixmix-002"
_MOD002155c035c=`wp post create --post_title="mixmix-002" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d002 --porcelain`
echo "Setting meta for product: mixmix-002 Variation: 002"
wp post meta update $_MOD002155c035c _visibility visible
wp post meta update $_MOD002155c035c attribute_edb_material 002
wp post meta update $_MOD002155c035c _stock 2
wp post meta update $_MOD002155c035c _stock_status instock
wp post meta update $_MOD002155c035c _manage_stock yes
wp post meta update $_MOD002155c035c _backorders yes
wp post meta update $_MOD002155c035c _price 350.00
wp post meta update $_MOD002155c035c _regular_price 350.00
wp post meta update $_MOD002155c035c _sku MOD002155c035c
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD002155c035c --featured_image=true
echo "Creating Variation: mixmix-003"
_MOD003155d035d=`wp post create --post_title="mixmix-003" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d003 --porcelain`
echo "Setting meta for product: mixmix-003 Variation: 003"
wp post meta update $_MOD003155d035d _visibility visible
wp post meta update $_MOD003155d035d attribute_edb_material 003
wp post meta update $_MOD003155d035d _stock 2
wp post meta update $_MOD003155d035d _stock_status instock
wp post meta update $_MOD003155d035d _manage_stock yes
wp post meta update $_MOD003155d035d _backorders yes
wp post meta update $_MOD003155d035d _price 350.00
wp post meta update $_MOD003155d035d _regular_price 350.00
wp post meta update $_MOD003155d035d _sku MOD003155d035d
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD003155d035d --featured_image=true
echo "Creating Variation: mixmix-004"
_MOD004155e035e=`wp post create --post_title="mixmix-004" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d004 --porcelain`
echo "Setting meta for product: mixmix-004 Variation: 004"
wp post meta update $_MOD004155e035e _visibility visible
wp post meta update $_MOD004155e035e attribute_edb_material 004
wp post meta update $_MOD004155e035e _stock 2
wp post meta update $_MOD004155e035e _stock_status instock
wp post meta update $_MOD004155e035e _manage_stock yes
wp post meta update $_MOD004155e035e _backorders yes
wp post meta update $_MOD004155e035e _price 350.00
wp post meta update $_MOD004155e035e _regular_price 350.00
wp post meta update $_MOD004155e035e _sku MOD004155e035e
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD004155e035e --featured_image=true
echo "Creating Variation: mixmix-005"
_MOD005155f035f=`wp post create --post_title="mixmix-005" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d005 --porcelain`
echo "Setting meta for product: mixmix-005 Variation: 005"
wp post meta update $_MOD005155f035f _visibility visible
wp post meta update $_MOD005155f035f attribute_edb_material 005
wp post meta update $_MOD005155f035f _stock 2
wp post meta update $_MOD005155f035f _stock_status instock
wp post meta update $_MOD005155f035f _manage_stock yes
wp post meta update $_MOD005155f035f _backorders yes
wp post meta update $_MOD005155f035f _price 350.00
wp post meta update $_MOD005155f035f _regular_price 350.00
wp post meta update $_MOD005155f035f _sku MOD005155f035f
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD005155f035f --featured_image=true
echo "Creating Variation: mixmix-006"
_MOD00615600360=`wp post create --post_title="mixmix-006" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d006 --porcelain`
echo "Setting meta for product: mixmix-006 Variation: 006"
wp post meta update $_MOD00615600360 _visibility visible
wp post meta update $_MOD00615600360 attribute_edb_material 006
wp post meta update $_MOD00615600360 _stock 2
wp post meta update $_MOD00615600360 _stock_status instock
wp post meta update $_MOD00615600360 _manage_stock yes
wp post meta update $_MOD00615600360 _backorders yes
wp post meta update $_MOD00615600360 _price 350.00
wp post meta update $_MOD00615600360 _regular_price 350.00
wp post meta update $_MOD00615600360 _sku MOD00615600360
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD00615600360 --featured_image=true
echo "Creating Variation: mixmix-007"
_MOD00715610361=`wp post create --post_title="mixmix-007" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d007 --porcelain`
echo "Setting meta for product: mixmix-007 Variation: 007"
wp post meta update $_MOD00715610361 _visibility visible
wp post meta update $_MOD00715610361 attribute_edb_material 007
wp post meta update $_MOD00715610361 _stock 2
wp post meta update $_MOD00715610361 _stock_status instock
wp post meta update $_MOD00715610361 _manage_stock yes
wp post meta update $_MOD00715610361 _backorders yes
wp post meta update $_MOD00715610361 _price 350.00
wp post meta update $_MOD00715610361 _regular_price 350.00
wp post meta update $_MOD00715610361 _sku MOD00715610361
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD00715610361 --featured_image=true
echo "Creating Variation: mixmix-008"
_MOD00815620362=`wp post create --post_title="mixmix-008" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d008 --porcelain`
echo "Setting meta for product: mixmix-008 Variation: 008"
wp post meta update $_MOD00815620362 _visibility visible
wp post meta update $_MOD00815620362 attribute_edb_material 008
wp post meta update $_MOD00815620362 _stock 2
wp post meta update $_MOD00815620362 _stock_status instock
wp post meta update $_MOD00815620362 _manage_stock yes
wp post meta update $_MOD00815620362 _backorders yes
wp post meta update $_MOD00815620362 _price 350.00
wp post meta update $_MOD00815620362 _regular_price 350.00
wp post meta update $_MOD00815620362 _sku MOD00815620362
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD00815620362 --featured_image=true
echo "Creating Variation: mixmix-009"
_MOD00915630363=`wp post create --post_title="mixmix-009" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d009 --porcelain`
echo "Setting meta for product: mixmix-009 Variation: 009"
wp post meta update $_MOD00915630363 _visibility visible
wp post meta update $_MOD00915630363 attribute_edb_material 009
wp post meta update $_MOD00915630363 _stock 2
wp post meta update $_MOD00915630363 _stock_status instock
wp post meta update $_MOD00915630363 _manage_stock yes
wp post meta update $_MOD00915630363 _backorders yes
wp post meta update $_MOD00915630363 _price 350.00
wp post meta update $_MOD00915630363 _regular_price 350.00
wp post meta update $_MOD00915630363 _sku MOD00915630363
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD00915630363 --featured_image=true
echo "Creating Variation: mixmix-010"
_MOD010155c035b=`wp post create --post_title="mixmix-010" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d010 --porcelain`
echo "Setting meta for product: mixmix-010 Variation: 010"
wp post meta update $_MOD010155c035b _visibility visible
wp post meta update $_MOD010155c035b attribute_edb_material 010
wp post meta update $_MOD010155c035b _stock 2
wp post meta update $_MOD010155c035b _stock_status instock
wp post meta update $_MOD010155c035b _manage_stock yes
wp post meta update $_MOD010155c035b _backorders yes
wp post meta update $_MOD010155c035b _price 350.00
wp post meta update $_MOD010155c035b _regular_price 350.00
wp post meta update $_MOD010155c035b _sku MOD010155c035b
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD010155c035b --featured_image=true
echo "Creating Variation: mixmix-011"
_MOD011155d035c=`wp post create --post_title="mixmix-011" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d011 --porcelain`
echo "Setting meta for product: mixmix-011 Variation: 011"
wp post meta update $_MOD011155d035c _visibility visible
wp post meta update $_MOD011155d035c attribute_edb_material 011
wp post meta update $_MOD011155d035c _stock 2
wp post meta update $_MOD011155d035c _stock_status instock
wp post meta update $_MOD011155d035c _manage_stock yes
wp post meta update $_MOD011155d035c _backorders yes
wp post meta update $_MOD011155d035c _price 350.00
wp post meta update $_MOD011155d035c _regular_price 350.00
wp post meta update $_MOD011155d035c _sku MOD011155d035c
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD011155d035c --featured_image=true
echo "Creating Variation: mixmix-012"
_MOD012155e035d=`wp post create --post_title="mixmix-012" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d012 --porcelain`
echo "Setting meta for product: mixmix-012 Variation: 012"
wp post meta update $_MOD012155e035d _visibility visible
wp post meta update $_MOD012155e035d attribute_edb_material 012
wp post meta update $_MOD012155e035d _stock 2
wp post meta update $_MOD012155e035d _stock_status instock
wp post meta update $_MOD012155e035d _manage_stock yes
wp post meta update $_MOD012155e035d _backorders yes
wp post meta update $_MOD012155e035d _price 350.00
wp post meta update $_MOD012155e035d _regular_price 350.00
wp post meta update $_MOD012155e035d _sku MOD012155e035d
wp media import ./data/products/26-mixmix_single/gallery/mixmix_single_0000_000.jpg --post_id=$_MOD012155e035d --featured_image=true
echo "Creating Product: mixmix"
_MODXXX0912029d=`wp post create --post_title="mixmix" --menu_order=25 --post_name="mixmix_modxxx0912029d" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: mixmix"
wp post meta update $_MODXXX0912029d _subtitle "{:en}corner{:}{:fr}corner{:}"
wp post meta update $_MODXXX0912029d _visibility visible
wp post meta update $_MODXXX0912029d _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_MODXXX0912029d _price 350.00
wp post meta update $_MODXXX0912029d _regular_price 350.00
wp post term set $_MODXXX0912029d product_shipping_class furniture
wp post term set $_MODXXX0912029d product_cat modular
wp post term set $_MODXXX0912029d product_type variable
wp post meta update $_MODXXX0912029d _subtitle "{:en}corner{:}{:fr}corner{:}"
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MODXXX0912029d --featured_image=true
_MODXXX0912029d_0=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_001.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_1=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0001_002.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_2=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0002_003.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_3=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0003_004.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_4=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0004_005.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_5=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0005_006.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_6=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0006_007.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_7=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_008.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_8=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0001_009.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_9=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0002_010.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_10=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0003_011.jpg --post_id=$_MODXXX0912029d --porcelain`
_MODXXX0912029d_11=`wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0004_012.jpg --post_id=$_MODXXX0912029d --porcelain`
wp post meta update $_MODXXX0912029d _product_image_gallery $_MODXXX0912029d_0,$_MODXXX0912029d_1,$_MODXXX0912029d_2,$_MODXXX0912029d_3,$_MODXXX0912029d_4,$_MODXXX0912029d_5,$_MODXXX0912029d_6,$_MODXXX0912029d_7,$_MODXXX0912029d_8,$_MODXXX0912029d_9,$_MODXXX0912029d_10,$_MODXXX0912029d_11
echo "Creating Variation: mixmix-001"
_MOD001155b035b=`wp post create --post_title="mixmix-001" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d001 --porcelain`
echo "Setting meta for product: mixmix-001 Variation: 001"
wp post meta update $_MOD001155b035b _visibility visible
wp post meta update $_MOD001155b035b attribute_edb_material 001
wp post meta update $_MOD001155b035b _stock 2
wp post meta update $_MOD001155b035b _stock_status instock
wp post meta update $_MOD001155b035b _manage_stock yes
wp post meta update $_MOD001155b035b _backorders yes
wp post meta update $_MOD001155b035b _price 350.00
wp post meta update $_MOD001155b035b _regular_price 350.00
wp post meta update $_MOD001155b035b _sku MOD001155b035b
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD001155b035b --featured_image=true
echo "Creating Variation: mixmix-002"
_MOD002155c035c=`wp post create --post_title="mixmix-002" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d002 --porcelain`
echo "Setting meta for product: mixmix-002 Variation: 002"
wp post meta update $_MOD002155c035c _visibility visible
wp post meta update $_MOD002155c035c attribute_edb_material 002
wp post meta update $_MOD002155c035c _stock 2
wp post meta update $_MOD002155c035c _stock_status instock
wp post meta update $_MOD002155c035c _manage_stock yes
wp post meta update $_MOD002155c035c _backorders yes
wp post meta update $_MOD002155c035c _price 350.00
wp post meta update $_MOD002155c035c _regular_price 350.00
wp post meta update $_MOD002155c035c _sku MOD002155c035c
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD002155c035c --featured_image=true
echo "Creating Variation: mixmix-003"
_MOD003155d035d=`wp post create --post_title="mixmix-003" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d003 --porcelain`
echo "Setting meta for product: mixmix-003 Variation: 003"
wp post meta update $_MOD003155d035d _visibility visible
wp post meta update $_MOD003155d035d attribute_edb_material 003
wp post meta update $_MOD003155d035d _stock 2
wp post meta update $_MOD003155d035d _stock_status instock
wp post meta update $_MOD003155d035d _manage_stock yes
wp post meta update $_MOD003155d035d _backorders yes
wp post meta update $_MOD003155d035d _price 350.00
wp post meta update $_MOD003155d035d _regular_price 350.00
wp post meta update $_MOD003155d035d _sku MOD003155d035d
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD003155d035d --featured_image=true
echo "Creating Variation: mixmix-004"
_MOD004155e035e=`wp post create --post_title="mixmix-004" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d004 --porcelain`
echo "Setting meta for product: mixmix-004 Variation: 004"
wp post meta update $_MOD004155e035e _visibility visible
wp post meta update $_MOD004155e035e attribute_edb_material 004
wp post meta update $_MOD004155e035e _stock 2
wp post meta update $_MOD004155e035e _stock_status instock
wp post meta update $_MOD004155e035e _manage_stock yes
wp post meta update $_MOD004155e035e _backorders yes
wp post meta update $_MOD004155e035e _price 350.00
wp post meta update $_MOD004155e035e _regular_price 350.00
wp post meta update $_MOD004155e035e _sku MOD004155e035e
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD004155e035e --featured_image=true
echo "Creating Variation: mixmix-005"
_MOD005155f035f=`wp post create --post_title="mixmix-005" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d005 --porcelain`
echo "Setting meta for product: mixmix-005 Variation: 005"
wp post meta update $_MOD005155f035f _visibility visible
wp post meta update $_MOD005155f035f attribute_edb_material 005
wp post meta update $_MOD005155f035f _stock 2
wp post meta update $_MOD005155f035f _stock_status instock
wp post meta update $_MOD005155f035f _manage_stock yes
wp post meta update $_MOD005155f035f _backorders yes
wp post meta update $_MOD005155f035f _price 350.00
wp post meta update $_MOD005155f035f _regular_price 350.00
wp post meta update $_MOD005155f035f _sku MOD005155f035f
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD005155f035f --featured_image=true
echo "Creating Variation: mixmix-006"
_MOD00615600360=`wp post create --post_title="mixmix-006" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d006 --porcelain`
echo "Setting meta for product: mixmix-006 Variation: 006"
wp post meta update $_MOD00615600360 _visibility visible
wp post meta update $_MOD00615600360 attribute_edb_material 006
wp post meta update $_MOD00615600360 _stock 2
wp post meta update $_MOD00615600360 _stock_status instock
wp post meta update $_MOD00615600360 _manage_stock yes
wp post meta update $_MOD00615600360 _backorders yes
wp post meta update $_MOD00615600360 _price 350.00
wp post meta update $_MOD00615600360 _regular_price 350.00
wp post meta update $_MOD00615600360 _sku MOD00615600360
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD00615600360 --featured_image=true
echo "Creating Variation: mixmix-007"
_MOD00715610361=`wp post create --post_title="mixmix-007" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d007 --porcelain`
echo "Setting meta for product: mixmix-007 Variation: 007"
wp post meta update $_MOD00715610361 _visibility visible
wp post meta update $_MOD00715610361 attribute_edb_material 007
wp post meta update $_MOD00715610361 _stock 2
wp post meta update $_MOD00715610361 _stock_status instock
wp post meta update $_MOD00715610361 _manage_stock yes
wp post meta update $_MOD00715610361 _backorders yes
wp post meta update $_MOD00715610361 _price 350.00
wp post meta update $_MOD00715610361 _regular_price 350.00
wp post meta update $_MOD00715610361 _sku MOD00715610361
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD00715610361 --featured_image=true
echo "Creating Variation: mixmix-008"
_MOD00815620362=`wp post create --post_title="mixmix-008" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d008 --porcelain`
echo "Setting meta for product: mixmix-008 Variation: 008"
wp post meta update $_MOD00815620362 _visibility visible
wp post meta update $_MOD00815620362 attribute_edb_material 008
wp post meta update $_MOD00815620362 _stock 2
wp post meta update $_MOD00815620362 _stock_status instock
wp post meta update $_MOD00815620362 _manage_stock yes
wp post meta update $_MOD00815620362 _backorders yes
wp post meta update $_MOD00815620362 _price 350.00
wp post meta update $_MOD00815620362 _regular_price 350.00
wp post meta update $_MOD00815620362 _sku MOD00815620362
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD00815620362 --featured_image=true
echo "Creating Variation: mixmix-009"
_MOD00915630363=`wp post create --post_title="mixmix-009" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d009 --porcelain`
echo "Setting meta for product: mixmix-009 Variation: 009"
wp post meta update $_MOD00915630363 _visibility visible
wp post meta update $_MOD00915630363 attribute_edb_material 009
wp post meta update $_MOD00915630363 _stock 2
wp post meta update $_MOD00915630363 _stock_status instock
wp post meta update $_MOD00915630363 _manage_stock yes
wp post meta update $_MOD00915630363 _backorders yes
wp post meta update $_MOD00915630363 _price 350.00
wp post meta update $_MOD00915630363 _regular_price 350.00
wp post meta update $_MOD00915630363 _sku MOD00915630363
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD00915630363 --featured_image=true
echo "Creating Variation: mixmix-010"
_MOD010155c035b=`wp post create --post_title="mixmix-010" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d010 --porcelain`
echo "Setting meta for product: mixmix-010 Variation: 010"
wp post meta update $_MOD010155c035b _visibility visible
wp post meta update $_MOD010155c035b attribute_edb_material 010
wp post meta update $_MOD010155c035b _stock 2
wp post meta update $_MOD010155c035b _stock_status instock
wp post meta update $_MOD010155c035b _manage_stock yes
wp post meta update $_MOD010155c035b _backorders yes
wp post meta update $_MOD010155c035b _price 350.00
wp post meta update $_MOD010155c035b _regular_price 350.00
wp post meta update $_MOD010155c035b _sku MOD010155c035b
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD010155c035b --featured_image=true
echo "Creating Variation: mixmix-011"
_MOD011155d035c=`wp post create --post_title="mixmix-011" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d011 --porcelain`
echo "Setting meta for product: mixmix-011 Variation: 011"
wp post meta update $_MOD011155d035c _visibility visible
wp post meta update $_MOD011155d035c attribute_edb_material 011
wp post meta update $_MOD011155d035c _stock 2
wp post meta update $_MOD011155d035c _stock_status instock
wp post meta update $_MOD011155d035c _manage_stock yes
wp post meta update $_MOD011155d035c _backorders yes
wp post meta update $_MOD011155d035c _price 350.00
wp post meta update $_MOD011155d035c _regular_price 350.00
wp post meta update $_MOD011155d035c _sku MOD011155d035c
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD011155d035c --featured_image=true
echo "Creating Variation: mixmix-012"
_MOD012155e035d=`wp post create --post_title="mixmix-012" --post_parent=$_MODXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_modxxx0912029d012 --porcelain`
echo "Setting meta for product: mixmix-012 Variation: 012"
wp post meta update $_MOD012155e035d _visibility visible
wp post meta update $_MOD012155e035d attribute_edb_material 012
wp post meta update $_MOD012155e035d _stock 2
wp post meta update $_MOD012155e035d _stock_status instock
wp post meta update $_MOD012155e035d _manage_stock yes
wp post meta update $_MOD012155e035d _backorders yes
wp post meta update $_MOD012155e035d _price 350.00
wp post meta update $_MOD012155e035d _regular_price 350.00
wp post meta update $_MOD012155e035d _sku MOD012155e035d
wp media import ./data/products/25-mixmix_corner/gallery/mixmix_corner_0000_000.jpg --post_id=$_MOD012155e035d --featured_image=true
echo "Creating Product: taxi"
_ARMXXX045001b7=`wp post create --post_title="taxi" --menu_order=24 --post_name="taxi_armxxx045001b7" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: taxi"
wp post meta update $_ARMXXX045001b7 _visibility visible
wp post meta update $_ARMXXX045001b7 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_ARMXXX045001b7 _price 350.00
wp post meta update $_ARMXXX045001b7 _regular_price 350.00
wp post term set $_ARMXXX045001b7 product_shipping_class furniture
wp post term set $_ARMXXX045001b7 product_cat armchairs
wp post term set $_ARMXXX045001b7 product_type variable
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARMXXX045001b7 --featured_image=true
_ARMXXX045001b7_0=`wp media import ./data/products/24-taxi/gallery/armchair_taxi_0000_001.jpg --post_id=$_ARMXXX045001b7 --porcelain`
_ARMXXX045001b7_1=`wp media import ./data/products/24-taxi/gallery/armchair_taxi_0001_002.jpg --post_id=$_ARMXXX045001b7 --porcelain`
_ARMXXX045001b7_2=`wp media import ./data/products/24-taxi/gallery/armchair_taxi_0002_003.jpg --post_id=$_ARMXXX045001b7 --porcelain`
_ARMXXX045001b7_3=`wp media import ./data/products/24-taxi/gallery/armchair_taxi_0000_004.jpg --post_id=$_ARMXXX045001b7 --porcelain`
_ARMXXX045001b7_4=`wp media import ./data/products/24-taxi/gallery/armchair_taxi_0001_005.jpg --post_id=$_ARMXXX045001b7 --porcelain`
_ARMXXX045001b7_5=`wp media import ./data/products/24-taxi/gallery/armchair_taxi_0002_006.jpg --post_id=$_ARMXXX045001b7 --porcelain`
_ARMXXX045001b7_6=`wp media import ./data/products/24-taxi/gallery/armchair_taxi_0003_007.jpg --post_id=$_ARMXXX045001b7 --porcelain`
_ARMXXX045001b7_7=`wp media import ./data/products/24-taxi/gallery/armchair_taxi_0004_008.jpg --post_id=$_ARMXXX045001b7 --porcelain`
wp post meta update $_ARMXXX045001b7 _product_image_gallery $_ARMXXX045001b7_0,$_ARMXXX045001b7_1,$_ARMXXX045001b7_2,$_ARMXXX045001b7_3,$_ARMXXX045001b7_4,$_ARMXXX045001b7_5,$_ARMXXX045001b7_6,$_ARMXXX045001b7_7
echo "Creating Variation: taxi-001"
_ARM0010d010275=`wp post create --post_title="taxi-001" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7001 --porcelain`
echo "Setting meta for product: taxi-001 Variation: 001"
wp post meta update $_ARM0010d010275 _visibility visible
wp post meta update $_ARM0010d010275 attribute_edb_material 001
wp post meta update $_ARM0010d010275 _stock 2
wp post meta update $_ARM0010d010275 _stock_status instock
wp post meta update $_ARM0010d010275 _manage_stock yes
wp post meta update $_ARM0010d010275 _backorders yes
wp post meta update $_ARM0010d010275 _price 350.00
wp post meta update $_ARM0010d010275 _regular_price 350.00
wp post meta update $_ARM0010d010275 _sku ARM0010d010275
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0010d010275 --featured_image=true
echo "Creating Variation: taxi-002"
_ARM0020d020276=`wp post create --post_title="taxi-002" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7002 --porcelain`
echo "Setting meta for product: taxi-002 Variation: 002"
wp post meta update $_ARM0020d020276 _visibility visible
wp post meta update $_ARM0020d020276 attribute_edb_material 002
wp post meta update $_ARM0020d020276 _stock 2
wp post meta update $_ARM0020d020276 _stock_status instock
wp post meta update $_ARM0020d020276 _manage_stock yes
wp post meta update $_ARM0020d020276 _backorders yes
wp post meta update $_ARM0020d020276 _price 350.00
wp post meta update $_ARM0020d020276 _regular_price 350.00
wp post meta update $_ARM0020d020276 _sku ARM0020d020276
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0020d020276 --featured_image=true
echo "Creating Variation: taxi-003"
_ARM0030d030277=`wp post create --post_title="taxi-003" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7003 --porcelain`
echo "Setting meta for product: taxi-003 Variation: 003"
wp post meta update $_ARM0030d030277 _visibility visible
wp post meta update $_ARM0030d030277 attribute_edb_material 003
wp post meta update $_ARM0030d030277 _stock 2
wp post meta update $_ARM0030d030277 _stock_status instock
wp post meta update $_ARM0030d030277 _manage_stock yes
wp post meta update $_ARM0030d030277 _backorders yes
wp post meta update $_ARM0030d030277 _price 350.00
wp post meta update $_ARM0030d030277 _regular_price 350.00
wp post meta update $_ARM0030d030277 _sku ARM0030d030277
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0030d030277 --featured_image=true
echo "Creating Variation: taxi-004"
_ARM0040d040278=`wp post create --post_title="taxi-004" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7004 --porcelain`
echo "Setting meta for product: taxi-004 Variation: 004"
wp post meta update $_ARM0040d040278 _visibility visible
wp post meta update $_ARM0040d040278 attribute_edb_material 004
wp post meta update $_ARM0040d040278 _stock 2
wp post meta update $_ARM0040d040278 _stock_status instock
wp post meta update $_ARM0040d040278 _manage_stock yes
wp post meta update $_ARM0040d040278 _backorders yes
wp post meta update $_ARM0040d040278 _price 350.00
wp post meta update $_ARM0040d040278 _regular_price 350.00
wp post meta update $_ARM0040d040278 _sku ARM0040d040278
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0040d040278 --featured_image=true
echo "Creating Variation: taxi-005"
_ARM0050d050279=`wp post create --post_title="taxi-005" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7005 --porcelain`
echo "Setting meta for product: taxi-005 Variation: 005"
wp post meta update $_ARM0050d050279 _visibility visible
wp post meta update $_ARM0050d050279 attribute_edb_material 005
wp post meta update $_ARM0050d050279 _stock 2
wp post meta update $_ARM0050d050279 _stock_status instock
wp post meta update $_ARM0050d050279 _manage_stock yes
wp post meta update $_ARM0050d050279 _backorders yes
wp post meta update $_ARM0050d050279 _price 350.00
wp post meta update $_ARM0050d050279 _regular_price 350.00
wp post meta update $_ARM0050d050279 _sku ARM0050d050279
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0050d050279 --featured_image=true
echo "Creating Variation: taxi-006"
_ARM0060d06027a=`wp post create --post_title="taxi-006" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7006 --porcelain`
echo "Setting meta for product: taxi-006 Variation: 006"
wp post meta update $_ARM0060d06027a _visibility visible
wp post meta update $_ARM0060d06027a attribute_edb_material 006
wp post meta update $_ARM0060d06027a _stock 2
wp post meta update $_ARM0060d06027a _stock_status instock
wp post meta update $_ARM0060d06027a _manage_stock yes
wp post meta update $_ARM0060d06027a _backorders yes
wp post meta update $_ARM0060d06027a _price 350.00
wp post meta update $_ARM0060d06027a _regular_price 350.00
wp post meta update $_ARM0060d06027a _sku ARM0060d06027a
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0060d06027a --featured_image=true
echo "Creating Variation: taxi-007"
_ARM0070d07027b=`wp post create --post_title="taxi-007" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7007 --porcelain`
echo "Setting meta for product: taxi-007 Variation: 007"
wp post meta update $_ARM0070d07027b _visibility visible
wp post meta update $_ARM0070d07027b attribute_edb_material 007
wp post meta update $_ARM0070d07027b _stock 2
wp post meta update $_ARM0070d07027b _stock_status instock
wp post meta update $_ARM0070d07027b _manage_stock yes
wp post meta update $_ARM0070d07027b _backorders yes
wp post meta update $_ARM0070d07027b _price 350.00
wp post meta update $_ARM0070d07027b _regular_price 350.00
wp post meta update $_ARM0070d07027b _sku ARM0070d07027b
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0070d07027b --featured_image=true
echo "Creating Variation: taxi-008"
_ARM0080d08027c=`wp post create --post_title="taxi-008" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7008 --porcelain`
echo "Setting meta for product: taxi-008 Variation: 008"
wp post meta update $_ARM0080d08027c _visibility visible
wp post meta update $_ARM0080d08027c attribute_edb_material 008
wp post meta update $_ARM0080d08027c _stock 2
wp post meta update $_ARM0080d08027c _stock_status instock
wp post meta update $_ARM0080d08027c _manage_stock yes
wp post meta update $_ARM0080d08027c _backorders yes
wp post meta update $_ARM0080d08027c _price 350.00
wp post meta update $_ARM0080d08027c _regular_price 350.00
wp post meta update $_ARM0080d08027c _sku ARM0080d08027c
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0080d08027c --featured_image=true
echo "Creating Variation: taxi-009"
_ARM0090d09027d=`wp post create --post_title="taxi-009" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7009 --porcelain`
echo "Setting meta for product: taxi-009 Variation: 009"
wp post meta update $_ARM0090d09027d _visibility visible
wp post meta update $_ARM0090d09027d attribute_edb_material 009
wp post meta update $_ARM0090d09027d _stock 2
wp post meta update $_ARM0090d09027d _stock_status instock
wp post meta update $_ARM0090d09027d _manage_stock yes
wp post meta update $_ARM0090d09027d _backorders yes
wp post meta update $_ARM0090d09027d _price 350.00
wp post meta update $_ARM0090d09027d _regular_price 350.00
wp post meta update $_ARM0090d09027d _sku ARM0090d09027d
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0090d09027d --featured_image=true
echo "Creating Variation: taxi-010"
_ARM0100d020275=`wp post create --post_title="taxi-010" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7010 --porcelain`
echo "Setting meta for product: taxi-010 Variation: 010"
wp post meta update $_ARM0100d020275 _visibility visible
wp post meta update $_ARM0100d020275 attribute_edb_material 010
wp post meta update $_ARM0100d020275 _stock 2
wp post meta update $_ARM0100d020275 _stock_status instock
wp post meta update $_ARM0100d020275 _manage_stock yes
wp post meta update $_ARM0100d020275 _backorders yes
wp post meta update $_ARM0100d020275 _price 350.00
wp post meta update $_ARM0100d020275 _regular_price 350.00
wp post meta update $_ARM0100d020275 _sku ARM0100d020275
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0100d020275 --featured_image=true
echo "Creating Variation: taxi-011"
_ARM0110d030276=`wp post create --post_title="taxi-011" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7011 --porcelain`
echo "Setting meta for product: taxi-011 Variation: 011"
wp post meta update $_ARM0110d030276 _visibility visible
wp post meta update $_ARM0110d030276 attribute_edb_material 011
wp post meta update $_ARM0110d030276 _stock 2
wp post meta update $_ARM0110d030276 _stock_status instock
wp post meta update $_ARM0110d030276 _manage_stock yes
wp post meta update $_ARM0110d030276 _backorders yes
wp post meta update $_ARM0110d030276 _price 350.00
wp post meta update $_ARM0110d030276 _regular_price 350.00
wp post meta update $_ARM0110d030276 _sku ARM0110d030276
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0110d030276 --featured_image=true
echo "Creating Variation: taxi-012"
_ARM0120d040277=`wp post create --post_title="taxi-012" --post_parent=$_ARMXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_armxxx045001b7012 --porcelain`
echo "Setting meta for product: taxi-012 Variation: 012"
wp post meta update $_ARM0120d040277 _visibility visible
wp post meta update $_ARM0120d040277 attribute_edb_material 012
wp post meta update $_ARM0120d040277 _stock 2
wp post meta update $_ARM0120d040277 _stock_status instock
wp post meta update $_ARM0120d040277 _manage_stock yes
wp post meta update $_ARM0120d040277 _backorders yes
wp post meta update $_ARM0120d040277 _price 350.00
wp post meta update $_ARM0120d040277 _regular_price 350.00
wp post meta update $_ARM0120d040277 _sku ARM0120d040277
wp media import ./data/products/24-taxi/gallery/armchair_taxi_000.jpg --post_id=$_ARM0120d040277 --featured_image=true
echo "Creating Product: slope"
_ARMXXX06860224=`wp post create --post_title="slope" --menu_order=23 --post_name="slope_armxxx06860224" --post_content='{:en}Shabby elegance. If you seek an affordable, cosy and relax sofa, look no further. The Slope sofa fulfils all these functions and more. The feather and foam cushions provide great comfort. The loosely fitted slipcover gives a sense of informality and restfulness. {:}{:fr}L'\''élégance shabby chic par excellence. Un canapé détente qui assure ce petit côté cosy tant recherché. Bien qu'\''offert à prix très abordable, Slope propose des coussins plumes et mousse du plus grand confort. Légèrement ample, sa housse exprime une certaine nonchalance décontractée et un caractère très informel.{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: slope"
wp post meta update $_ARMXXX06860224 _visibility visible
wp post meta update $_ARMXXX06860224 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_ARMXXX06860224 _price 350.00
wp post meta update $_ARMXXX06860224 _regular_price 350.00
wp post term set $_ARMXXX06860224 product_shipping_class furniture
wp post term set $_ARMXXX06860224 product_cat armchairs
wp post term set $_ARMXXX06860224 product_type variable
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARMXXX06860224 --featured_image=true
_ARMXXX06860224_0=`wp media import ./data/products/23-slope/gallery/armchair_slope_0000_001.jpg --post_id=$_ARMXXX06860224 --porcelain`
_ARMXXX06860224_1=`wp media import ./data/products/23-slope/gallery/armchair_slope_0001_002.jpg --post_id=$_ARMXXX06860224 --porcelain`
_ARMXXX06860224_2=`wp media import ./data/products/23-slope/gallery/armchair_slope_0002_003.jpg --post_id=$_ARMXXX06860224 --porcelain`
_ARMXXX06860224_3=`wp media import ./data/products/23-slope/gallery/slope_0000_004.jpg --post_id=$_ARMXXX06860224 --porcelain`
_ARMXXX06860224_4=`wp media import ./data/products/23-slope/gallery/slope_0001_005.jpg --post_id=$_ARMXXX06860224 --porcelain`
_ARMXXX06860224_5=`wp media import ./data/products/23-slope/gallery/slope_0002_006.jpg --post_id=$_ARMXXX06860224 --porcelain`
_ARMXXX06860224_6=`wp media import ./data/products/23-slope/gallery/slope_0003_007.jpg --post_id=$_ARMXXX06860224 --porcelain`
wp post meta update $_ARMXXX06860224 _product_image_gallery $_ARMXXX06860224_0,$_ARMXXX06860224_1,$_ARMXXX06860224_2,$_ARMXXX06860224_3,$_ARMXXX06860224_4,$_ARMXXX06860224_5,$_ARMXXX06860224_6
echo "Creating Variation: slope-001"
_ARM00110eb02e2=`wp post create --post_title="slope-001" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224001 --porcelain`
echo "Setting meta for product: slope-001 Variation: 001"
wp post meta update $_ARM00110eb02e2 _visibility visible
wp post meta update $_ARM00110eb02e2 attribute_edb_material 001
wp post meta update $_ARM00110eb02e2 _stock 2
wp post meta update $_ARM00110eb02e2 _stock_status instock
wp post meta update $_ARM00110eb02e2 _manage_stock yes
wp post meta update $_ARM00110eb02e2 _backorders yes
wp post meta update $_ARM00110eb02e2 _price 350.00
wp post meta update $_ARM00110eb02e2 _regular_price 350.00
wp post meta update $_ARM00110eb02e2 _sku ARM00110eb02e2
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM00110eb02e2 --featured_image=true
echo "Creating Variation: slope-002"
_ARM00210ec02e3=`wp post create --post_title="slope-002" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224002 --porcelain`
echo "Setting meta for product: slope-002 Variation: 002"
wp post meta update $_ARM00210ec02e3 _visibility visible
wp post meta update $_ARM00210ec02e3 attribute_edb_material 002
wp post meta update $_ARM00210ec02e3 _stock 2
wp post meta update $_ARM00210ec02e3 _stock_status instock
wp post meta update $_ARM00210ec02e3 _manage_stock yes
wp post meta update $_ARM00210ec02e3 _backorders yes
wp post meta update $_ARM00210ec02e3 _price 350.00
wp post meta update $_ARM00210ec02e3 _regular_price 350.00
wp post meta update $_ARM00210ec02e3 _sku ARM00210ec02e3
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM00210ec02e3 --featured_image=true
echo "Creating Variation: slope-003"
_ARM00310ed02e4=`wp post create --post_title="slope-003" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224003 --porcelain`
echo "Setting meta for product: slope-003 Variation: 003"
wp post meta update $_ARM00310ed02e4 _visibility visible
wp post meta update $_ARM00310ed02e4 attribute_edb_material 003
wp post meta update $_ARM00310ed02e4 _stock 2
wp post meta update $_ARM00310ed02e4 _stock_status instock
wp post meta update $_ARM00310ed02e4 _manage_stock yes
wp post meta update $_ARM00310ed02e4 _backorders yes
wp post meta update $_ARM00310ed02e4 _price 350.00
wp post meta update $_ARM00310ed02e4 _regular_price 350.00
wp post meta update $_ARM00310ed02e4 _sku ARM00310ed02e4
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM00310ed02e4 --featured_image=true
echo "Creating Variation: slope-004"
_ARM00410ee02e5=`wp post create --post_title="slope-004" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224004 --porcelain`
echo "Setting meta for product: slope-004 Variation: 004"
wp post meta update $_ARM00410ee02e5 _visibility visible
wp post meta update $_ARM00410ee02e5 attribute_edb_material 004
wp post meta update $_ARM00410ee02e5 _stock 2
wp post meta update $_ARM00410ee02e5 _stock_status instock
wp post meta update $_ARM00410ee02e5 _manage_stock yes
wp post meta update $_ARM00410ee02e5 _backorders yes
wp post meta update $_ARM00410ee02e5 _price 350.00
wp post meta update $_ARM00410ee02e5 _regular_price 350.00
wp post meta update $_ARM00410ee02e5 _sku ARM00410ee02e5
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM00410ee02e5 --featured_image=true
echo "Creating Variation: slope-005"
_ARM00510ef02e6=`wp post create --post_title="slope-005" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224005 --porcelain`
echo "Setting meta for product: slope-005 Variation: 005"
wp post meta update $_ARM00510ef02e6 _visibility visible
wp post meta update $_ARM00510ef02e6 attribute_edb_material 005
wp post meta update $_ARM00510ef02e6 _stock 2
wp post meta update $_ARM00510ef02e6 _stock_status instock
wp post meta update $_ARM00510ef02e6 _manage_stock yes
wp post meta update $_ARM00510ef02e6 _backorders yes
wp post meta update $_ARM00510ef02e6 _price 350.00
wp post meta update $_ARM00510ef02e6 _regular_price 350.00
wp post meta update $_ARM00510ef02e6 _sku ARM00510ef02e6
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM00510ef02e6 --featured_image=true
echo "Creating Variation: slope-006"
_ARM00610f002e7=`wp post create --post_title="slope-006" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224006 --porcelain`
echo "Setting meta for product: slope-006 Variation: 006"
wp post meta update $_ARM00610f002e7 _visibility visible
wp post meta update $_ARM00610f002e7 attribute_edb_material 006
wp post meta update $_ARM00610f002e7 _stock 2
wp post meta update $_ARM00610f002e7 _stock_status instock
wp post meta update $_ARM00610f002e7 _manage_stock yes
wp post meta update $_ARM00610f002e7 _backorders yes
wp post meta update $_ARM00610f002e7 _price 350.00
wp post meta update $_ARM00610f002e7 _regular_price 350.00
wp post meta update $_ARM00610f002e7 _sku ARM00610f002e7
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM00610f002e7 --featured_image=true
echo "Creating Variation: slope-007"
_ARM00710f102e8=`wp post create --post_title="slope-007" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224007 --porcelain`
echo "Setting meta for product: slope-007 Variation: 007"
wp post meta update $_ARM00710f102e8 _visibility visible
wp post meta update $_ARM00710f102e8 attribute_edb_material 007
wp post meta update $_ARM00710f102e8 _stock 2
wp post meta update $_ARM00710f102e8 _stock_status instock
wp post meta update $_ARM00710f102e8 _manage_stock yes
wp post meta update $_ARM00710f102e8 _backorders yes
wp post meta update $_ARM00710f102e8 _price 350.00
wp post meta update $_ARM00710f102e8 _regular_price 350.00
wp post meta update $_ARM00710f102e8 _sku ARM00710f102e8
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM00710f102e8 --featured_image=true
echo "Creating Variation: slope-008"
_ARM00810f202e9=`wp post create --post_title="slope-008" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224008 --porcelain`
echo "Setting meta for product: slope-008 Variation: 008"
wp post meta update $_ARM00810f202e9 _visibility visible
wp post meta update $_ARM00810f202e9 attribute_edb_material 008
wp post meta update $_ARM00810f202e9 _stock 2
wp post meta update $_ARM00810f202e9 _stock_status instock
wp post meta update $_ARM00810f202e9 _manage_stock yes
wp post meta update $_ARM00810f202e9 _backorders yes
wp post meta update $_ARM00810f202e9 _price 350.00
wp post meta update $_ARM00810f202e9 _regular_price 350.00
wp post meta update $_ARM00810f202e9 _sku ARM00810f202e9
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM00810f202e9 --featured_image=true
echo "Creating Variation: slope-009"
_ARM00910f302ea=`wp post create --post_title="slope-009" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224009 --porcelain`
echo "Setting meta for product: slope-009 Variation: 009"
wp post meta update $_ARM00910f302ea _visibility visible
wp post meta update $_ARM00910f302ea attribute_edb_material 009
wp post meta update $_ARM00910f302ea _stock 2
wp post meta update $_ARM00910f302ea _stock_status instock
wp post meta update $_ARM00910f302ea _manage_stock yes
wp post meta update $_ARM00910f302ea _backorders yes
wp post meta update $_ARM00910f302ea _price 350.00
wp post meta update $_ARM00910f302ea _regular_price 350.00
wp post meta update $_ARM00910f302ea _sku ARM00910f302ea
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM00910f302ea --featured_image=true
echo "Creating Variation: slope-010"
_ARM01010ec02e2=`wp post create --post_title="slope-010" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224010 --porcelain`
echo "Setting meta for product: slope-010 Variation: 010"
wp post meta update $_ARM01010ec02e2 _visibility visible
wp post meta update $_ARM01010ec02e2 attribute_edb_material 010
wp post meta update $_ARM01010ec02e2 _stock 2
wp post meta update $_ARM01010ec02e2 _stock_status instock
wp post meta update $_ARM01010ec02e2 _manage_stock yes
wp post meta update $_ARM01010ec02e2 _backorders yes
wp post meta update $_ARM01010ec02e2 _price 350.00
wp post meta update $_ARM01010ec02e2 _regular_price 350.00
wp post meta update $_ARM01010ec02e2 _sku ARM01010ec02e2
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM01010ec02e2 --featured_image=true
echo "Creating Variation: slope-011"
_ARM01110ed02e3=`wp post create --post_title="slope-011" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224011 --porcelain`
echo "Setting meta for product: slope-011 Variation: 011"
wp post meta update $_ARM01110ed02e3 _visibility visible
wp post meta update $_ARM01110ed02e3 attribute_edb_material 011
wp post meta update $_ARM01110ed02e3 _stock 2
wp post meta update $_ARM01110ed02e3 _stock_status instock
wp post meta update $_ARM01110ed02e3 _manage_stock yes
wp post meta update $_ARM01110ed02e3 _backorders yes
wp post meta update $_ARM01110ed02e3 _price 350.00
wp post meta update $_ARM01110ed02e3 _regular_price 350.00
wp post meta update $_ARM01110ed02e3 _sku ARM01110ed02e3
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM01110ed02e3 --featured_image=true
echo "Creating Variation: slope-012"
_ARM01210ee02e4=`wp post create --post_title="slope-012" --post_parent=$_ARMXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_armxxx06860224012 --porcelain`
echo "Setting meta for product: slope-012 Variation: 012"
wp post meta update $_ARM01210ee02e4 _visibility visible
wp post meta update $_ARM01210ee02e4 attribute_edb_material 012
wp post meta update $_ARM01210ee02e4 _stock 2
wp post meta update $_ARM01210ee02e4 _stock_status instock
wp post meta update $_ARM01210ee02e4 _manage_stock yes
wp post meta update $_ARM01210ee02e4 _backorders yes
wp post meta update $_ARM01210ee02e4 _price 350.00
wp post meta update $_ARM01210ee02e4 _regular_price 350.00
wp post meta update $_ARM01210ee02e4 _sku ARM01210ee02e4
wp media import ./data/products/23-slope/gallery/slope_0000_000.jpg --post_id=$_ARM01210ee02e4 --featured_image=true
echo "Creating Product: swivel"
_ARMXXX0947029b=`wp post create --post_title="swivel" --menu_order=22 --post_name="swivel_armxxx0947029b" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: swivel"
wp post meta update $_ARMXXX0947029b _visibility visible
wp post meta update $_ARMXXX0947029b _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_ARMXXX0947029b _price 350.00
wp post meta update $_ARMXXX0947029b _regular_price 350.00
wp post term set $_ARMXXX0947029b product_shipping_class furniture
wp post term set $_ARMXXX0947029b product_cat armchairs
wp post term set $_ARMXXX0947029b product_type variable
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARMXXX0947029b --featured_image=true
_ARMXXX0947029b_0=`wp media import ./data/products/22-swivel/gallery/armchair_swivel_0000_001.jpg --post_id=$_ARMXXX0947029b --porcelain`
_ARMXXX0947029b_1=`wp media import ./data/products/22-swivel/gallery/armchair_swivel_0001_002.jpg --post_id=$_ARMXXX0947029b --porcelain`
_ARMXXX0947029b_2=`wp media import ./data/products/22-swivel/gallery/armchair_swivel_0002_003.jpg --post_id=$_ARMXXX0947029b --porcelain`
_ARMXXX0947029b_3=`wp media import ./data/products/22-swivel/gallery/swivel_0000_004.jpg --post_id=$_ARMXXX0947029b --porcelain`
_ARMXXX0947029b_4=`wp media import ./data/products/22-swivel/gallery/swivel_0001_005.jpg --post_id=$_ARMXXX0947029b --porcelain`
_ARMXXX0947029b_5=`wp media import ./data/products/22-swivel/gallery/swivel_0002_006.jpg --post_id=$_ARMXXX0947029b --porcelain`
_ARMXXX0947029b_6=`wp media import ./data/products/22-swivel/gallery/swivel_0003_007.jpg --post_id=$_ARMXXX0947029b --porcelain`
_ARMXXX0947029b_7=`wp media import ./data/products/22-swivel/gallery/swivel_0004_008.jpg --post_id=$_ARMXXX0947029b --porcelain`
wp post meta update $_ARMXXX0947029b _product_image_gallery $_ARMXXX0947029b_0,$_ARMXXX0947029b_1,$_ARMXXX0947029b_2,$_ARMXXX0947029b_3,$_ARMXXX0947029b_4,$_ARMXXX0947029b_5,$_ARMXXX0947029b_6,$_ARMXXX0947029b_7
echo "Creating Variation: swivel-001"
_ARM00115880359=`wp post create --post_title="swivel-001" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b001 --porcelain`
echo "Setting meta for product: swivel-001 Variation: 001"
wp post meta update $_ARM00115880359 _visibility visible
wp post meta update $_ARM00115880359 attribute_edb_material 001
wp post meta update $_ARM00115880359 _stock 2
wp post meta update $_ARM00115880359 _stock_status instock
wp post meta update $_ARM00115880359 _manage_stock yes
wp post meta update $_ARM00115880359 _backorders yes
wp post meta update $_ARM00115880359 _price 350.00
wp post meta update $_ARM00115880359 _regular_price 350.00
wp post meta update $_ARM00115880359 _sku ARM00115880359
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM00115880359 --featured_image=true
echo "Creating Variation: swivel-002"
_ARM0021589035a=`wp post create --post_title="swivel-002" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b002 --porcelain`
echo "Setting meta for product: swivel-002 Variation: 002"
wp post meta update $_ARM0021589035a _visibility visible
wp post meta update $_ARM0021589035a attribute_edb_material 002
wp post meta update $_ARM0021589035a _stock 2
wp post meta update $_ARM0021589035a _stock_status instock
wp post meta update $_ARM0021589035a _manage_stock yes
wp post meta update $_ARM0021589035a _backorders yes
wp post meta update $_ARM0021589035a _price 350.00
wp post meta update $_ARM0021589035a _regular_price 350.00
wp post meta update $_ARM0021589035a _sku ARM0021589035a
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM0021589035a --featured_image=true
echo "Creating Variation: swivel-003"
_ARM003158a035b=`wp post create --post_title="swivel-003" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b003 --porcelain`
echo "Setting meta for product: swivel-003 Variation: 003"
wp post meta update $_ARM003158a035b _visibility visible
wp post meta update $_ARM003158a035b attribute_edb_material 003
wp post meta update $_ARM003158a035b _stock 2
wp post meta update $_ARM003158a035b _stock_status instock
wp post meta update $_ARM003158a035b _manage_stock yes
wp post meta update $_ARM003158a035b _backorders yes
wp post meta update $_ARM003158a035b _price 350.00
wp post meta update $_ARM003158a035b _regular_price 350.00
wp post meta update $_ARM003158a035b _sku ARM003158a035b
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM003158a035b --featured_image=true
echo "Creating Variation: swivel-004"
_ARM004158b035c=`wp post create --post_title="swivel-004" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b004 --porcelain`
echo "Setting meta for product: swivel-004 Variation: 004"
wp post meta update $_ARM004158b035c _visibility visible
wp post meta update $_ARM004158b035c attribute_edb_material 004
wp post meta update $_ARM004158b035c _stock 2
wp post meta update $_ARM004158b035c _stock_status instock
wp post meta update $_ARM004158b035c _manage_stock yes
wp post meta update $_ARM004158b035c _backorders yes
wp post meta update $_ARM004158b035c _price 350.00
wp post meta update $_ARM004158b035c _regular_price 350.00
wp post meta update $_ARM004158b035c _sku ARM004158b035c
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM004158b035c --featured_image=true
echo "Creating Variation: swivel-005"
_ARM005158c035d=`wp post create --post_title="swivel-005" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b005 --porcelain`
echo "Setting meta for product: swivel-005 Variation: 005"
wp post meta update $_ARM005158c035d _visibility visible
wp post meta update $_ARM005158c035d attribute_edb_material 005
wp post meta update $_ARM005158c035d _stock 2
wp post meta update $_ARM005158c035d _stock_status instock
wp post meta update $_ARM005158c035d _manage_stock yes
wp post meta update $_ARM005158c035d _backorders yes
wp post meta update $_ARM005158c035d _price 350.00
wp post meta update $_ARM005158c035d _regular_price 350.00
wp post meta update $_ARM005158c035d _sku ARM005158c035d
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM005158c035d --featured_image=true
echo "Creating Variation: swivel-006"
_ARM006158d035e=`wp post create --post_title="swivel-006" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b006 --porcelain`
echo "Setting meta for product: swivel-006 Variation: 006"
wp post meta update $_ARM006158d035e _visibility visible
wp post meta update $_ARM006158d035e attribute_edb_material 006
wp post meta update $_ARM006158d035e _stock 2
wp post meta update $_ARM006158d035e _stock_status instock
wp post meta update $_ARM006158d035e _manage_stock yes
wp post meta update $_ARM006158d035e _backorders yes
wp post meta update $_ARM006158d035e _price 350.00
wp post meta update $_ARM006158d035e _regular_price 350.00
wp post meta update $_ARM006158d035e _sku ARM006158d035e
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM006158d035e --featured_image=true
echo "Creating Variation: swivel-007"
_ARM007158e035f=`wp post create --post_title="swivel-007" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b007 --porcelain`
echo "Setting meta for product: swivel-007 Variation: 007"
wp post meta update $_ARM007158e035f _visibility visible
wp post meta update $_ARM007158e035f attribute_edb_material 007
wp post meta update $_ARM007158e035f _stock 2
wp post meta update $_ARM007158e035f _stock_status instock
wp post meta update $_ARM007158e035f _manage_stock yes
wp post meta update $_ARM007158e035f _backorders yes
wp post meta update $_ARM007158e035f _price 350.00
wp post meta update $_ARM007158e035f _regular_price 350.00
wp post meta update $_ARM007158e035f _sku ARM007158e035f
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM007158e035f --featured_image=true
echo "Creating Variation: swivel-008"
_ARM008158f0360=`wp post create --post_title="swivel-008" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b008 --porcelain`
echo "Setting meta for product: swivel-008 Variation: 008"
wp post meta update $_ARM008158f0360 _visibility visible
wp post meta update $_ARM008158f0360 attribute_edb_material 008
wp post meta update $_ARM008158f0360 _stock 2
wp post meta update $_ARM008158f0360 _stock_status instock
wp post meta update $_ARM008158f0360 _manage_stock yes
wp post meta update $_ARM008158f0360 _backorders yes
wp post meta update $_ARM008158f0360 _price 350.00
wp post meta update $_ARM008158f0360 _regular_price 350.00
wp post meta update $_ARM008158f0360 _sku ARM008158f0360
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM008158f0360 --featured_image=true
echo "Creating Variation: swivel-009"
_ARM00915900361=`wp post create --post_title="swivel-009" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b009 --porcelain`
echo "Setting meta for product: swivel-009 Variation: 009"
wp post meta update $_ARM00915900361 _visibility visible
wp post meta update $_ARM00915900361 attribute_edb_material 009
wp post meta update $_ARM00915900361 _stock 2
wp post meta update $_ARM00915900361 _stock_status instock
wp post meta update $_ARM00915900361 _manage_stock yes
wp post meta update $_ARM00915900361 _backorders yes
wp post meta update $_ARM00915900361 _price 350.00
wp post meta update $_ARM00915900361 _regular_price 350.00
wp post meta update $_ARM00915900361 _sku ARM00915900361
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM00915900361 --featured_image=true
echo "Creating Variation: swivel-010"
_ARM01015890359=`wp post create --post_title="swivel-010" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b010 --porcelain`
echo "Setting meta for product: swivel-010 Variation: 010"
wp post meta update $_ARM01015890359 _visibility visible
wp post meta update $_ARM01015890359 attribute_edb_material 010
wp post meta update $_ARM01015890359 _stock 2
wp post meta update $_ARM01015890359 _stock_status instock
wp post meta update $_ARM01015890359 _manage_stock yes
wp post meta update $_ARM01015890359 _backorders yes
wp post meta update $_ARM01015890359 _price 350.00
wp post meta update $_ARM01015890359 _regular_price 350.00
wp post meta update $_ARM01015890359 _sku ARM01015890359
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM01015890359 --featured_image=true
echo "Creating Variation: swivel-011"
_ARM011158a035a=`wp post create --post_title="swivel-011" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b011 --porcelain`
echo "Setting meta for product: swivel-011 Variation: 011"
wp post meta update $_ARM011158a035a _visibility visible
wp post meta update $_ARM011158a035a attribute_edb_material 011
wp post meta update $_ARM011158a035a _stock 2
wp post meta update $_ARM011158a035a _stock_status instock
wp post meta update $_ARM011158a035a _manage_stock yes
wp post meta update $_ARM011158a035a _backorders yes
wp post meta update $_ARM011158a035a _price 350.00
wp post meta update $_ARM011158a035a _regular_price 350.00
wp post meta update $_ARM011158a035a _sku ARM011158a035a
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM011158a035a --featured_image=true
echo "Creating Variation: swivel-012"
_ARM012158b035b=`wp post create --post_title="swivel-012" --post_parent=$_ARMXXX0947029b --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=swivel_armxxx0947029b012 --porcelain`
echo "Setting meta for product: swivel-012 Variation: 012"
wp post meta update $_ARM012158b035b _visibility visible
wp post meta update $_ARM012158b035b attribute_edb_material 012
wp post meta update $_ARM012158b035b _stock 2
wp post meta update $_ARM012158b035b _stock_status instock
wp post meta update $_ARM012158b035b _manage_stock yes
wp post meta update $_ARM012158b035b _backorders yes
wp post meta update $_ARM012158b035b _price 350.00
wp post meta update $_ARM012158b035b _regular_price 350.00
wp post meta update $_ARM012158b035b _sku ARM012158b035b
wp media import ./data/products/22-swivel/gallery/swivel_0000_000.jpg --post_id=$_ARM012158b035b --featured_image=true
echo "Creating Product: ping"
_ARMXXX044201af=`wp post create --post_title="ping" --menu_order=21 --post_name="ping_armxxx044201af" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: ping"
wp post meta update $_ARMXXX044201af _visibility visible
wp post meta update $_ARMXXX044201af _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_ARMXXX044201af _price 350.00
wp post meta update $_ARMXXX044201af _regular_price 350.00
wp post term set $_ARMXXX044201af product_shipping_class furniture
wp post term set $_ARMXXX044201af product_cat armchairs
wp post term set $_ARMXXX044201af product_type variable
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARMXXX044201af --featured_image=true
_ARMXXX044201af_0=`wp media import ./data/products/21-ping/gallery/armchair_ping_0000_001.jpg --post_id=$_ARMXXX044201af --porcelain`
_ARMXXX044201af_1=`wp media import ./data/products/21-ping/gallery/armchair_ping_0001_002.jpg --post_id=$_ARMXXX044201af --porcelain`
_ARMXXX044201af_2=`wp media import ./data/products/21-ping/gallery/armchair_ping_0003_004.jpg --post_id=$_ARMXXX044201af --porcelain`
_ARMXXX044201af_3=`wp media import ./data/products/21-ping/gallery/ping_0000_005.jpg --post_id=$_ARMXXX044201af --porcelain`
_ARMXXX044201af_4=`wp media import ./data/products/21-ping/gallery/ping_0001_006.jpg --post_id=$_ARMXXX044201af --porcelain`
_ARMXXX044201af_5=`wp media import ./data/products/21-ping/gallery/ping_0002_007.jpg --post_id=$_ARMXXX044201af --porcelain`
_ARMXXX044201af_6=`wp media import ./data/products/21-ping/gallery/ping_0003_008.jpg --post_id=$_ARMXXX044201af --porcelain`
wp post meta update $_ARMXXX044201af _product_image_gallery $_ARMXXX044201af_0,$_ARMXXX044201af_1,$_ARMXXX044201af_2,$_ARMXXX044201af_3,$_ARMXXX044201af_4,$_ARMXXX044201af_5,$_ARMXXX044201af_6
echo "Creating Variation: ping-001"
_ARM0010cd3026d=`wp post create --post_title="ping-001" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af001 --porcelain`
echo "Setting meta for product: ping-001 Variation: 001"
wp post meta update $_ARM0010cd3026d _visibility visible
wp post meta update $_ARM0010cd3026d attribute_edb_material 001
wp post meta update $_ARM0010cd3026d _stock 2
wp post meta update $_ARM0010cd3026d _stock_status instock
wp post meta update $_ARM0010cd3026d _manage_stock yes
wp post meta update $_ARM0010cd3026d _backorders yes
wp post meta update $_ARM0010cd3026d _price 350.00
wp post meta update $_ARM0010cd3026d _regular_price 350.00
wp post meta update $_ARM0010cd3026d _sku ARM0010cd3026d
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0010cd3026d --featured_image=true
echo "Creating Variation: ping-002"
_ARM0020cd4026e=`wp post create --post_title="ping-002" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af002 --porcelain`
echo "Setting meta for product: ping-002 Variation: 002"
wp post meta update $_ARM0020cd4026e _visibility visible
wp post meta update $_ARM0020cd4026e attribute_edb_material 002
wp post meta update $_ARM0020cd4026e _stock 2
wp post meta update $_ARM0020cd4026e _stock_status instock
wp post meta update $_ARM0020cd4026e _manage_stock yes
wp post meta update $_ARM0020cd4026e _backorders yes
wp post meta update $_ARM0020cd4026e _price 350.00
wp post meta update $_ARM0020cd4026e _regular_price 350.00
wp post meta update $_ARM0020cd4026e _sku ARM0020cd4026e
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0020cd4026e --featured_image=true
echo "Creating Variation: ping-003"
_ARM0030cd5026f=`wp post create --post_title="ping-003" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af003 --porcelain`
echo "Setting meta for product: ping-003 Variation: 003"
wp post meta update $_ARM0030cd5026f _visibility visible
wp post meta update $_ARM0030cd5026f attribute_edb_material 003
wp post meta update $_ARM0030cd5026f _stock 2
wp post meta update $_ARM0030cd5026f _stock_status instock
wp post meta update $_ARM0030cd5026f _manage_stock yes
wp post meta update $_ARM0030cd5026f _backorders yes
wp post meta update $_ARM0030cd5026f _price 350.00
wp post meta update $_ARM0030cd5026f _regular_price 350.00
wp post meta update $_ARM0030cd5026f _sku ARM0030cd5026f
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0030cd5026f --featured_image=true
echo "Creating Variation: ping-004"
_ARM0040cd60270=`wp post create --post_title="ping-004" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af004 --porcelain`
echo "Setting meta for product: ping-004 Variation: 004"
wp post meta update $_ARM0040cd60270 _visibility visible
wp post meta update $_ARM0040cd60270 attribute_edb_material 004
wp post meta update $_ARM0040cd60270 _stock 2
wp post meta update $_ARM0040cd60270 _stock_status instock
wp post meta update $_ARM0040cd60270 _manage_stock yes
wp post meta update $_ARM0040cd60270 _backorders yes
wp post meta update $_ARM0040cd60270 _price 350.00
wp post meta update $_ARM0040cd60270 _regular_price 350.00
wp post meta update $_ARM0040cd60270 _sku ARM0040cd60270
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0040cd60270 --featured_image=true
echo "Creating Variation: ping-005"
_ARM0050cd70271=`wp post create --post_title="ping-005" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af005 --porcelain`
echo "Setting meta for product: ping-005 Variation: 005"
wp post meta update $_ARM0050cd70271 _visibility visible
wp post meta update $_ARM0050cd70271 attribute_edb_material 005
wp post meta update $_ARM0050cd70271 _stock 2
wp post meta update $_ARM0050cd70271 _stock_status instock
wp post meta update $_ARM0050cd70271 _manage_stock yes
wp post meta update $_ARM0050cd70271 _backorders yes
wp post meta update $_ARM0050cd70271 _price 350.00
wp post meta update $_ARM0050cd70271 _regular_price 350.00
wp post meta update $_ARM0050cd70271 _sku ARM0050cd70271
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0050cd70271 --featured_image=true
echo "Creating Variation: ping-006"
_ARM0060cd80272=`wp post create --post_title="ping-006" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af006 --porcelain`
echo "Setting meta for product: ping-006 Variation: 006"
wp post meta update $_ARM0060cd80272 _visibility visible
wp post meta update $_ARM0060cd80272 attribute_edb_material 006
wp post meta update $_ARM0060cd80272 _stock 2
wp post meta update $_ARM0060cd80272 _stock_status instock
wp post meta update $_ARM0060cd80272 _manage_stock yes
wp post meta update $_ARM0060cd80272 _backorders yes
wp post meta update $_ARM0060cd80272 _price 350.00
wp post meta update $_ARM0060cd80272 _regular_price 350.00
wp post meta update $_ARM0060cd80272 _sku ARM0060cd80272
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0060cd80272 --featured_image=true
echo "Creating Variation: ping-007"
_ARM0070cd90273=`wp post create --post_title="ping-007" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af007 --porcelain`
echo "Setting meta for product: ping-007 Variation: 007"
wp post meta update $_ARM0070cd90273 _visibility visible
wp post meta update $_ARM0070cd90273 attribute_edb_material 007
wp post meta update $_ARM0070cd90273 _stock 2
wp post meta update $_ARM0070cd90273 _stock_status instock
wp post meta update $_ARM0070cd90273 _manage_stock yes
wp post meta update $_ARM0070cd90273 _backorders yes
wp post meta update $_ARM0070cd90273 _price 350.00
wp post meta update $_ARM0070cd90273 _regular_price 350.00
wp post meta update $_ARM0070cd90273 _sku ARM0070cd90273
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0070cd90273 --featured_image=true
echo "Creating Variation: ping-008"
_ARM0080cda0274=`wp post create --post_title="ping-008" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af008 --porcelain`
echo "Setting meta for product: ping-008 Variation: 008"
wp post meta update $_ARM0080cda0274 _visibility visible
wp post meta update $_ARM0080cda0274 attribute_edb_material 008
wp post meta update $_ARM0080cda0274 _stock 2
wp post meta update $_ARM0080cda0274 _stock_status instock
wp post meta update $_ARM0080cda0274 _manage_stock yes
wp post meta update $_ARM0080cda0274 _backorders yes
wp post meta update $_ARM0080cda0274 _price 350.00
wp post meta update $_ARM0080cda0274 _regular_price 350.00
wp post meta update $_ARM0080cda0274 _sku ARM0080cda0274
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0080cda0274 --featured_image=true
echo "Creating Variation: ping-009"
_ARM0090cdb0275=`wp post create --post_title="ping-009" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af009 --porcelain`
echo "Setting meta for product: ping-009 Variation: 009"
wp post meta update $_ARM0090cdb0275 _visibility visible
wp post meta update $_ARM0090cdb0275 attribute_edb_material 009
wp post meta update $_ARM0090cdb0275 _stock 2
wp post meta update $_ARM0090cdb0275 _stock_status instock
wp post meta update $_ARM0090cdb0275 _manage_stock yes
wp post meta update $_ARM0090cdb0275 _backorders yes
wp post meta update $_ARM0090cdb0275 _price 350.00
wp post meta update $_ARM0090cdb0275 _regular_price 350.00
wp post meta update $_ARM0090cdb0275 _sku ARM0090cdb0275
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0090cdb0275 --featured_image=true
echo "Creating Variation: ping-010"
_ARM0100cd4026d=`wp post create --post_title="ping-010" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af010 --porcelain`
echo "Setting meta for product: ping-010 Variation: 010"
wp post meta update $_ARM0100cd4026d _visibility visible
wp post meta update $_ARM0100cd4026d attribute_edb_material 010
wp post meta update $_ARM0100cd4026d _stock 2
wp post meta update $_ARM0100cd4026d _stock_status instock
wp post meta update $_ARM0100cd4026d _manage_stock yes
wp post meta update $_ARM0100cd4026d _backorders yes
wp post meta update $_ARM0100cd4026d _price 350.00
wp post meta update $_ARM0100cd4026d _regular_price 350.00
wp post meta update $_ARM0100cd4026d _sku ARM0100cd4026d
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0100cd4026d --featured_image=true
echo "Creating Variation: ping-011"
_ARM0110cd5026e=`wp post create --post_title="ping-011" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af011 --porcelain`
echo "Setting meta for product: ping-011 Variation: 011"
wp post meta update $_ARM0110cd5026e _visibility visible
wp post meta update $_ARM0110cd5026e attribute_edb_material 011
wp post meta update $_ARM0110cd5026e _stock 2
wp post meta update $_ARM0110cd5026e _stock_status instock
wp post meta update $_ARM0110cd5026e _manage_stock yes
wp post meta update $_ARM0110cd5026e _backorders yes
wp post meta update $_ARM0110cd5026e _price 350.00
wp post meta update $_ARM0110cd5026e _regular_price 350.00
wp post meta update $_ARM0110cd5026e _sku ARM0110cd5026e
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0110cd5026e --featured_image=true
echo "Creating Variation: ping-012"
_ARM0120cd6026f=`wp post create --post_title="ping-012" --post_parent=$_ARMXXX044201af --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=ping_armxxx044201af012 --porcelain`
echo "Setting meta for product: ping-012 Variation: 012"
wp post meta update $_ARM0120cd6026f _visibility visible
wp post meta update $_ARM0120cd6026f attribute_edb_material 012
wp post meta update $_ARM0120cd6026f _stock 2
wp post meta update $_ARM0120cd6026f _stock_status instock
wp post meta update $_ARM0120cd6026f _manage_stock yes
wp post meta update $_ARM0120cd6026f _backorders yes
wp post meta update $_ARM0120cd6026f _price 350.00
wp post meta update $_ARM0120cd6026f _regular_price 350.00
wp post meta update $_ARM0120cd6026f _sku ARM0120cd6026f
wp media import ./data/products/21-ping/gallery/ping_0000_000.jpg --post_id=$_ARM0120cd6026f --featured_image=true
echo "Creating Product: atrium"
_ARMXXX08ea0293=`wp post create --post_title="atrium" --menu_order=20 --post_name="atrium_armxxx08ea0293" --post_content='{:en}The strength of simple lines. Thin arms and soft cushions characterize the Atrium sofa. With its pure and rigorous rectangular volume, the shape is enduring. A touch of timelessness at home. {:}{:fr}La force de la ligne. Un superbe volume composé de lignes pures, simples et rigoureuses à la fois. Un seul coussin pour le dossier, un seul pour le siège et le réconfort de deux traversins en bout de ligne. Que du caractère. Et aussi une beauté intemporelle.{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: atrium"
wp post meta update $_ARMXXX08ea0293 _visibility visible
wp post meta update $_ARMXXX08ea0293 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_ARMXXX08ea0293 _price 350.00
wp post meta update $_ARMXXX08ea0293 _regular_price 350.00
wp post term set $_ARMXXX08ea0293 product_shipping_class furniture
wp post term set $_ARMXXX08ea0293 product_cat armchairs
wp post term set $_ARMXXX08ea0293 product_type variable
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARMXXX08ea0293 --featured_image=true
_ARMXXX08ea0293_0=`wp media import ./data/products/20-atrium/gallery/armchair_atrium_0000_001.jpg --post_id=$_ARMXXX08ea0293 --porcelain`
_ARMXXX08ea0293_1=`wp media import ./data/products/20-atrium/gallery/armchair_atrium_0001_002.jpg --post_id=$_ARMXXX08ea0293 --porcelain`
_ARMXXX08ea0293_2=`wp media import ./data/products/20-atrium/gallery/atrium_0000_003.jpg --post_id=$_ARMXXX08ea0293 --porcelain`
_ARMXXX08ea0293_3=`wp media import ./data/products/20-atrium/gallery/atrium_0001_004.jpg --post_id=$_ARMXXX08ea0293 --porcelain`
_ARMXXX08ea0293_4=`wp media import ./data/products/20-atrium/gallery/atrium_0002_005.jpg --post_id=$_ARMXXX08ea0293 --porcelain`
_ARMXXX08ea0293_5=`wp media import ./data/products/20-atrium/gallery/atrium_0003_006.jpg --post_id=$_ARMXXX08ea0293 --porcelain`
_ARMXXX08ea0293_6=`wp media import ./data/products/20-atrium/gallery/atrium_0004_007.jpg --post_id=$_ARMXXX08ea0293 --porcelain`
wp post meta update $_ARMXXX08ea0293 _product_image_gallery $_ARMXXX08ea0293_0,$_ARMXXX08ea0293_1,$_ARMXXX08ea0293_2,$_ARMXXX08ea0293_3,$_ARMXXX08ea0293_4,$_ARMXXX08ea0293_5,$_ARMXXX08ea0293_6
echo "Creating Variation: atrium-001"
_ARM001150b0351=`wp post create --post_title="atrium-001" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293001 --porcelain`
echo "Setting meta for product: atrium-001 Variation: 001"
wp post meta update $_ARM001150b0351 _visibility visible
wp post meta update $_ARM001150b0351 attribute_edb_material 001
wp post meta update $_ARM001150b0351 _stock 2
wp post meta update $_ARM001150b0351 _stock_status instock
wp post meta update $_ARM001150b0351 _manage_stock yes
wp post meta update $_ARM001150b0351 _backorders yes
wp post meta update $_ARM001150b0351 _price 350.00
wp post meta update $_ARM001150b0351 _regular_price 350.00
wp post meta update $_ARM001150b0351 _sku ARM001150b0351
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM001150b0351 --featured_image=true
echo "Creating Variation: atrium-002"
_ARM002150c0352=`wp post create --post_title="atrium-002" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293002 --porcelain`
echo "Setting meta for product: atrium-002 Variation: 002"
wp post meta update $_ARM002150c0352 _visibility visible
wp post meta update $_ARM002150c0352 attribute_edb_material 002
wp post meta update $_ARM002150c0352 _stock 2
wp post meta update $_ARM002150c0352 _stock_status instock
wp post meta update $_ARM002150c0352 _manage_stock yes
wp post meta update $_ARM002150c0352 _backorders yes
wp post meta update $_ARM002150c0352 _price 350.00
wp post meta update $_ARM002150c0352 _regular_price 350.00
wp post meta update $_ARM002150c0352 _sku ARM002150c0352
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM002150c0352 --featured_image=true
echo "Creating Variation: atrium-003"
_ARM003150d0353=`wp post create --post_title="atrium-003" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293003 --porcelain`
echo "Setting meta for product: atrium-003 Variation: 003"
wp post meta update $_ARM003150d0353 _visibility visible
wp post meta update $_ARM003150d0353 attribute_edb_material 003
wp post meta update $_ARM003150d0353 _stock 2
wp post meta update $_ARM003150d0353 _stock_status instock
wp post meta update $_ARM003150d0353 _manage_stock yes
wp post meta update $_ARM003150d0353 _backorders yes
wp post meta update $_ARM003150d0353 _price 350.00
wp post meta update $_ARM003150d0353 _regular_price 350.00
wp post meta update $_ARM003150d0353 _sku ARM003150d0353
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM003150d0353 --featured_image=true
echo "Creating Variation: atrium-004"
_ARM004150e0354=`wp post create --post_title="atrium-004" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293004 --porcelain`
echo "Setting meta for product: atrium-004 Variation: 004"
wp post meta update $_ARM004150e0354 _visibility visible
wp post meta update $_ARM004150e0354 attribute_edb_material 004
wp post meta update $_ARM004150e0354 _stock 2
wp post meta update $_ARM004150e0354 _stock_status instock
wp post meta update $_ARM004150e0354 _manage_stock yes
wp post meta update $_ARM004150e0354 _backorders yes
wp post meta update $_ARM004150e0354 _price 350.00
wp post meta update $_ARM004150e0354 _regular_price 350.00
wp post meta update $_ARM004150e0354 _sku ARM004150e0354
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM004150e0354 --featured_image=true
echo "Creating Variation: atrium-005"
_ARM005150f0355=`wp post create --post_title="atrium-005" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293005 --porcelain`
echo "Setting meta for product: atrium-005 Variation: 005"
wp post meta update $_ARM005150f0355 _visibility visible
wp post meta update $_ARM005150f0355 attribute_edb_material 005
wp post meta update $_ARM005150f0355 _stock 2
wp post meta update $_ARM005150f0355 _stock_status instock
wp post meta update $_ARM005150f0355 _manage_stock yes
wp post meta update $_ARM005150f0355 _backorders yes
wp post meta update $_ARM005150f0355 _price 350.00
wp post meta update $_ARM005150f0355 _regular_price 350.00
wp post meta update $_ARM005150f0355 _sku ARM005150f0355
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM005150f0355 --featured_image=true
echo "Creating Variation: atrium-006"
_ARM00615100356=`wp post create --post_title="atrium-006" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293006 --porcelain`
echo "Setting meta for product: atrium-006 Variation: 006"
wp post meta update $_ARM00615100356 _visibility visible
wp post meta update $_ARM00615100356 attribute_edb_material 006
wp post meta update $_ARM00615100356 _stock 2
wp post meta update $_ARM00615100356 _stock_status instock
wp post meta update $_ARM00615100356 _manage_stock yes
wp post meta update $_ARM00615100356 _backorders yes
wp post meta update $_ARM00615100356 _price 350.00
wp post meta update $_ARM00615100356 _regular_price 350.00
wp post meta update $_ARM00615100356 _sku ARM00615100356
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM00615100356 --featured_image=true
echo "Creating Variation: atrium-007"
_ARM00715110357=`wp post create --post_title="atrium-007" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293007 --porcelain`
echo "Setting meta for product: atrium-007 Variation: 007"
wp post meta update $_ARM00715110357 _visibility visible
wp post meta update $_ARM00715110357 attribute_edb_material 007
wp post meta update $_ARM00715110357 _stock 2
wp post meta update $_ARM00715110357 _stock_status instock
wp post meta update $_ARM00715110357 _manage_stock yes
wp post meta update $_ARM00715110357 _backorders yes
wp post meta update $_ARM00715110357 _price 350.00
wp post meta update $_ARM00715110357 _regular_price 350.00
wp post meta update $_ARM00715110357 _sku ARM00715110357
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM00715110357 --featured_image=true
echo "Creating Variation: atrium-008"
_ARM00815120358=`wp post create --post_title="atrium-008" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293008 --porcelain`
echo "Setting meta for product: atrium-008 Variation: 008"
wp post meta update $_ARM00815120358 _visibility visible
wp post meta update $_ARM00815120358 attribute_edb_material 008
wp post meta update $_ARM00815120358 _stock 2
wp post meta update $_ARM00815120358 _stock_status instock
wp post meta update $_ARM00815120358 _manage_stock yes
wp post meta update $_ARM00815120358 _backorders yes
wp post meta update $_ARM00815120358 _price 350.00
wp post meta update $_ARM00815120358 _regular_price 350.00
wp post meta update $_ARM00815120358 _sku ARM00815120358
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM00815120358 --featured_image=true
echo "Creating Variation: atrium-009"
_ARM00915130359=`wp post create --post_title="atrium-009" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293009 --porcelain`
echo "Setting meta for product: atrium-009 Variation: 009"
wp post meta update $_ARM00915130359 _visibility visible
wp post meta update $_ARM00915130359 attribute_edb_material 009
wp post meta update $_ARM00915130359 _stock 2
wp post meta update $_ARM00915130359 _stock_status instock
wp post meta update $_ARM00915130359 _manage_stock yes
wp post meta update $_ARM00915130359 _backorders yes
wp post meta update $_ARM00915130359 _price 350.00
wp post meta update $_ARM00915130359 _regular_price 350.00
wp post meta update $_ARM00915130359 _sku ARM00915130359
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM00915130359 --featured_image=true
echo "Creating Variation: atrium-010"
_ARM010150c0351=`wp post create --post_title="atrium-010" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293010 --porcelain`
echo "Setting meta for product: atrium-010 Variation: 010"
wp post meta update $_ARM010150c0351 _visibility visible
wp post meta update $_ARM010150c0351 attribute_edb_material 010
wp post meta update $_ARM010150c0351 _stock 2
wp post meta update $_ARM010150c0351 _stock_status instock
wp post meta update $_ARM010150c0351 _manage_stock yes
wp post meta update $_ARM010150c0351 _backorders yes
wp post meta update $_ARM010150c0351 _price 350.00
wp post meta update $_ARM010150c0351 _regular_price 350.00
wp post meta update $_ARM010150c0351 _sku ARM010150c0351
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM010150c0351 --featured_image=true
echo "Creating Variation: atrium-011"
_ARM011150d0352=`wp post create --post_title="atrium-011" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293011 --porcelain`
echo "Setting meta for product: atrium-011 Variation: 011"
wp post meta update $_ARM011150d0352 _visibility visible
wp post meta update $_ARM011150d0352 attribute_edb_material 011
wp post meta update $_ARM011150d0352 _stock 2
wp post meta update $_ARM011150d0352 _stock_status instock
wp post meta update $_ARM011150d0352 _manage_stock yes
wp post meta update $_ARM011150d0352 _backorders yes
wp post meta update $_ARM011150d0352 _price 350.00
wp post meta update $_ARM011150d0352 _regular_price 350.00
wp post meta update $_ARM011150d0352 _sku ARM011150d0352
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM011150d0352 --featured_image=true
echo "Creating Variation: atrium-012"
_ARM012150e0353=`wp post create --post_title="atrium-012" --post_parent=$_ARMXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_armxxx08ea0293012 --porcelain`
echo "Setting meta for product: atrium-012 Variation: 012"
wp post meta update $_ARM012150e0353 _visibility visible
wp post meta update $_ARM012150e0353 attribute_edb_material 012
wp post meta update $_ARM012150e0353 _stock 2
wp post meta update $_ARM012150e0353 _stock_status instock
wp post meta update $_ARM012150e0353 _manage_stock yes
wp post meta update $_ARM012150e0353 _backorders yes
wp post meta update $_ARM012150e0353 _price 350.00
wp post meta update $_ARM012150e0353 _regular_price 350.00
wp post meta update $_ARM012150e0353 _sku ARM012150e0353
wp media import ./data/products/20-atrium/gallery/atrium_0000_000.jpg --post_id=$_ARM012150e0353 --featured_image=true
echo "Creating Product: maritime"
_ARMXXX0f1a0359=`wp post create --post_title="maritime" --menu_order=19 --post_name="maritime_armxxx0f1a0359" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: maritime"
wp post meta update $_ARMXXX0f1a0359 _subtitle "{:en}natural{:}{:fr}natural{:}"
wp post meta update $_ARMXXX0f1a0359 _visibility visible
wp post meta update $_ARMXXX0f1a0359 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_ARMXXX0f1a0359 _price 350.00
wp post meta update $_ARMXXX0f1a0359 _regular_price 350.00
wp post term set $_ARMXXX0f1a0359 product_shipping_class furniture
wp post term set $_ARMXXX0f1a0359 product_cat armchairs
wp post term set $_ARMXXX0f1a0359 product_type variable
wp post meta update $_ARMXXX0f1a0359 _subtitle "{:en}natural{:}{:fr}natural{:}"
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARMXXX0f1a0359 --featured_image=true
_ARMXXX0f1a0359_0=`wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_0000_001.jpg --post_id=$_ARMXXX0f1a0359 --porcelain`
_ARMXXX0f1a0359_1=`wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_0001_002.jpg --post_id=$_ARMXXX0f1a0359 --porcelain`
_ARMXXX0f1a0359_2=`wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_0002_003.jpg --post_id=$_ARMXXX0f1a0359 --porcelain`
_ARMXXX0f1a0359_3=`wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_0002_004.jpg --post_id=$_ARMXXX0f1a0359 --porcelain`
_ARMXXX0f1a0359_4=`wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_0002_005.jpg --post_id=$_ARMXXX0f1a0359 --porcelain`
_ARMXXX0f1a0359_5=`wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_0002_006.jpg --post_id=$_ARMXXX0f1a0359 --porcelain`
_ARMXXX0f1a0359_6=`wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_0002_007.jpg --post_id=$_ARMXXX0f1a0359 --porcelain`
_ARMXXX0f1a0359_7=`wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_0002_008.jpg --post_id=$_ARMXXX0f1a0359 --porcelain`
wp post meta update $_ARMXXX0f1a0359 _product_image_gallery $_ARMXXX0f1a0359_0,$_ARMXXX0f1a0359_1,$_ARMXXX0f1a0359_2,$_ARMXXX0f1a0359_3,$_ARMXXX0f1a0359_4,$_ARMXXX0f1a0359_5,$_ARMXXX0f1a0359_6,$_ARMXXX0f1a0359_7
echo "Creating Variation: maritime-001"
_ARM0011e530417=`wp post create --post_title="maritime-001" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359001 --porcelain`
echo "Setting meta for product: maritime-001 Variation: 001"
wp post meta update $_ARM0011e530417 _visibility visible
wp post meta update $_ARM0011e530417 attribute_edb_material 001
wp post meta update $_ARM0011e530417 _stock 2
wp post meta update $_ARM0011e530417 _stock_status instock
wp post meta update $_ARM0011e530417 _manage_stock yes
wp post meta update $_ARM0011e530417 _backorders yes
wp post meta update $_ARM0011e530417 _price 350.00
wp post meta update $_ARM0011e530417 _regular_price 350.00
wp post meta update $_ARM0011e530417 _sku ARM0011e530417
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0011e530417 --featured_image=true
echo "Creating Variation: maritime-002"
_ARM0021e540418=`wp post create --post_title="maritime-002" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359002 --porcelain`
echo "Setting meta for product: maritime-002 Variation: 002"
wp post meta update $_ARM0021e540418 _visibility visible
wp post meta update $_ARM0021e540418 attribute_edb_material 002
wp post meta update $_ARM0021e540418 _stock 2
wp post meta update $_ARM0021e540418 _stock_status instock
wp post meta update $_ARM0021e540418 _manage_stock yes
wp post meta update $_ARM0021e540418 _backorders yes
wp post meta update $_ARM0021e540418 _price 350.00
wp post meta update $_ARM0021e540418 _regular_price 350.00
wp post meta update $_ARM0021e540418 _sku ARM0021e540418
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0021e540418 --featured_image=true
echo "Creating Variation: maritime-003"
_ARM0031e550419=`wp post create --post_title="maritime-003" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359003 --porcelain`
echo "Setting meta for product: maritime-003 Variation: 003"
wp post meta update $_ARM0031e550419 _visibility visible
wp post meta update $_ARM0031e550419 attribute_edb_material 003
wp post meta update $_ARM0031e550419 _stock 2
wp post meta update $_ARM0031e550419 _stock_status instock
wp post meta update $_ARM0031e550419 _manage_stock yes
wp post meta update $_ARM0031e550419 _backorders yes
wp post meta update $_ARM0031e550419 _price 350.00
wp post meta update $_ARM0031e550419 _regular_price 350.00
wp post meta update $_ARM0031e550419 _sku ARM0031e550419
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0031e550419 --featured_image=true
echo "Creating Variation: maritime-004"
_ARM0041e56041a=`wp post create --post_title="maritime-004" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359004 --porcelain`
echo "Setting meta for product: maritime-004 Variation: 004"
wp post meta update $_ARM0041e56041a _visibility visible
wp post meta update $_ARM0041e56041a attribute_edb_material 004
wp post meta update $_ARM0041e56041a _stock 2
wp post meta update $_ARM0041e56041a _stock_status instock
wp post meta update $_ARM0041e56041a _manage_stock yes
wp post meta update $_ARM0041e56041a _backorders yes
wp post meta update $_ARM0041e56041a _price 350.00
wp post meta update $_ARM0041e56041a _regular_price 350.00
wp post meta update $_ARM0041e56041a _sku ARM0041e56041a
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0041e56041a --featured_image=true
echo "Creating Variation: maritime-005"
_ARM0051e57041b=`wp post create --post_title="maritime-005" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359005 --porcelain`
echo "Setting meta for product: maritime-005 Variation: 005"
wp post meta update $_ARM0051e57041b _visibility visible
wp post meta update $_ARM0051e57041b attribute_edb_material 005
wp post meta update $_ARM0051e57041b _stock 2
wp post meta update $_ARM0051e57041b _stock_status instock
wp post meta update $_ARM0051e57041b _manage_stock yes
wp post meta update $_ARM0051e57041b _backorders yes
wp post meta update $_ARM0051e57041b _price 350.00
wp post meta update $_ARM0051e57041b _regular_price 350.00
wp post meta update $_ARM0051e57041b _sku ARM0051e57041b
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0051e57041b --featured_image=true
echo "Creating Variation: maritime-006"
_ARM0061e58041c=`wp post create --post_title="maritime-006" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359006 --porcelain`
echo "Setting meta for product: maritime-006 Variation: 006"
wp post meta update $_ARM0061e58041c _visibility visible
wp post meta update $_ARM0061e58041c attribute_edb_material 006
wp post meta update $_ARM0061e58041c _stock 2
wp post meta update $_ARM0061e58041c _stock_status instock
wp post meta update $_ARM0061e58041c _manage_stock yes
wp post meta update $_ARM0061e58041c _backorders yes
wp post meta update $_ARM0061e58041c _price 350.00
wp post meta update $_ARM0061e58041c _regular_price 350.00
wp post meta update $_ARM0061e58041c _sku ARM0061e58041c
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0061e58041c --featured_image=true
echo "Creating Variation: maritime-007"
_ARM0071e59041d=`wp post create --post_title="maritime-007" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359007 --porcelain`
echo "Setting meta for product: maritime-007 Variation: 007"
wp post meta update $_ARM0071e59041d _visibility visible
wp post meta update $_ARM0071e59041d attribute_edb_material 007
wp post meta update $_ARM0071e59041d _stock 2
wp post meta update $_ARM0071e59041d _stock_status instock
wp post meta update $_ARM0071e59041d _manage_stock yes
wp post meta update $_ARM0071e59041d _backorders yes
wp post meta update $_ARM0071e59041d _price 350.00
wp post meta update $_ARM0071e59041d _regular_price 350.00
wp post meta update $_ARM0071e59041d _sku ARM0071e59041d
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0071e59041d --featured_image=true
echo "Creating Variation: maritime-008"
_ARM0081e5a041e=`wp post create --post_title="maritime-008" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359008 --porcelain`
echo "Setting meta for product: maritime-008 Variation: 008"
wp post meta update $_ARM0081e5a041e _visibility visible
wp post meta update $_ARM0081e5a041e attribute_edb_material 008
wp post meta update $_ARM0081e5a041e _stock 2
wp post meta update $_ARM0081e5a041e _stock_status instock
wp post meta update $_ARM0081e5a041e _manage_stock yes
wp post meta update $_ARM0081e5a041e _backorders yes
wp post meta update $_ARM0081e5a041e _price 350.00
wp post meta update $_ARM0081e5a041e _regular_price 350.00
wp post meta update $_ARM0081e5a041e _sku ARM0081e5a041e
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0081e5a041e --featured_image=true
echo "Creating Variation: maritime-009"
_ARM0091e5b041f=`wp post create --post_title="maritime-009" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359009 --porcelain`
echo "Setting meta for product: maritime-009 Variation: 009"
wp post meta update $_ARM0091e5b041f _visibility visible
wp post meta update $_ARM0091e5b041f attribute_edb_material 009
wp post meta update $_ARM0091e5b041f _stock 2
wp post meta update $_ARM0091e5b041f _stock_status instock
wp post meta update $_ARM0091e5b041f _manage_stock yes
wp post meta update $_ARM0091e5b041f _backorders yes
wp post meta update $_ARM0091e5b041f _price 350.00
wp post meta update $_ARM0091e5b041f _regular_price 350.00
wp post meta update $_ARM0091e5b041f _sku ARM0091e5b041f
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0091e5b041f --featured_image=true
echo "Creating Variation: maritime-010"
_ARM0101e540417=`wp post create --post_title="maritime-010" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359010 --porcelain`
echo "Setting meta for product: maritime-010 Variation: 010"
wp post meta update $_ARM0101e540417 _visibility visible
wp post meta update $_ARM0101e540417 attribute_edb_material 010
wp post meta update $_ARM0101e540417 _stock 2
wp post meta update $_ARM0101e540417 _stock_status instock
wp post meta update $_ARM0101e540417 _manage_stock yes
wp post meta update $_ARM0101e540417 _backorders yes
wp post meta update $_ARM0101e540417 _price 350.00
wp post meta update $_ARM0101e540417 _regular_price 350.00
wp post meta update $_ARM0101e540417 _sku ARM0101e540417
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0101e540417 --featured_image=true
echo "Creating Variation: maritime-011"
_ARM0111e550418=`wp post create --post_title="maritime-011" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359011 --porcelain`
echo "Setting meta for product: maritime-011 Variation: 011"
wp post meta update $_ARM0111e550418 _visibility visible
wp post meta update $_ARM0111e550418 attribute_edb_material 011
wp post meta update $_ARM0111e550418 _stock 2
wp post meta update $_ARM0111e550418 _stock_status instock
wp post meta update $_ARM0111e550418 _manage_stock yes
wp post meta update $_ARM0111e550418 _backorders yes
wp post meta update $_ARM0111e550418 _price 350.00
wp post meta update $_ARM0111e550418 _regular_price 350.00
wp post meta update $_ARM0111e550418 _sku ARM0111e550418
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0111e550418 --featured_image=true
echo "Creating Variation: maritime-012"
_ARM0121e560419=`wp post create --post_title="maritime-012" --post_parent=$_ARMXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_armxxx0f1a0359012 --porcelain`
echo "Setting meta for product: maritime-012 Variation: 012"
wp post meta update $_ARM0121e560419 _visibility visible
wp post meta update $_ARM0121e560419 attribute_edb_material 012
wp post meta update $_ARM0121e560419 _stock 2
wp post meta update $_ARM0121e560419 _stock_status instock
wp post meta update $_ARM0121e560419 _manage_stock yes
wp post meta update $_ARM0121e560419 _backorders yes
wp post meta update $_ARM0121e560419 _price 350.00
wp post meta update $_ARM0121e560419 _regular_price 350.00
wp post meta update $_ARM0121e560419 _sku ARM0121e560419
wp media import ./data/products/19-maritime_natural/gallery/armchair_maritime_000.jpg --post_id=$_ARM0121e560419 --featured_image=true
echo "Creating Product: pique"
_RGTXXX067b0225=`wp post create --post_title="pique" --menu_order=18 --post_name="pique_rgtxxx067b0225" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: pique"
wp post meta update $_RGTXXX067b0225 _visibility visible
wp post meta update $_RGTXXX067b0225 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_RGTXXX067b0225 _price 350.00
wp post meta update $_RGTXXX067b0225 _regular_price 350.00
wp post term set $_RGTXXX067b0225 product_shipping_class furniture
wp post term set $_RGTXXX067b0225 product_cat sectionals-right-facing
wp post term set $_RGTXXX067b0225 product_type variable
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGTXXX067b0225 --featured_image=true
_RGTXXX067b0225_0=`wp media import ./data/products/18-pique/gallery/pique_left_0000_001.jpg --post_id=$_RGTXXX067b0225 --porcelain`
_RGTXXX067b0225_1=`wp media import ./data/products/18-pique/gallery/pique_left_0001_002.jpg --post_id=$_RGTXXX067b0225 --porcelain`
_RGTXXX067b0225_2=`wp media import ./data/products/18-pique/gallery/pique_left_0002_003.jpg --post_id=$_RGTXXX067b0225 --porcelain`
_RGTXXX067b0225_3=`wp media import ./data/products/18-pique/gallery/pique_left_0003_004.jpg --post_id=$_RGTXXX067b0225 --porcelain`
_RGTXXX067b0225_4=`wp media import ./data/products/18-pique/gallery/pique_left_0000_005.jpg --post_id=$_RGTXXX067b0225 --porcelain`
_RGTXXX067b0225_5=`wp media import ./data/products/18-pique/gallery/pique_left_0001_006.jpg --post_id=$_RGTXXX067b0225 --porcelain`
_RGTXXX067b0225_6=`wp media import ./data/products/18-pique/gallery/pique_left_0002_007.jpg --post_id=$_RGTXXX067b0225 --porcelain`
wp post meta update $_RGTXXX067b0225 _product_image_gallery $_RGTXXX067b0225_0,$_RGTXXX067b0225_1,$_RGTXXX067b0225_2,$_RGTXXX067b0225_3,$_RGTXXX067b0225_4,$_RGTXXX067b0225_5,$_RGTXXX067b0225_6
echo "Creating Variation: pique-001"
_RGT00110e402e3=`wp post create --post_title="pique-001" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225001 --porcelain`
echo "Setting meta for product: pique-001 Variation: 001"
wp post meta update $_RGT00110e402e3 _visibility visible
wp post meta update $_RGT00110e402e3 attribute_edb_material 001
wp post meta update $_RGT00110e402e3 _stock 2
wp post meta update $_RGT00110e402e3 _stock_status instock
wp post meta update $_RGT00110e402e3 _manage_stock yes
wp post meta update $_RGT00110e402e3 _backorders yes
wp post meta update $_RGT00110e402e3 _price 350.00
wp post meta update $_RGT00110e402e3 _regular_price 350.00
wp post meta update $_RGT00110e402e3 _sku RGT00110e402e3
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT00110e402e3 --featured_image=true
echo "Creating Variation: pique-002"
_RGT00210e502e4=`wp post create --post_title="pique-002" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225002 --porcelain`
echo "Setting meta for product: pique-002 Variation: 002"
wp post meta update $_RGT00210e502e4 _visibility visible
wp post meta update $_RGT00210e502e4 attribute_edb_material 002
wp post meta update $_RGT00210e502e4 _stock 2
wp post meta update $_RGT00210e502e4 _stock_status instock
wp post meta update $_RGT00210e502e4 _manage_stock yes
wp post meta update $_RGT00210e502e4 _backorders yes
wp post meta update $_RGT00210e502e4 _price 350.00
wp post meta update $_RGT00210e502e4 _regular_price 350.00
wp post meta update $_RGT00210e502e4 _sku RGT00210e502e4
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT00210e502e4 --featured_image=true
echo "Creating Variation: pique-003"
_RGT00310e602e5=`wp post create --post_title="pique-003" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225003 --porcelain`
echo "Setting meta for product: pique-003 Variation: 003"
wp post meta update $_RGT00310e602e5 _visibility visible
wp post meta update $_RGT00310e602e5 attribute_edb_material 003
wp post meta update $_RGT00310e602e5 _stock 2
wp post meta update $_RGT00310e602e5 _stock_status instock
wp post meta update $_RGT00310e602e5 _manage_stock yes
wp post meta update $_RGT00310e602e5 _backorders yes
wp post meta update $_RGT00310e602e5 _price 350.00
wp post meta update $_RGT00310e602e5 _regular_price 350.00
wp post meta update $_RGT00310e602e5 _sku RGT00310e602e5
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT00310e602e5 --featured_image=true
echo "Creating Variation: pique-004"
_RGT00410e702e6=`wp post create --post_title="pique-004" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225004 --porcelain`
echo "Setting meta for product: pique-004 Variation: 004"
wp post meta update $_RGT00410e702e6 _visibility visible
wp post meta update $_RGT00410e702e6 attribute_edb_material 004
wp post meta update $_RGT00410e702e6 _stock 2
wp post meta update $_RGT00410e702e6 _stock_status instock
wp post meta update $_RGT00410e702e6 _manage_stock yes
wp post meta update $_RGT00410e702e6 _backorders yes
wp post meta update $_RGT00410e702e6 _price 350.00
wp post meta update $_RGT00410e702e6 _regular_price 350.00
wp post meta update $_RGT00410e702e6 _sku RGT00410e702e6
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT00410e702e6 --featured_image=true
echo "Creating Variation: pique-005"
_RGT00510e802e7=`wp post create --post_title="pique-005" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225005 --porcelain`
echo "Setting meta for product: pique-005 Variation: 005"
wp post meta update $_RGT00510e802e7 _visibility visible
wp post meta update $_RGT00510e802e7 attribute_edb_material 005
wp post meta update $_RGT00510e802e7 _stock 2
wp post meta update $_RGT00510e802e7 _stock_status instock
wp post meta update $_RGT00510e802e7 _manage_stock yes
wp post meta update $_RGT00510e802e7 _backorders yes
wp post meta update $_RGT00510e802e7 _price 350.00
wp post meta update $_RGT00510e802e7 _regular_price 350.00
wp post meta update $_RGT00510e802e7 _sku RGT00510e802e7
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT00510e802e7 --featured_image=true
echo "Creating Variation: pique-006"
_RGT00610e902e8=`wp post create --post_title="pique-006" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225006 --porcelain`
echo "Setting meta for product: pique-006 Variation: 006"
wp post meta update $_RGT00610e902e8 _visibility visible
wp post meta update $_RGT00610e902e8 attribute_edb_material 006
wp post meta update $_RGT00610e902e8 _stock 2
wp post meta update $_RGT00610e902e8 _stock_status instock
wp post meta update $_RGT00610e902e8 _manage_stock yes
wp post meta update $_RGT00610e902e8 _backorders yes
wp post meta update $_RGT00610e902e8 _price 350.00
wp post meta update $_RGT00610e902e8 _regular_price 350.00
wp post meta update $_RGT00610e902e8 _sku RGT00610e902e8
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT00610e902e8 --featured_image=true
echo "Creating Variation: pique-007"
_RGT00710ea02e9=`wp post create --post_title="pique-007" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225007 --porcelain`
echo "Setting meta for product: pique-007 Variation: 007"
wp post meta update $_RGT00710ea02e9 _visibility visible
wp post meta update $_RGT00710ea02e9 attribute_edb_material 007
wp post meta update $_RGT00710ea02e9 _stock 2
wp post meta update $_RGT00710ea02e9 _stock_status instock
wp post meta update $_RGT00710ea02e9 _manage_stock yes
wp post meta update $_RGT00710ea02e9 _backorders yes
wp post meta update $_RGT00710ea02e9 _price 350.00
wp post meta update $_RGT00710ea02e9 _regular_price 350.00
wp post meta update $_RGT00710ea02e9 _sku RGT00710ea02e9
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT00710ea02e9 --featured_image=true
echo "Creating Variation: pique-008"
_RGT00810eb02ea=`wp post create --post_title="pique-008" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225008 --porcelain`
echo "Setting meta for product: pique-008 Variation: 008"
wp post meta update $_RGT00810eb02ea _visibility visible
wp post meta update $_RGT00810eb02ea attribute_edb_material 008
wp post meta update $_RGT00810eb02ea _stock 2
wp post meta update $_RGT00810eb02ea _stock_status instock
wp post meta update $_RGT00810eb02ea _manage_stock yes
wp post meta update $_RGT00810eb02ea _backorders yes
wp post meta update $_RGT00810eb02ea _price 350.00
wp post meta update $_RGT00810eb02ea _regular_price 350.00
wp post meta update $_RGT00810eb02ea _sku RGT00810eb02ea
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT00810eb02ea --featured_image=true
echo "Creating Variation: pique-009"
_RGT00910ec02eb=`wp post create --post_title="pique-009" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225009 --porcelain`
echo "Setting meta for product: pique-009 Variation: 009"
wp post meta update $_RGT00910ec02eb _visibility visible
wp post meta update $_RGT00910ec02eb attribute_edb_material 009
wp post meta update $_RGT00910ec02eb _stock 2
wp post meta update $_RGT00910ec02eb _stock_status instock
wp post meta update $_RGT00910ec02eb _manage_stock yes
wp post meta update $_RGT00910ec02eb _backorders yes
wp post meta update $_RGT00910ec02eb _price 350.00
wp post meta update $_RGT00910ec02eb _regular_price 350.00
wp post meta update $_RGT00910ec02eb _sku RGT00910ec02eb
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT00910ec02eb --featured_image=true
echo "Creating Variation: pique-010"
_RGT01010e502e3=`wp post create --post_title="pique-010" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225010 --porcelain`
echo "Setting meta for product: pique-010 Variation: 010"
wp post meta update $_RGT01010e502e3 _visibility visible
wp post meta update $_RGT01010e502e3 attribute_edb_material 010
wp post meta update $_RGT01010e502e3 _stock 2
wp post meta update $_RGT01010e502e3 _stock_status instock
wp post meta update $_RGT01010e502e3 _manage_stock yes
wp post meta update $_RGT01010e502e3 _backorders yes
wp post meta update $_RGT01010e502e3 _price 350.00
wp post meta update $_RGT01010e502e3 _regular_price 350.00
wp post meta update $_RGT01010e502e3 _sku RGT01010e502e3
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT01010e502e3 --featured_image=true
echo "Creating Variation: pique-011"
_RGT01110e602e4=`wp post create --post_title="pique-011" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225011 --porcelain`
echo "Setting meta for product: pique-011 Variation: 011"
wp post meta update $_RGT01110e602e4 _visibility visible
wp post meta update $_RGT01110e602e4 attribute_edb_material 011
wp post meta update $_RGT01110e602e4 _stock 2
wp post meta update $_RGT01110e602e4 _stock_status instock
wp post meta update $_RGT01110e602e4 _manage_stock yes
wp post meta update $_RGT01110e602e4 _backorders yes
wp post meta update $_RGT01110e602e4 _price 350.00
wp post meta update $_RGT01110e602e4 _regular_price 350.00
wp post meta update $_RGT01110e602e4 _sku RGT01110e602e4
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT01110e602e4 --featured_image=true
echo "Creating Variation: pique-012"
_RGT01210e702e5=`wp post create --post_title="pique-012" --post_parent=$_RGTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_rgtxxx067b0225012 --porcelain`
echo "Setting meta for product: pique-012 Variation: 012"
wp post meta update $_RGT01210e702e5 _visibility visible
wp post meta update $_RGT01210e702e5 attribute_edb_material 012
wp post meta update $_RGT01210e702e5 _stock 2
wp post meta update $_RGT01210e702e5 _stock_status instock
wp post meta update $_RGT01210e702e5 _manage_stock yes
wp post meta update $_RGT01210e702e5 _backorders yes
wp post meta update $_RGT01210e702e5 _price 350.00
wp post meta update $_RGT01210e702e5 _regular_price 350.00
wp post meta update $_RGT01210e702e5 _sku RGT01210e702e5
wp media import ./data/products/18-pique/gallery/pique_left_000.jpg --post_id=$_RGT01210e702e5 --featured_image=true
echo "Creating Product: mixmix"
_RGTXXX0912029d=`wp post create --post_title="mixmix" --menu_order=17 --post_name="mixmix_rgtxxx0912029d" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: mixmix"
wp post meta update $_RGTXXX0912029d _subtitle "{:en}rec{:}{:fr}rec{:}"
wp post meta update $_RGTXXX0912029d _visibility visible
wp post meta update $_RGTXXX0912029d _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_RGTXXX0912029d _price 350.00
wp post meta update $_RGTXXX0912029d _regular_price 350.00
wp post term set $_RGTXXX0912029d product_shipping_class furniture
wp post term set $_RGTXXX0912029d product_cat sectionals-right-facing
wp post term set $_RGTXXX0912029d product_type variable
wp post meta update $_RGTXXX0912029d _subtitle "{:en}rec{:}{:fr}rec{:}"
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGTXXX0912029d --featured_image=true
_RGTXXX0912029d_0=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_left_0000_001.jpg --post_id=$_RGTXXX0912029d --porcelain`
_RGTXXX0912029d_1=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_left_0001_002.jpg --post_id=$_RGTXXX0912029d --porcelain`
_RGTXXX0912029d_2=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_left_0002_003.jpg --post_id=$_RGTXXX0912029d --porcelain`
_RGTXXX0912029d_3=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0000_004.jpg --post_id=$_RGTXXX0912029d --porcelain`
_RGTXXX0912029d_4=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0001_005.jpg --post_id=$_RGTXXX0912029d --porcelain`
_RGTXXX0912029d_5=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0002_006.jpg --post_id=$_RGTXXX0912029d --porcelain`
_RGTXXX0912029d_6=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0003_007.jpg --post_id=$_RGTXXX0912029d --porcelain`
_RGTXXX0912029d_7=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0004_008.jpg --post_id=$_RGTXXX0912029d --porcelain`
_RGTXXX0912029d_8=`wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_0005_009.jpg --post_id=$_RGTXXX0912029d --porcelain`
wp post meta update $_RGTXXX0912029d _product_image_gallery $_RGTXXX0912029d_0,$_RGTXXX0912029d_1,$_RGTXXX0912029d_2,$_RGTXXX0912029d_3,$_RGTXXX0912029d_4,$_RGTXXX0912029d_5,$_RGTXXX0912029d_6,$_RGTXXX0912029d_7,$_RGTXXX0912029d_8
echo "Creating Variation: mixmix-001"
_RGT001155b035b=`wp post create --post_title="mixmix-001" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d001 --porcelain`
echo "Setting meta for product: mixmix-001 Variation: 001"
wp post meta update $_RGT001155b035b _visibility visible
wp post meta update $_RGT001155b035b attribute_edb_material 001
wp post meta update $_RGT001155b035b _stock 2
wp post meta update $_RGT001155b035b _stock_status instock
wp post meta update $_RGT001155b035b _manage_stock yes
wp post meta update $_RGT001155b035b _backorders yes
wp post meta update $_RGT001155b035b _price 350.00
wp post meta update $_RGT001155b035b _regular_price 350.00
wp post meta update $_RGT001155b035b _sku RGT001155b035b
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT001155b035b --featured_image=true
echo "Creating Variation: mixmix-002"
_RGT002155c035c=`wp post create --post_title="mixmix-002" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d002 --porcelain`
echo "Setting meta for product: mixmix-002 Variation: 002"
wp post meta update $_RGT002155c035c _visibility visible
wp post meta update $_RGT002155c035c attribute_edb_material 002
wp post meta update $_RGT002155c035c _stock 2
wp post meta update $_RGT002155c035c _stock_status instock
wp post meta update $_RGT002155c035c _manage_stock yes
wp post meta update $_RGT002155c035c _backorders yes
wp post meta update $_RGT002155c035c _price 350.00
wp post meta update $_RGT002155c035c _regular_price 350.00
wp post meta update $_RGT002155c035c _sku RGT002155c035c
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT002155c035c --featured_image=true
echo "Creating Variation: mixmix-003"
_RGT003155d035d=`wp post create --post_title="mixmix-003" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d003 --porcelain`
echo "Setting meta for product: mixmix-003 Variation: 003"
wp post meta update $_RGT003155d035d _visibility visible
wp post meta update $_RGT003155d035d attribute_edb_material 003
wp post meta update $_RGT003155d035d _stock 2
wp post meta update $_RGT003155d035d _stock_status instock
wp post meta update $_RGT003155d035d _manage_stock yes
wp post meta update $_RGT003155d035d _backorders yes
wp post meta update $_RGT003155d035d _price 350.00
wp post meta update $_RGT003155d035d _regular_price 350.00
wp post meta update $_RGT003155d035d _sku RGT003155d035d
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT003155d035d --featured_image=true
echo "Creating Variation: mixmix-004"
_RGT004155e035e=`wp post create --post_title="mixmix-004" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d004 --porcelain`
echo "Setting meta for product: mixmix-004 Variation: 004"
wp post meta update $_RGT004155e035e _visibility visible
wp post meta update $_RGT004155e035e attribute_edb_material 004
wp post meta update $_RGT004155e035e _stock 2
wp post meta update $_RGT004155e035e _stock_status instock
wp post meta update $_RGT004155e035e _manage_stock yes
wp post meta update $_RGT004155e035e _backorders yes
wp post meta update $_RGT004155e035e _price 350.00
wp post meta update $_RGT004155e035e _regular_price 350.00
wp post meta update $_RGT004155e035e _sku RGT004155e035e
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT004155e035e --featured_image=true
echo "Creating Variation: mixmix-005"
_RGT005155f035f=`wp post create --post_title="mixmix-005" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d005 --porcelain`
echo "Setting meta for product: mixmix-005 Variation: 005"
wp post meta update $_RGT005155f035f _visibility visible
wp post meta update $_RGT005155f035f attribute_edb_material 005
wp post meta update $_RGT005155f035f _stock 2
wp post meta update $_RGT005155f035f _stock_status instock
wp post meta update $_RGT005155f035f _manage_stock yes
wp post meta update $_RGT005155f035f _backorders yes
wp post meta update $_RGT005155f035f _price 350.00
wp post meta update $_RGT005155f035f _regular_price 350.00
wp post meta update $_RGT005155f035f _sku RGT005155f035f
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT005155f035f --featured_image=true
echo "Creating Variation: mixmix-006"
_RGT00615600360=`wp post create --post_title="mixmix-006" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d006 --porcelain`
echo "Setting meta for product: mixmix-006 Variation: 006"
wp post meta update $_RGT00615600360 _visibility visible
wp post meta update $_RGT00615600360 attribute_edb_material 006
wp post meta update $_RGT00615600360 _stock 2
wp post meta update $_RGT00615600360 _stock_status instock
wp post meta update $_RGT00615600360 _manage_stock yes
wp post meta update $_RGT00615600360 _backorders yes
wp post meta update $_RGT00615600360 _price 350.00
wp post meta update $_RGT00615600360 _regular_price 350.00
wp post meta update $_RGT00615600360 _sku RGT00615600360
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT00615600360 --featured_image=true
echo "Creating Variation: mixmix-007"
_RGT00715610361=`wp post create --post_title="mixmix-007" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d007 --porcelain`
echo "Setting meta for product: mixmix-007 Variation: 007"
wp post meta update $_RGT00715610361 _visibility visible
wp post meta update $_RGT00715610361 attribute_edb_material 007
wp post meta update $_RGT00715610361 _stock 2
wp post meta update $_RGT00715610361 _stock_status instock
wp post meta update $_RGT00715610361 _manage_stock yes
wp post meta update $_RGT00715610361 _backorders yes
wp post meta update $_RGT00715610361 _price 350.00
wp post meta update $_RGT00715610361 _regular_price 350.00
wp post meta update $_RGT00715610361 _sku RGT00715610361
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT00715610361 --featured_image=true
echo "Creating Variation: mixmix-008"
_RGT00815620362=`wp post create --post_title="mixmix-008" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d008 --porcelain`
echo "Setting meta for product: mixmix-008 Variation: 008"
wp post meta update $_RGT00815620362 _visibility visible
wp post meta update $_RGT00815620362 attribute_edb_material 008
wp post meta update $_RGT00815620362 _stock 2
wp post meta update $_RGT00815620362 _stock_status instock
wp post meta update $_RGT00815620362 _manage_stock yes
wp post meta update $_RGT00815620362 _backorders yes
wp post meta update $_RGT00815620362 _price 350.00
wp post meta update $_RGT00815620362 _regular_price 350.00
wp post meta update $_RGT00815620362 _sku RGT00815620362
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT00815620362 --featured_image=true
echo "Creating Variation: mixmix-009"
_RGT00915630363=`wp post create --post_title="mixmix-009" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d009 --porcelain`
echo "Setting meta for product: mixmix-009 Variation: 009"
wp post meta update $_RGT00915630363 _visibility visible
wp post meta update $_RGT00915630363 attribute_edb_material 009
wp post meta update $_RGT00915630363 _stock 2
wp post meta update $_RGT00915630363 _stock_status instock
wp post meta update $_RGT00915630363 _manage_stock yes
wp post meta update $_RGT00915630363 _backorders yes
wp post meta update $_RGT00915630363 _price 350.00
wp post meta update $_RGT00915630363 _regular_price 350.00
wp post meta update $_RGT00915630363 _sku RGT00915630363
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT00915630363 --featured_image=true
echo "Creating Variation: mixmix-010"
_RGT010155c035b=`wp post create --post_title="mixmix-010" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d010 --porcelain`
echo "Setting meta for product: mixmix-010 Variation: 010"
wp post meta update $_RGT010155c035b _visibility visible
wp post meta update $_RGT010155c035b attribute_edb_material 010
wp post meta update $_RGT010155c035b _stock 2
wp post meta update $_RGT010155c035b _stock_status instock
wp post meta update $_RGT010155c035b _manage_stock yes
wp post meta update $_RGT010155c035b _backorders yes
wp post meta update $_RGT010155c035b _price 350.00
wp post meta update $_RGT010155c035b _regular_price 350.00
wp post meta update $_RGT010155c035b _sku RGT010155c035b
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT010155c035b --featured_image=true
echo "Creating Variation: mixmix-011"
_RGT011155d035c=`wp post create --post_title="mixmix-011" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d011 --porcelain`
echo "Setting meta for product: mixmix-011 Variation: 011"
wp post meta update $_RGT011155d035c _visibility visible
wp post meta update $_RGT011155d035c attribute_edb_material 011
wp post meta update $_RGT011155d035c _stock 2
wp post meta update $_RGT011155d035c _stock_status instock
wp post meta update $_RGT011155d035c _manage_stock yes
wp post meta update $_RGT011155d035c _backorders yes
wp post meta update $_RGT011155d035c _price 350.00
wp post meta update $_RGT011155d035c _regular_price 350.00
wp post meta update $_RGT011155d035c _sku RGT011155d035c
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT011155d035c --featured_image=true
echo "Creating Variation: mixmix-012"
_RGT012155e035d=`wp post create --post_title="mixmix-012" --post_parent=$_RGTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_rgtxxx0912029d012 --porcelain`
echo "Setting meta for product: mixmix-012 Variation: 012"
wp post meta update $_RGT012155e035d _visibility visible
wp post meta update $_RGT012155e035d attribute_edb_material 012
wp post meta update $_RGT012155e035d _stock 2
wp post meta update $_RGT012155e035d _stock_status instock
wp post meta update $_RGT012155e035d _manage_stock yes
wp post meta update $_RGT012155e035d _backorders yes
wp post meta update $_RGT012155e035d _price 350.00
wp post meta update $_RGT012155e035d _regular_price 350.00
wp post meta update $_RGT012155e035d _sku RGT012155e035d
wp media import ./data/products/17-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_RGT012155e035d --featured_image=true
echo "Creating Product: flex"
_RGTXXX042201b0=`wp post create --post_title="flex" --menu_order=16 --post_name="flex_rgtxxx042201b0" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: flex"
wp post meta update $_RGTXXX042201b0 _visibility visible
wp post meta update $_RGTXXX042201b0 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_RGTXXX042201b0 _price 350.00
wp post meta update $_RGTXXX042201b0 _regular_price 350.00
wp post term set $_RGTXXX042201b0 product_shipping_class furniture
wp post term set $_RGTXXX042201b0 product_cat sectionals-right-facing
wp post term set $_RGTXXX042201b0 product_type variable
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGTXXX042201b0 --featured_image=true
_RGTXXX042201b0_0=`wp media import ./data/products/16-flex/gallery/flex_0000_001.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_1=`wp media import ./data/products/16-flex/gallery/flex_0001_002.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_2=`wp media import ./data/products/16-flex/gallery/flex_0002_003.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_3=`wp media import ./data/products/16-flex/gallery/flex_0003_004.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_4=`wp media import ./data/products/16-flex/gallery/flex_0004_005.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_5=`wp media import ./data/products/16-flex/gallery/flex_0005_006.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_6=`wp media import ./data/products/16-flex/gallery/flex_0006_007.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_7=`wp media import ./data/products/16-flex/gallery/flex_0000_008.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_8=`wp media import ./data/products/16-flex/gallery/flex_0001_009.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_9=`wp media import ./data/products/16-flex/gallery/flex_0002_010.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_10=`wp media import ./data/products/16-flex/gallery/flex_0003_011.jpg --post_id=$_RGTXXX042201b0 --porcelain`
_RGTXXX042201b0_11=`wp media import ./data/products/16-flex/gallery/flex_0004_012.jpg --post_id=$_RGTXXX042201b0 --porcelain`
wp post meta update $_RGTXXX042201b0 _product_image_gallery $_RGTXXX042201b0_0,$_RGTXXX042201b0_1,$_RGTXXX042201b0_2,$_RGTXXX042201b0_3,$_RGTXXX042201b0_4,$_RGTXXX042201b0_5,$_RGTXXX042201b0_6,$_RGTXXX042201b0_7,$_RGTXXX042201b0_8,$_RGTXXX042201b0_9,$_RGTXXX042201b0_10,$_RGTXXX042201b0_11
echo "Creating Variation: flex-001"
_RGT0010cb7026e=`wp post create --post_title="flex-001" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0001 --porcelain`
echo "Setting meta for product: flex-001 Variation: 001"
wp post meta update $_RGT0010cb7026e _visibility visible
wp post meta update $_RGT0010cb7026e attribute_edb_material 001
wp post meta update $_RGT0010cb7026e _stock 2
wp post meta update $_RGT0010cb7026e _stock_status instock
wp post meta update $_RGT0010cb7026e _manage_stock yes
wp post meta update $_RGT0010cb7026e _backorders yes
wp post meta update $_RGT0010cb7026e _price 350.00
wp post meta update $_RGT0010cb7026e _regular_price 350.00
wp post meta update $_RGT0010cb7026e _sku RGT0010cb7026e
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0010cb7026e --featured_image=true
echo "Creating Variation: flex-002"
_RGT0020cb8026f=`wp post create --post_title="flex-002" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0002 --porcelain`
echo "Setting meta for product: flex-002 Variation: 002"
wp post meta update $_RGT0020cb8026f _visibility visible
wp post meta update $_RGT0020cb8026f attribute_edb_material 002
wp post meta update $_RGT0020cb8026f _stock 2
wp post meta update $_RGT0020cb8026f _stock_status instock
wp post meta update $_RGT0020cb8026f _manage_stock yes
wp post meta update $_RGT0020cb8026f _backorders yes
wp post meta update $_RGT0020cb8026f _price 350.00
wp post meta update $_RGT0020cb8026f _regular_price 350.00
wp post meta update $_RGT0020cb8026f _sku RGT0020cb8026f
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0020cb8026f --featured_image=true
echo "Creating Variation: flex-003"
_RGT0030cb90270=`wp post create --post_title="flex-003" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0003 --porcelain`
echo "Setting meta for product: flex-003 Variation: 003"
wp post meta update $_RGT0030cb90270 _visibility visible
wp post meta update $_RGT0030cb90270 attribute_edb_material 003
wp post meta update $_RGT0030cb90270 _stock 2
wp post meta update $_RGT0030cb90270 _stock_status instock
wp post meta update $_RGT0030cb90270 _manage_stock yes
wp post meta update $_RGT0030cb90270 _backorders yes
wp post meta update $_RGT0030cb90270 _price 350.00
wp post meta update $_RGT0030cb90270 _regular_price 350.00
wp post meta update $_RGT0030cb90270 _sku RGT0030cb90270
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0030cb90270 --featured_image=true
echo "Creating Variation: flex-004"
_RGT0040cba0271=`wp post create --post_title="flex-004" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0004 --porcelain`
echo "Setting meta for product: flex-004 Variation: 004"
wp post meta update $_RGT0040cba0271 _visibility visible
wp post meta update $_RGT0040cba0271 attribute_edb_material 004
wp post meta update $_RGT0040cba0271 _stock 2
wp post meta update $_RGT0040cba0271 _stock_status instock
wp post meta update $_RGT0040cba0271 _manage_stock yes
wp post meta update $_RGT0040cba0271 _backorders yes
wp post meta update $_RGT0040cba0271 _price 350.00
wp post meta update $_RGT0040cba0271 _regular_price 350.00
wp post meta update $_RGT0040cba0271 _sku RGT0040cba0271
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0040cba0271 --featured_image=true
echo "Creating Variation: flex-005"
_RGT0050cbb0272=`wp post create --post_title="flex-005" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0005 --porcelain`
echo "Setting meta for product: flex-005 Variation: 005"
wp post meta update $_RGT0050cbb0272 _visibility visible
wp post meta update $_RGT0050cbb0272 attribute_edb_material 005
wp post meta update $_RGT0050cbb0272 _stock 2
wp post meta update $_RGT0050cbb0272 _stock_status instock
wp post meta update $_RGT0050cbb0272 _manage_stock yes
wp post meta update $_RGT0050cbb0272 _backorders yes
wp post meta update $_RGT0050cbb0272 _price 350.00
wp post meta update $_RGT0050cbb0272 _regular_price 350.00
wp post meta update $_RGT0050cbb0272 _sku RGT0050cbb0272
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0050cbb0272 --featured_image=true
echo "Creating Variation: flex-006"
_RGT0060cbc0273=`wp post create --post_title="flex-006" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0006 --porcelain`
echo "Setting meta for product: flex-006 Variation: 006"
wp post meta update $_RGT0060cbc0273 _visibility visible
wp post meta update $_RGT0060cbc0273 attribute_edb_material 006
wp post meta update $_RGT0060cbc0273 _stock 2
wp post meta update $_RGT0060cbc0273 _stock_status instock
wp post meta update $_RGT0060cbc0273 _manage_stock yes
wp post meta update $_RGT0060cbc0273 _backorders yes
wp post meta update $_RGT0060cbc0273 _price 350.00
wp post meta update $_RGT0060cbc0273 _regular_price 350.00
wp post meta update $_RGT0060cbc0273 _sku RGT0060cbc0273
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0060cbc0273 --featured_image=true
echo "Creating Variation: flex-007"
_RGT0070cbd0274=`wp post create --post_title="flex-007" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0007 --porcelain`
echo "Setting meta for product: flex-007 Variation: 007"
wp post meta update $_RGT0070cbd0274 _visibility visible
wp post meta update $_RGT0070cbd0274 attribute_edb_material 007
wp post meta update $_RGT0070cbd0274 _stock 2
wp post meta update $_RGT0070cbd0274 _stock_status instock
wp post meta update $_RGT0070cbd0274 _manage_stock yes
wp post meta update $_RGT0070cbd0274 _backorders yes
wp post meta update $_RGT0070cbd0274 _price 350.00
wp post meta update $_RGT0070cbd0274 _regular_price 350.00
wp post meta update $_RGT0070cbd0274 _sku RGT0070cbd0274
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0070cbd0274 --featured_image=true
echo "Creating Variation: flex-008"
_RGT0080cbe0275=`wp post create --post_title="flex-008" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0008 --porcelain`
echo "Setting meta for product: flex-008 Variation: 008"
wp post meta update $_RGT0080cbe0275 _visibility visible
wp post meta update $_RGT0080cbe0275 attribute_edb_material 008
wp post meta update $_RGT0080cbe0275 _stock 2
wp post meta update $_RGT0080cbe0275 _stock_status instock
wp post meta update $_RGT0080cbe0275 _manage_stock yes
wp post meta update $_RGT0080cbe0275 _backorders yes
wp post meta update $_RGT0080cbe0275 _price 350.00
wp post meta update $_RGT0080cbe0275 _regular_price 350.00
wp post meta update $_RGT0080cbe0275 _sku RGT0080cbe0275
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0080cbe0275 --featured_image=true
echo "Creating Variation: flex-009"
_RGT0090cbf0276=`wp post create --post_title="flex-009" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0009 --porcelain`
echo "Setting meta for product: flex-009 Variation: 009"
wp post meta update $_RGT0090cbf0276 _visibility visible
wp post meta update $_RGT0090cbf0276 attribute_edb_material 009
wp post meta update $_RGT0090cbf0276 _stock 2
wp post meta update $_RGT0090cbf0276 _stock_status instock
wp post meta update $_RGT0090cbf0276 _manage_stock yes
wp post meta update $_RGT0090cbf0276 _backorders yes
wp post meta update $_RGT0090cbf0276 _price 350.00
wp post meta update $_RGT0090cbf0276 _regular_price 350.00
wp post meta update $_RGT0090cbf0276 _sku RGT0090cbf0276
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0090cbf0276 --featured_image=true
echo "Creating Variation: flex-010"
_RGT0100cb8026e=`wp post create --post_title="flex-010" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0010 --porcelain`
echo "Setting meta for product: flex-010 Variation: 010"
wp post meta update $_RGT0100cb8026e _visibility visible
wp post meta update $_RGT0100cb8026e attribute_edb_material 010
wp post meta update $_RGT0100cb8026e _stock 2
wp post meta update $_RGT0100cb8026e _stock_status instock
wp post meta update $_RGT0100cb8026e _manage_stock yes
wp post meta update $_RGT0100cb8026e _backorders yes
wp post meta update $_RGT0100cb8026e _price 350.00
wp post meta update $_RGT0100cb8026e _regular_price 350.00
wp post meta update $_RGT0100cb8026e _sku RGT0100cb8026e
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0100cb8026e --featured_image=true
echo "Creating Variation: flex-011"
_RGT0110cb9026f=`wp post create --post_title="flex-011" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0011 --porcelain`
echo "Setting meta for product: flex-011 Variation: 011"
wp post meta update $_RGT0110cb9026f _visibility visible
wp post meta update $_RGT0110cb9026f attribute_edb_material 011
wp post meta update $_RGT0110cb9026f _stock 2
wp post meta update $_RGT0110cb9026f _stock_status instock
wp post meta update $_RGT0110cb9026f _manage_stock yes
wp post meta update $_RGT0110cb9026f _backorders yes
wp post meta update $_RGT0110cb9026f _price 350.00
wp post meta update $_RGT0110cb9026f _regular_price 350.00
wp post meta update $_RGT0110cb9026f _sku RGT0110cb9026f
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0110cb9026f --featured_image=true
echo "Creating Variation: flex-012"
_RGT0120cba0270=`wp post create --post_title="flex-012" --post_parent=$_RGTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_rgtxxx042201b0012 --porcelain`
echo "Setting meta for product: flex-012 Variation: 012"
wp post meta update $_RGT0120cba0270 _visibility visible
wp post meta update $_RGT0120cba0270 attribute_edb_material 012
wp post meta update $_RGT0120cba0270 _stock 2
wp post meta update $_RGT0120cba0270 _stock_status instock
wp post meta update $_RGT0120cba0270 _manage_stock yes
wp post meta update $_RGT0120cba0270 _backorders yes
wp post meta update $_RGT0120cba0270 _price 350.00
wp post meta update $_RGT0120cba0270 _regular_price 350.00
wp post meta update $_RGT0120cba0270 _sku RGT0120cba0270
wp media import ./data/products/16-flex/gallery/flex_000.jpg --post_id=$_RGT0120cba0270 --featured_image=true
echo "Creating Product: panorama"
_RGTXXX0f140350=`wp post create --post_title="panorama" --menu_order=15 --post_name="panorama_rgtxxx0f140350" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: panorama"
wp post meta update $_RGTXXX0f140350 _visibility visible
wp post meta update $_RGTXXX0f140350 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_RGTXXX0f140350 _price 350.00
wp post meta update $_RGTXXX0f140350 _regular_price 350.00
wp post term set $_RGTXXX0f140350 product_shipping_class furniture
wp post term set $_RGTXXX0f140350 product_cat sectionals-right-facing
wp post term set $_RGTXXX0f140350 product_type variable
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGTXXX0f140350 --featured_image=true
_RGTXXX0f140350_0=`wp media import ./data/products/15-panorama/gallery/panorama_left_0000_001.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_1=`wp media import ./data/products/15-panorama/gallery/panorama_left_0001_002.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_2=`wp media import ./data/products/15-panorama/gallery/panorama_left_0002_003.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_3=`wp media import ./data/products/15-panorama/gallery/panorama_left_0003_004.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_4=`wp media import ./data/products/15-panorama/gallery/panorama_left_0004_005.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_5=`wp media import ./data/products/15-panorama/gallery/panorama_left_0005_006.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_6=`wp media import ./data/products/15-panorama/gallery/panorama_left_0006_007.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_7=`wp media import ./data/products/15-panorama/gallery/panorama_left_0000_008.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_8=`wp media import ./data/products/15-panorama/gallery/panorama_left_0001_009.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_9=`wp media import ./data/products/15-panorama/gallery/panorama_left_0002_010.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_10=`wp media import ./data/products/15-panorama/gallery/panorama_left_0003_011.jpg --post_id=$_RGTXXX0f140350 --porcelain`
_RGTXXX0f140350_11=`wp media import ./data/products/15-panorama/gallery/panorama_left_0004_012.jpg --post_id=$_RGTXXX0f140350 --porcelain`
wp post meta update $_RGTXXX0f140350 _product_image_gallery $_RGTXXX0f140350_0,$_RGTXXX0f140350_1,$_RGTXXX0f140350_2,$_RGTXXX0f140350_3,$_RGTXXX0f140350_4,$_RGTXXX0f140350_5,$_RGTXXX0f140350_6,$_RGTXXX0f140350_7,$_RGTXXX0f140350_8,$_RGTXXX0f140350_9,$_RGTXXX0f140350_10,$_RGTXXX0f140350_11
echo "Creating Variation: panorama-001"
_RGT0011e29040e=`wp post create --post_title="panorama-001" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350001 --porcelain`
echo "Setting meta for product: panorama-001 Variation: 001"
wp post meta update $_RGT0011e29040e _visibility visible
wp post meta update $_RGT0011e29040e attribute_edb_material 001
wp post meta update $_RGT0011e29040e _stock 2
wp post meta update $_RGT0011e29040e _stock_status instock
wp post meta update $_RGT0011e29040e _manage_stock yes
wp post meta update $_RGT0011e29040e _backorders yes
wp post meta update $_RGT0011e29040e _price 350.00
wp post meta update $_RGT0011e29040e _regular_price 350.00
wp post meta update $_RGT0011e29040e _sku RGT0011e29040e
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0011e29040e --featured_image=true
echo "Creating Variation: panorama-002"
_RGT0021e2a040f=`wp post create --post_title="panorama-002" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350002 --porcelain`
echo "Setting meta for product: panorama-002 Variation: 002"
wp post meta update $_RGT0021e2a040f _visibility visible
wp post meta update $_RGT0021e2a040f attribute_edb_material 002
wp post meta update $_RGT0021e2a040f _stock 2
wp post meta update $_RGT0021e2a040f _stock_status instock
wp post meta update $_RGT0021e2a040f _manage_stock yes
wp post meta update $_RGT0021e2a040f _backorders yes
wp post meta update $_RGT0021e2a040f _price 350.00
wp post meta update $_RGT0021e2a040f _regular_price 350.00
wp post meta update $_RGT0021e2a040f _sku RGT0021e2a040f
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0021e2a040f --featured_image=true
echo "Creating Variation: panorama-003"
_RGT0031e2b0410=`wp post create --post_title="panorama-003" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350003 --porcelain`
echo "Setting meta for product: panorama-003 Variation: 003"
wp post meta update $_RGT0031e2b0410 _visibility visible
wp post meta update $_RGT0031e2b0410 attribute_edb_material 003
wp post meta update $_RGT0031e2b0410 _stock 2
wp post meta update $_RGT0031e2b0410 _stock_status instock
wp post meta update $_RGT0031e2b0410 _manage_stock yes
wp post meta update $_RGT0031e2b0410 _backorders yes
wp post meta update $_RGT0031e2b0410 _price 350.00
wp post meta update $_RGT0031e2b0410 _regular_price 350.00
wp post meta update $_RGT0031e2b0410 _sku RGT0031e2b0410
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0031e2b0410 --featured_image=true
echo "Creating Variation: panorama-004"
_RGT0041e2c0411=`wp post create --post_title="panorama-004" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350004 --porcelain`
echo "Setting meta for product: panorama-004 Variation: 004"
wp post meta update $_RGT0041e2c0411 _visibility visible
wp post meta update $_RGT0041e2c0411 attribute_edb_material 004
wp post meta update $_RGT0041e2c0411 _stock 2
wp post meta update $_RGT0041e2c0411 _stock_status instock
wp post meta update $_RGT0041e2c0411 _manage_stock yes
wp post meta update $_RGT0041e2c0411 _backorders yes
wp post meta update $_RGT0041e2c0411 _price 350.00
wp post meta update $_RGT0041e2c0411 _regular_price 350.00
wp post meta update $_RGT0041e2c0411 _sku RGT0041e2c0411
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0041e2c0411 --featured_image=true
echo "Creating Variation: panorama-005"
_RGT0051e2d0412=`wp post create --post_title="panorama-005" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350005 --porcelain`
echo "Setting meta for product: panorama-005 Variation: 005"
wp post meta update $_RGT0051e2d0412 _visibility visible
wp post meta update $_RGT0051e2d0412 attribute_edb_material 005
wp post meta update $_RGT0051e2d0412 _stock 2
wp post meta update $_RGT0051e2d0412 _stock_status instock
wp post meta update $_RGT0051e2d0412 _manage_stock yes
wp post meta update $_RGT0051e2d0412 _backorders yes
wp post meta update $_RGT0051e2d0412 _price 350.00
wp post meta update $_RGT0051e2d0412 _regular_price 350.00
wp post meta update $_RGT0051e2d0412 _sku RGT0051e2d0412
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0051e2d0412 --featured_image=true
echo "Creating Variation: panorama-006"
_RGT0061e2e0413=`wp post create --post_title="panorama-006" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350006 --porcelain`
echo "Setting meta for product: panorama-006 Variation: 006"
wp post meta update $_RGT0061e2e0413 _visibility visible
wp post meta update $_RGT0061e2e0413 attribute_edb_material 006
wp post meta update $_RGT0061e2e0413 _stock 2
wp post meta update $_RGT0061e2e0413 _stock_status instock
wp post meta update $_RGT0061e2e0413 _manage_stock yes
wp post meta update $_RGT0061e2e0413 _backorders yes
wp post meta update $_RGT0061e2e0413 _price 350.00
wp post meta update $_RGT0061e2e0413 _regular_price 350.00
wp post meta update $_RGT0061e2e0413 _sku RGT0061e2e0413
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0061e2e0413 --featured_image=true
echo "Creating Variation: panorama-007"
_RGT0071e2f0414=`wp post create --post_title="panorama-007" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350007 --porcelain`
echo "Setting meta for product: panorama-007 Variation: 007"
wp post meta update $_RGT0071e2f0414 _visibility visible
wp post meta update $_RGT0071e2f0414 attribute_edb_material 007
wp post meta update $_RGT0071e2f0414 _stock 2
wp post meta update $_RGT0071e2f0414 _stock_status instock
wp post meta update $_RGT0071e2f0414 _manage_stock yes
wp post meta update $_RGT0071e2f0414 _backorders yes
wp post meta update $_RGT0071e2f0414 _price 350.00
wp post meta update $_RGT0071e2f0414 _regular_price 350.00
wp post meta update $_RGT0071e2f0414 _sku RGT0071e2f0414
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0071e2f0414 --featured_image=true
echo "Creating Variation: panorama-008"
_RGT0081e300415=`wp post create --post_title="panorama-008" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350008 --porcelain`
echo "Setting meta for product: panorama-008 Variation: 008"
wp post meta update $_RGT0081e300415 _visibility visible
wp post meta update $_RGT0081e300415 attribute_edb_material 008
wp post meta update $_RGT0081e300415 _stock 2
wp post meta update $_RGT0081e300415 _stock_status instock
wp post meta update $_RGT0081e300415 _manage_stock yes
wp post meta update $_RGT0081e300415 _backorders yes
wp post meta update $_RGT0081e300415 _price 350.00
wp post meta update $_RGT0081e300415 _regular_price 350.00
wp post meta update $_RGT0081e300415 _sku RGT0081e300415
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0081e300415 --featured_image=true
echo "Creating Variation: panorama-009"
_RGT0091e310416=`wp post create --post_title="panorama-009" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350009 --porcelain`
echo "Setting meta for product: panorama-009 Variation: 009"
wp post meta update $_RGT0091e310416 _visibility visible
wp post meta update $_RGT0091e310416 attribute_edb_material 009
wp post meta update $_RGT0091e310416 _stock 2
wp post meta update $_RGT0091e310416 _stock_status instock
wp post meta update $_RGT0091e310416 _manage_stock yes
wp post meta update $_RGT0091e310416 _backorders yes
wp post meta update $_RGT0091e310416 _price 350.00
wp post meta update $_RGT0091e310416 _regular_price 350.00
wp post meta update $_RGT0091e310416 _sku RGT0091e310416
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0091e310416 --featured_image=true
echo "Creating Variation: panorama-010"
_RGT0101e2a040e=`wp post create --post_title="panorama-010" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350010 --porcelain`
echo "Setting meta for product: panorama-010 Variation: 010"
wp post meta update $_RGT0101e2a040e _visibility visible
wp post meta update $_RGT0101e2a040e attribute_edb_material 010
wp post meta update $_RGT0101e2a040e _stock 2
wp post meta update $_RGT0101e2a040e _stock_status instock
wp post meta update $_RGT0101e2a040e _manage_stock yes
wp post meta update $_RGT0101e2a040e _backorders yes
wp post meta update $_RGT0101e2a040e _price 350.00
wp post meta update $_RGT0101e2a040e _regular_price 350.00
wp post meta update $_RGT0101e2a040e _sku RGT0101e2a040e
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0101e2a040e --featured_image=true
echo "Creating Variation: panorama-011"
_RGT0111e2b040f=`wp post create --post_title="panorama-011" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350011 --porcelain`
echo "Setting meta for product: panorama-011 Variation: 011"
wp post meta update $_RGT0111e2b040f _visibility visible
wp post meta update $_RGT0111e2b040f attribute_edb_material 011
wp post meta update $_RGT0111e2b040f _stock 2
wp post meta update $_RGT0111e2b040f _stock_status instock
wp post meta update $_RGT0111e2b040f _manage_stock yes
wp post meta update $_RGT0111e2b040f _backorders yes
wp post meta update $_RGT0111e2b040f _price 350.00
wp post meta update $_RGT0111e2b040f _regular_price 350.00
wp post meta update $_RGT0111e2b040f _sku RGT0111e2b040f
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0111e2b040f --featured_image=true
echo "Creating Variation: panorama-012"
_RGT0121e2c0410=`wp post create --post_title="panorama-012" --post_parent=$_RGTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_rgtxxx0f140350012 --porcelain`
echo "Setting meta for product: panorama-012 Variation: 012"
wp post meta update $_RGT0121e2c0410 _visibility visible
wp post meta update $_RGT0121e2c0410 attribute_edb_material 012
wp post meta update $_RGT0121e2c0410 _stock 2
wp post meta update $_RGT0121e2c0410 _stock_status instock
wp post meta update $_RGT0121e2c0410 _manage_stock yes
wp post meta update $_RGT0121e2c0410 _backorders yes
wp post meta update $_RGT0121e2c0410 _price 350.00
wp post meta update $_RGT0121e2c0410 _regular_price 350.00
wp post meta update $_RGT0121e2c0410 _sku RGT0121e2c0410
wp media import ./data/products/15-panorama/gallery/panorama_left_000.jpg --post_id=$_RGT0121e2c0410 --featured_image=true
echo "Creating Product: pique"
_LFTXXX067b0225=`wp post create --post_title="pique" --menu_order=14 --post_name="pique_lftxxx067b0225" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: pique"
wp post meta update $_LFTXXX067b0225 _visibility visible
wp post meta update $_LFTXXX067b0225 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_LFTXXX067b0225 _price 350.00
wp post meta update $_LFTXXX067b0225 _regular_price 350.00
wp post term set $_LFTXXX067b0225 product_shipping_class furniture
wp post term set $_LFTXXX067b0225 product_cat sectionals-left-facing
wp post term set $_LFTXXX067b0225 product_type variable
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFTXXX067b0225 --featured_image=true
_LFTXXX067b0225_0=`wp media import ./data/products/14-pique/gallery/pique_left_0000_001.jpg --post_id=$_LFTXXX067b0225 --porcelain`
_LFTXXX067b0225_1=`wp media import ./data/products/14-pique/gallery/pique_left_0001_002.jpg --post_id=$_LFTXXX067b0225 --porcelain`
_LFTXXX067b0225_2=`wp media import ./data/products/14-pique/gallery/pique_left_0002_003.jpg --post_id=$_LFTXXX067b0225 --porcelain`
_LFTXXX067b0225_3=`wp media import ./data/products/14-pique/gallery/pique_left_0003_004.jpg --post_id=$_LFTXXX067b0225 --porcelain`
_LFTXXX067b0225_4=`wp media import ./data/products/14-pique/gallery/pique_left_0000_005.jpg --post_id=$_LFTXXX067b0225 --porcelain`
_LFTXXX067b0225_5=`wp media import ./data/products/14-pique/gallery/pique_left_0001_006.jpg --post_id=$_LFTXXX067b0225 --porcelain`
_LFTXXX067b0225_6=`wp media import ./data/products/14-pique/gallery/pique_left_0002_007.jpg --post_id=$_LFTXXX067b0225 --porcelain`
wp post meta update $_LFTXXX067b0225 _product_image_gallery $_LFTXXX067b0225_0,$_LFTXXX067b0225_1,$_LFTXXX067b0225_2,$_LFTXXX067b0225_3,$_LFTXXX067b0225_4,$_LFTXXX067b0225_5,$_LFTXXX067b0225_6
echo "Creating Variation: pique-001"
_LFT00110e402e3=`wp post create --post_title="pique-001" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225001 --porcelain`
echo "Setting meta for product: pique-001 Variation: 001"
wp post meta update $_LFT00110e402e3 _visibility visible
wp post meta update $_LFT00110e402e3 attribute_edb_material 001
wp post meta update $_LFT00110e402e3 _stock 2
wp post meta update $_LFT00110e402e3 _stock_status instock
wp post meta update $_LFT00110e402e3 _manage_stock yes
wp post meta update $_LFT00110e402e3 _backorders yes
wp post meta update $_LFT00110e402e3 _price 350.00
wp post meta update $_LFT00110e402e3 _regular_price 350.00
wp post meta update $_LFT00110e402e3 _sku LFT00110e402e3
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT00110e402e3 --featured_image=true
echo "Creating Variation: pique-002"
_LFT00210e502e4=`wp post create --post_title="pique-002" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225002 --porcelain`
echo "Setting meta for product: pique-002 Variation: 002"
wp post meta update $_LFT00210e502e4 _visibility visible
wp post meta update $_LFT00210e502e4 attribute_edb_material 002
wp post meta update $_LFT00210e502e4 _stock 2
wp post meta update $_LFT00210e502e4 _stock_status instock
wp post meta update $_LFT00210e502e4 _manage_stock yes
wp post meta update $_LFT00210e502e4 _backorders yes
wp post meta update $_LFT00210e502e4 _price 350.00
wp post meta update $_LFT00210e502e4 _regular_price 350.00
wp post meta update $_LFT00210e502e4 _sku LFT00210e502e4
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT00210e502e4 --featured_image=true
echo "Creating Variation: pique-003"
_LFT00310e602e5=`wp post create --post_title="pique-003" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225003 --porcelain`
echo "Setting meta for product: pique-003 Variation: 003"
wp post meta update $_LFT00310e602e5 _visibility visible
wp post meta update $_LFT00310e602e5 attribute_edb_material 003
wp post meta update $_LFT00310e602e5 _stock 2
wp post meta update $_LFT00310e602e5 _stock_status instock
wp post meta update $_LFT00310e602e5 _manage_stock yes
wp post meta update $_LFT00310e602e5 _backorders yes
wp post meta update $_LFT00310e602e5 _price 350.00
wp post meta update $_LFT00310e602e5 _regular_price 350.00
wp post meta update $_LFT00310e602e5 _sku LFT00310e602e5
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT00310e602e5 --featured_image=true
echo "Creating Variation: pique-004"
_LFT00410e702e6=`wp post create --post_title="pique-004" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225004 --porcelain`
echo "Setting meta for product: pique-004 Variation: 004"
wp post meta update $_LFT00410e702e6 _visibility visible
wp post meta update $_LFT00410e702e6 attribute_edb_material 004
wp post meta update $_LFT00410e702e6 _stock 2
wp post meta update $_LFT00410e702e6 _stock_status instock
wp post meta update $_LFT00410e702e6 _manage_stock yes
wp post meta update $_LFT00410e702e6 _backorders yes
wp post meta update $_LFT00410e702e6 _price 350.00
wp post meta update $_LFT00410e702e6 _regular_price 350.00
wp post meta update $_LFT00410e702e6 _sku LFT00410e702e6
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT00410e702e6 --featured_image=true
echo "Creating Variation: pique-005"
_LFT00510e802e7=`wp post create --post_title="pique-005" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225005 --porcelain`
echo "Setting meta for product: pique-005 Variation: 005"
wp post meta update $_LFT00510e802e7 _visibility visible
wp post meta update $_LFT00510e802e7 attribute_edb_material 005
wp post meta update $_LFT00510e802e7 _stock 2
wp post meta update $_LFT00510e802e7 _stock_status instock
wp post meta update $_LFT00510e802e7 _manage_stock yes
wp post meta update $_LFT00510e802e7 _backorders yes
wp post meta update $_LFT00510e802e7 _price 350.00
wp post meta update $_LFT00510e802e7 _regular_price 350.00
wp post meta update $_LFT00510e802e7 _sku LFT00510e802e7
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT00510e802e7 --featured_image=true
echo "Creating Variation: pique-006"
_LFT00610e902e8=`wp post create --post_title="pique-006" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225006 --porcelain`
echo "Setting meta for product: pique-006 Variation: 006"
wp post meta update $_LFT00610e902e8 _visibility visible
wp post meta update $_LFT00610e902e8 attribute_edb_material 006
wp post meta update $_LFT00610e902e8 _stock 2
wp post meta update $_LFT00610e902e8 _stock_status instock
wp post meta update $_LFT00610e902e8 _manage_stock yes
wp post meta update $_LFT00610e902e8 _backorders yes
wp post meta update $_LFT00610e902e8 _price 350.00
wp post meta update $_LFT00610e902e8 _regular_price 350.00
wp post meta update $_LFT00610e902e8 _sku LFT00610e902e8
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT00610e902e8 --featured_image=true
echo "Creating Variation: pique-007"
_LFT00710ea02e9=`wp post create --post_title="pique-007" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225007 --porcelain`
echo "Setting meta for product: pique-007 Variation: 007"
wp post meta update $_LFT00710ea02e9 _visibility visible
wp post meta update $_LFT00710ea02e9 attribute_edb_material 007
wp post meta update $_LFT00710ea02e9 _stock 2
wp post meta update $_LFT00710ea02e9 _stock_status instock
wp post meta update $_LFT00710ea02e9 _manage_stock yes
wp post meta update $_LFT00710ea02e9 _backorders yes
wp post meta update $_LFT00710ea02e9 _price 350.00
wp post meta update $_LFT00710ea02e9 _regular_price 350.00
wp post meta update $_LFT00710ea02e9 _sku LFT00710ea02e9
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT00710ea02e9 --featured_image=true
echo "Creating Variation: pique-008"
_LFT00810eb02ea=`wp post create --post_title="pique-008" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225008 --porcelain`
echo "Setting meta for product: pique-008 Variation: 008"
wp post meta update $_LFT00810eb02ea _visibility visible
wp post meta update $_LFT00810eb02ea attribute_edb_material 008
wp post meta update $_LFT00810eb02ea _stock 2
wp post meta update $_LFT00810eb02ea _stock_status instock
wp post meta update $_LFT00810eb02ea _manage_stock yes
wp post meta update $_LFT00810eb02ea _backorders yes
wp post meta update $_LFT00810eb02ea _price 350.00
wp post meta update $_LFT00810eb02ea _regular_price 350.00
wp post meta update $_LFT00810eb02ea _sku LFT00810eb02ea
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT00810eb02ea --featured_image=true
echo "Creating Variation: pique-009"
_LFT00910ec02eb=`wp post create --post_title="pique-009" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225009 --porcelain`
echo "Setting meta for product: pique-009 Variation: 009"
wp post meta update $_LFT00910ec02eb _visibility visible
wp post meta update $_LFT00910ec02eb attribute_edb_material 009
wp post meta update $_LFT00910ec02eb _stock 2
wp post meta update $_LFT00910ec02eb _stock_status instock
wp post meta update $_LFT00910ec02eb _manage_stock yes
wp post meta update $_LFT00910ec02eb _backorders yes
wp post meta update $_LFT00910ec02eb _price 350.00
wp post meta update $_LFT00910ec02eb _regular_price 350.00
wp post meta update $_LFT00910ec02eb _sku LFT00910ec02eb
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT00910ec02eb --featured_image=true
echo "Creating Variation: pique-010"
_LFT01010e502e3=`wp post create --post_title="pique-010" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225010 --porcelain`
echo "Setting meta for product: pique-010 Variation: 010"
wp post meta update $_LFT01010e502e3 _visibility visible
wp post meta update $_LFT01010e502e3 attribute_edb_material 010
wp post meta update $_LFT01010e502e3 _stock 2
wp post meta update $_LFT01010e502e3 _stock_status instock
wp post meta update $_LFT01010e502e3 _manage_stock yes
wp post meta update $_LFT01010e502e3 _backorders yes
wp post meta update $_LFT01010e502e3 _price 350.00
wp post meta update $_LFT01010e502e3 _regular_price 350.00
wp post meta update $_LFT01010e502e3 _sku LFT01010e502e3
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT01010e502e3 --featured_image=true
echo "Creating Variation: pique-011"
_LFT01110e602e4=`wp post create --post_title="pique-011" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225011 --porcelain`
echo "Setting meta for product: pique-011 Variation: 011"
wp post meta update $_LFT01110e602e4 _visibility visible
wp post meta update $_LFT01110e602e4 attribute_edb_material 011
wp post meta update $_LFT01110e602e4 _stock 2
wp post meta update $_LFT01110e602e4 _stock_status instock
wp post meta update $_LFT01110e602e4 _manage_stock yes
wp post meta update $_LFT01110e602e4 _backorders yes
wp post meta update $_LFT01110e602e4 _price 350.00
wp post meta update $_LFT01110e602e4 _regular_price 350.00
wp post meta update $_LFT01110e602e4 _sku LFT01110e602e4
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT01110e602e4 --featured_image=true
echo "Creating Variation: pique-012"
_LFT01210e702e5=`wp post create --post_title="pique-012" --post_parent=$_LFTXXX067b0225 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=pique_lftxxx067b0225012 --porcelain`
echo "Setting meta for product: pique-012 Variation: 012"
wp post meta update $_LFT01210e702e5 _visibility visible
wp post meta update $_LFT01210e702e5 attribute_edb_material 012
wp post meta update $_LFT01210e702e5 _stock 2
wp post meta update $_LFT01210e702e5 _stock_status instock
wp post meta update $_LFT01210e702e5 _manage_stock yes
wp post meta update $_LFT01210e702e5 _backorders yes
wp post meta update $_LFT01210e702e5 _price 350.00
wp post meta update $_LFT01210e702e5 _regular_price 350.00
wp post meta update $_LFT01210e702e5 _sku LFT01210e702e5
wp media import ./data/products/14-pique/gallery/pique_left_000.jpg --post_id=$_LFT01210e702e5 --featured_image=true
echo "Creating Product: mixmix"
_LFTXXX0912029d=`wp post create --post_title="mixmix" --menu_order=13 --post_name="mixmix_lftxxx0912029d" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: mixmix"
wp post meta update $_LFTXXX0912029d _subtitle "{:en}rec{:}{:fr}rec{:}"
wp post meta update $_LFTXXX0912029d _visibility visible
wp post meta update $_LFTXXX0912029d _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_LFTXXX0912029d _price 350.00
wp post meta update $_LFTXXX0912029d _regular_price 350.00
wp post term set $_LFTXXX0912029d product_shipping_class furniture
wp post term set $_LFTXXX0912029d product_cat sectionals-left-facing
wp post term set $_LFTXXX0912029d product_type variable
wp post meta update $_LFTXXX0912029d _subtitle "{:en}rec{:}{:fr}rec{:}"
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFTXXX0912029d --featured_image=true
_LFTXXX0912029d_0=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_left_0000_001.jpg --post_id=$_LFTXXX0912029d --porcelain`
_LFTXXX0912029d_1=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_left_0001_002.jpg --post_id=$_LFTXXX0912029d --porcelain`
_LFTXXX0912029d_2=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_left_0002_003.jpg --post_id=$_LFTXXX0912029d --porcelain`
_LFTXXX0912029d_3=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0000_004.jpg --post_id=$_LFTXXX0912029d --porcelain`
_LFTXXX0912029d_4=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0001_005.jpg --post_id=$_LFTXXX0912029d --porcelain`
_LFTXXX0912029d_5=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0002_006.jpg --post_id=$_LFTXXX0912029d --porcelain`
_LFTXXX0912029d_6=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0003_007.jpg --post_id=$_LFTXXX0912029d --porcelain`
_LFTXXX0912029d_7=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0004_008.jpg --post_id=$_LFTXXX0912029d --porcelain`
_LFTXXX0912029d_8=`wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_0005_009.jpg --post_id=$_LFTXXX0912029d --porcelain`
wp post meta update $_LFTXXX0912029d _product_image_gallery $_LFTXXX0912029d_0,$_LFTXXX0912029d_1,$_LFTXXX0912029d_2,$_LFTXXX0912029d_3,$_LFTXXX0912029d_4,$_LFTXXX0912029d_5,$_LFTXXX0912029d_6,$_LFTXXX0912029d_7,$_LFTXXX0912029d_8
echo "Creating Variation: mixmix-001"
_LFT001155b035b=`wp post create --post_title="mixmix-001" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d001 --porcelain`
echo "Setting meta for product: mixmix-001 Variation: 001"
wp post meta update $_LFT001155b035b _visibility visible
wp post meta update $_LFT001155b035b attribute_edb_material 001
wp post meta update $_LFT001155b035b _stock 2
wp post meta update $_LFT001155b035b _stock_status instock
wp post meta update $_LFT001155b035b _manage_stock yes
wp post meta update $_LFT001155b035b _backorders yes
wp post meta update $_LFT001155b035b _price 350.00
wp post meta update $_LFT001155b035b _regular_price 350.00
wp post meta update $_LFT001155b035b _sku LFT001155b035b
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT001155b035b --featured_image=true
echo "Creating Variation: mixmix-002"
_LFT002155c035c=`wp post create --post_title="mixmix-002" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d002 --porcelain`
echo "Setting meta for product: mixmix-002 Variation: 002"
wp post meta update $_LFT002155c035c _visibility visible
wp post meta update $_LFT002155c035c attribute_edb_material 002
wp post meta update $_LFT002155c035c _stock 2
wp post meta update $_LFT002155c035c _stock_status instock
wp post meta update $_LFT002155c035c _manage_stock yes
wp post meta update $_LFT002155c035c _backorders yes
wp post meta update $_LFT002155c035c _price 350.00
wp post meta update $_LFT002155c035c _regular_price 350.00
wp post meta update $_LFT002155c035c _sku LFT002155c035c
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT002155c035c --featured_image=true
echo "Creating Variation: mixmix-003"
_LFT003155d035d=`wp post create --post_title="mixmix-003" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d003 --porcelain`
echo "Setting meta for product: mixmix-003 Variation: 003"
wp post meta update $_LFT003155d035d _visibility visible
wp post meta update $_LFT003155d035d attribute_edb_material 003
wp post meta update $_LFT003155d035d _stock 2
wp post meta update $_LFT003155d035d _stock_status instock
wp post meta update $_LFT003155d035d _manage_stock yes
wp post meta update $_LFT003155d035d _backorders yes
wp post meta update $_LFT003155d035d _price 350.00
wp post meta update $_LFT003155d035d _regular_price 350.00
wp post meta update $_LFT003155d035d _sku LFT003155d035d
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT003155d035d --featured_image=true
echo "Creating Variation: mixmix-004"
_LFT004155e035e=`wp post create --post_title="mixmix-004" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d004 --porcelain`
echo "Setting meta for product: mixmix-004 Variation: 004"
wp post meta update $_LFT004155e035e _visibility visible
wp post meta update $_LFT004155e035e attribute_edb_material 004
wp post meta update $_LFT004155e035e _stock 2
wp post meta update $_LFT004155e035e _stock_status instock
wp post meta update $_LFT004155e035e _manage_stock yes
wp post meta update $_LFT004155e035e _backorders yes
wp post meta update $_LFT004155e035e _price 350.00
wp post meta update $_LFT004155e035e _regular_price 350.00
wp post meta update $_LFT004155e035e _sku LFT004155e035e
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT004155e035e --featured_image=true
echo "Creating Variation: mixmix-005"
_LFT005155f035f=`wp post create --post_title="mixmix-005" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d005 --porcelain`
echo "Setting meta for product: mixmix-005 Variation: 005"
wp post meta update $_LFT005155f035f _visibility visible
wp post meta update $_LFT005155f035f attribute_edb_material 005
wp post meta update $_LFT005155f035f _stock 2
wp post meta update $_LFT005155f035f _stock_status instock
wp post meta update $_LFT005155f035f _manage_stock yes
wp post meta update $_LFT005155f035f _backorders yes
wp post meta update $_LFT005155f035f _price 350.00
wp post meta update $_LFT005155f035f _regular_price 350.00
wp post meta update $_LFT005155f035f _sku LFT005155f035f
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT005155f035f --featured_image=true
echo "Creating Variation: mixmix-006"
_LFT00615600360=`wp post create --post_title="mixmix-006" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d006 --porcelain`
echo "Setting meta for product: mixmix-006 Variation: 006"
wp post meta update $_LFT00615600360 _visibility visible
wp post meta update $_LFT00615600360 attribute_edb_material 006
wp post meta update $_LFT00615600360 _stock 2
wp post meta update $_LFT00615600360 _stock_status instock
wp post meta update $_LFT00615600360 _manage_stock yes
wp post meta update $_LFT00615600360 _backorders yes
wp post meta update $_LFT00615600360 _price 350.00
wp post meta update $_LFT00615600360 _regular_price 350.00
wp post meta update $_LFT00615600360 _sku LFT00615600360
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT00615600360 --featured_image=true
echo "Creating Variation: mixmix-007"
_LFT00715610361=`wp post create --post_title="mixmix-007" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d007 --porcelain`
echo "Setting meta for product: mixmix-007 Variation: 007"
wp post meta update $_LFT00715610361 _visibility visible
wp post meta update $_LFT00715610361 attribute_edb_material 007
wp post meta update $_LFT00715610361 _stock 2
wp post meta update $_LFT00715610361 _stock_status instock
wp post meta update $_LFT00715610361 _manage_stock yes
wp post meta update $_LFT00715610361 _backorders yes
wp post meta update $_LFT00715610361 _price 350.00
wp post meta update $_LFT00715610361 _regular_price 350.00
wp post meta update $_LFT00715610361 _sku LFT00715610361
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT00715610361 --featured_image=true
echo "Creating Variation: mixmix-008"
_LFT00815620362=`wp post create --post_title="mixmix-008" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d008 --porcelain`
echo "Setting meta for product: mixmix-008 Variation: 008"
wp post meta update $_LFT00815620362 _visibility visible
wp post meta update $_LFT00815620362 attribute_edb_material 008
wp post meta update $_LFT00815620362 _stock 2
wp post meta update $_LFT00815620362 _stock_status instock
wp post meta update $_LFT00815620362 _manage_stock yes
wp post meta update $_LFT00815620362 _backorders yes
wp post meta update $_LFT00815620362 _price 350.00
wp post meta update $_LFT00815620362 _regular_price 350.00
wp post meta update $_LFT00815620362 _sku LFT00815620362
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT00815620362 --featured_image=true
echo "Creating Variation: mixmix-009"
_LFT00915630363=`wp post create --post_title="mixmix-009" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d009 --porcelain`
echo "Setting meta for product: mixmix-009 Variation: 009"
wp post meta update $_LFT00915630363 _visibility visible
wp post meta update $_LFT00915630363 attribute_edb_material 009
wp post meta update $_LFT00915630363 _stock 2
wp post meta update $_LFT00915630363 _stock_status instock
wp post meta update $_LFT00915630363 _manage_stock yes
wp post meta update $_LFT00915630363 _backorders yes
wp post meta update $_LFT00915630363 _price 350.00
wp post meta update $_LFT00915630363 _regular_price 350.00
wp post meta update $_LFT00915630363 _sku LFT00915630363
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT00915630363 --featured_image=true
echo "Creating Variation: mixmix-010"
_LFT010155c035b=`wp post create --post_title="mixmix-010" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d010 --porcelain`
echo "Setting meta for product: mixmix-010 Variation: 010"
wp post meta update $_LFT010155c035b _visibility visible
wp post meta update $_LFT010155c035b attribute_edb_material 010
wp post meta update $_LFT010155c035b _stock 2
wp post meta update $_LFT010155c035b _stock_status instock
wp post meta update $_LFT010155c035b _manage_stock yes
wp post meta update $_LFT010155c035b _backorders yes
wp post meta update $_LFT010155c035b _price 350.00
wp post meta update $_LFT010155c035b _regular_price 350.00
wp post meta update $_LFT010155c035b _sku LFT010155c035b
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT010155c035b --featured_image=true
echo "Creating Variation: mixmix-011"
_LFT011155d035c=`wp post create --post_title="mixmix-011" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d011 --porcelain`
echo "Setting meta for product: mixmix-011 Variation: 011"
wp post meta update $_LFT011155d035c _visibility visible
wp post meta update $_LFT011155d035c attribute_edb_material 011
wp post meta update $_LFT011155d035c _stock 2
wp post meta update $_LFT011155d035c _stock_status instock
wp post meta update $_LFT011155d035c _manage_stock yes
wp post meta update $_LFT011155d035c _backorders yes
wp post meta update $_LFT011155d035c _price 350.00
wp post meta update $_LFT011155d035c _regular_price 350.00
wp post meta update $_LFT011155d035c _sku LFT011155d035c
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT011155d035c --featured_image=true
echo "Creating Variation: mixmix-012"
_LFT012155e035d=`wp post create --post_title="mixmix-012" --post_parent=$_LFTXXX0912029d --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=mixmix_lftxxx0912029d012 --porcelain`
echo "Setting meta for product: mixmix-012 Variation: 012"
wp post meta update $_LFT012155e035d _visibility visible
wp post meta update $_LFT012155e035d attribute_edb_material 012
wp post meta update $_LFT012155e035d _stock 2
wp post meta update $_LFT012155e035d _stock_status instock
wp post meta update $_LFT012155e035d _manage_stock yes
wp post meta update $_LFT012155e035d _backorders yes
wp post meta update $_LFT012155e035d _price 350.00
wp post meta update $_LFT012155e035d _regular_price 350.00
wp post meta update $_LFT012155e035d _sku LFT012155e035d
wp media import ./data/products/13-mixmix_rec/gallery/mixmix_sectional_000.jpg --post_id=$_LFT012155e035d --featured_image=true
echo "Creating Product: flex"
_LFTXXX042201b0=`wp post create --post_title="flex" --menu_order=12 --post_name="flex_lftxxx042201b0" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: flex"
wp post meta update $_LFTXXX042201b0 _visibility visible
wp post meta update $_LFTXXX042201b0 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_LFTXXX042201b0 _price 350.00
wp post meta update $_LFTXXX042201b0 _regular_price 350.00
wp post term set $_LFTXXX042201b0 product_shipping_class furniture
wp post term set $_LFTXXX042201b0 product_cat sectionals-left-facing
wp post term set $_LFTXXX042201b0 product_type variable
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFTXXX042201b0 --featured_image=true
_LFTXXX042201b0_0=`wp media import ./data/products/12-flex/gallery/flex_0000_001.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_1=`wp media import ./data/products/12-flex/gallery/flex_0001_002.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_2=`wp media import ./data/products/12-flex/gallery/flex_0002_003.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_3=`wp media import ./data/products/12-flex/gallery/flex_0003_004.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_4=`wp media import ./data/products/12-flex/gallery/flex_0004_005.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_5=`wp media import ./data/products/12-flex/gallery/flex_0005_006.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_6=`wp media import ./data/products/12-flex/gallery/flex_0006_007.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_7=`wp media import ./data/products/12-flex/gallery/flex_0000_008.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_8=`wp media import ./data/products/12-flex/gallery/flex_0001_009.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_9=`wp media import ./data/products/12-flex/gallery/flex_0002_010.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_10=`wp media import ./data/products/12-flex/gallery/flex_0003_011.jpg --post_id=$_LFTXXX042201b0 --porcelain`
_LFTXXX042201b0_11=`wp media import ./data/products/12-flex/gallery/flex_0004_012.jpg --post_id=$_LFTXXX042201b0 --porcelain`
wp post meta update $_LFTXXX042201b0 _product_image_gallery $_LFTXXX042201b0_0,$_LFTXXX042201b0_1,$_LFTXXX042201b0_2,$_LFTXXX042201b0_3,$_LFTXXX042201b0_4,$_LFTXXX042201b0_5,$_LFTXXX042201b0_6,$_LFTXXX042201b0_7,$_LFTXXX042201b0_8,$_LFTXXX042201b0_9,$_LFTXXX042201b0_10,$_LFTXXX042201b0_11
echo "Creating Variation: flex-001"
_LFT0010cb7026e=`wp post create --post_title="flex-001" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0001 --porcelain`
echo "Setting meta for product: flex-001 Variation: 001"
wp post meta update $_LFT0010cb7026e _visibility visible
wp post meta update $_LFT0010cb7026e attribute_edb_material 001
wp post meta update $_LFT0010cb7026e _stock 2
wp post meta update $_LFT0010cb7026e _stock_status instock
wp post meta update $_LFT0010cb7026e _manage_stock yes
wp post meta update $_LFT0010cb7026e _backorders yes
wp post meta update $_LFT0010cb7026e _price 350.00
wp post meta update $_LFT0010cb7026e _regular_price 350.00
wp post meta update $_LFT0010cb7026e _sku LFT0010cb7026e
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0010cb7026e --featured_image=true
echo "Creating Variation: flex-002"
_LFT0020cb8026f=`wp post create --post_title="flex-002" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0002 --porcelain`
echo "Setting meta for product: flex-002 Variation: 002"
wp post meta update $_LFT0020cb8026f _visibility visible
wp post meta update $_LFT0020cb8026f attribute_edb_material 002
wp post meta update $_LFT0020cb8026f _stock 2
wp post meta update $_LFT0020cb8026f _stock_status instock
wp post meta update $_LFT0020cb8026f _manage_stock yes
wp post meta update $_LFT0020cb8026f _backorders yes
wp post meta update $_LFT0020cb8026f _price 350.00
wp post meta update $_LFT0020cb8026f _regular_price 350.00
wp post meta update $_LFT0020cb8026f _sku LFT0020cb8026f
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0020cb8026f --featured_image=true
echo "Creating Variation: flex-003"
_LFT0030cb90270=`wp post create --post_title="flex-003" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0003 --porcelain`
echo "Setting meta for product: flex-003 Variation: 003"
wp post meta update $_LFT0030cb90270 _visibility visible
wp post meta update $_LFT0030cb90270 attribute_edb_material 003
wp post meta update $_LFT0030cb90270 _stock 2
wp post meta update $_LFT0030cb90270 _stock_status instock
wp post meta update $_LFT0030cb90270 _manage_stock yes
wp post meta update $_LFT0030cb90270 _backorders yes
wp post meta update $_LFT0030cb90270 _price 350.00
wp post meta update $_LFT0030cb90270 _regular_price 350.00
wp post meta update $_LFT0030cb90270 _sku LFT0030cb90270
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0030cb90270 --featured_image=true
echo "Creating Variation: flex-004"
_LFT0040cba0271=`wp post create --post_title="flex-004" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0004 --porcelain`
echo "Setting meta for product: flex-004 Variation: 004"
wp post meta update $_LFT0040cba0271 _visibility visible
wp post meta update $_LFT0040cba0271 attribute_edb_material 004
wp post meta update $_LFT0040cba0271 _stock 2
wp post meta update $_LFT0040cba0271 _stock_status instock
wp post meta update $_LFT0040cba0271 _manage_stock yes
wp post meta update $_LFT0040cba0271 _backorders yes
wp post meta update $_LFT0040cba0271 _price 350.00
wp post meta update $_LFT0040cba0271 _regular_price 350.00
wp post meta update $_LFT0040cba0271 _sku LFT0040cba0271
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0040cba0271 --featured_image=true
echo "Creating Variation: flex-005"
_LFT0050cbb0272=`wp post create --post_title="flex-005" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0005 --porcelain`
echo "Setting meta for product: flex-005 Variation: 005"
wp post meta update $_LFT0050cbb0272 _visibility visible
wp post meta update $_LFT0050cbb0272 attribute_edb_material 005
wp post meta update $_LFT0050cbb0272 _stock 2
wp post meta update $_LFT0050cbb0272 _stock_status instock
wp post meta update $_LFT0050cbb0272 _manage_stock yes
wp post meta update $_LFT0050cbb0272 _backorders yes
wp post meta update $_LFT0050cbb0272 _price 350.00
wp post meta update $_LFT0050cbb0272 _regular_price 350.00
wp post meta update $_LFT0050cbb0272 _sku LFT0050cbb0272
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0050cbb0272 --featured_image=true
echo "Creating Variation: flex-006"
_LFT0060cbc0273=`wp post create --post_title="flex-006" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0006 --porcelain`
echo "Setting meta for product: flex-006 Variation: 006"
wp post meta update $_LFT0060cbc0273 _visibility visible
wp post meta update $_LFT0060cbc0273 attribute_edb_material 006
wp post meta update $_LFT0060cbc0273 _stock 2
wp post meta update $_LFT0060cbc0273 _stock_status instock
wp post meta update $_LFT0060cbc0273 _manage_stock yes
wp post meta update $_LFT0060cbc0273 _backorders yes
wp post meta update $_LFT0060cbc0273 _price 350.00
wp post meta update $_LFT0060cbc0273 _regular_price 350.00
wp post meta update $_LFT0060cbc0273 _sku LFT0060cbc0273
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0060cbc0273 --featured_image=true
echo "Creating Variation: flex-007"
_LFT0070cbd0274=`wp post create --post_title="flex-007" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0007 --porcelain`
echo "Setting meta for product: flex-007 Variation: 007"
wp post meta update $_LFT0070cbd0274 _visibility visible
wp post meta update $_LFT0070cbd0274 attribute_edb_material 007
wp post meta update $_LFT0070cbd0274 _stock 2
wp post meta update $_LFT0070cbd0274 _stock_status instock
wp post meta update $_LFT0070cbd0274 _manage_stock yes
wp post meta update $_LFT0070cbd0274 _backorders yes
wp post meta update $_LFT0070cbd0274 _price 350.00
wp post meta update $_LFT0070cbd0274 _regular_price 350.00
wp post meta update $_LFT0070cbd0274 _sku LFT0070cbd0274
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0070cbd0274 --featured_image=true
echo "Creating Variation: flex-008"
_LFT0080cbe0275=`wp post create --post_title="flex-008" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0008 --porcelain`
echo "Setting meta for product: flex-008 Variation: 008"
wp post meta update $_LFT0080cbe0275 _visibility visible
wp post meta update $_LFT0080cbe0275 attribute_edb_material 008
wp post meta update $_LFT0080cbe0275 _stock 2
wp post meta update $_LFT0080cbe0275 _stock_status instock
wp post meta update $_LFT0080cbe0275 _manage_stock yes
wp post meta update $_LFT0080cbe0275 _backorders yes
wp post meta update $_LFT0080cbe0275 _price 350.00
wp post meta update $_LFT0080cbe0275 _regular_price 350.00
wp post meta update $_LFT0080cbe0275 _sku LFT0080cbe0275
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0080cbe0275 --featured_image=true
echo "Creating Variation: flex-009"
_LFT0090cbf0276=`wp post create --post_title="flex-009" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0009 --porcelain`
echo "Setting meta for product: flex-009 Variation: 009"
wp post meta update $_LFT0090cbf0276 _visibility visible
wp post meta update $_LFT0090cbf0276 attribute_edb_material 009
wp post meta update $_LFT0090cbf0276 _stock 2
wp post meta update $_LFT0090cbf0276 _stock_status instock
wp post meta update $_LFT0090cbf0276 _manage_stock yes
wp post meta update $_LFT0090cbf0276 _backorders yes
wp post meta update $_LFT0090cbf0276 _price 350.00
wp post meta update $_LFT0090cbf0276 _regular_price 350.00
wp post meta update $_LFT0090cbf0276 _sku LFT0090cbf0276
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0090cbf0276 --featured_image=true
echo "Creating Variation: flex-010"
_LFT0100cb8026e=`wp post create --post_title="flex-010" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0010 --porcelain`
echo "Setting meta for product: flex-010 Variation: 010"
wp post meta update $_LFT0100cb8026e _visibility visible
wp post meta update $_LFT0100cb8026e attribute_edb_material 010
wp post meta update $_LFT0100cb8026e _stock 2
wp post meta update $_LFT0100cb8026e _stock_status instock
wp post meta update $_LFT0100cb8026e _manage_stock yes
wp post meta update $_LFT0100cb8026e _backorders yes
wp post meta update $_LFT0100cb8026e _price 350.00
wp post meta update $_LFT0100cb8026e _regular_price 350.00
wp post meta update $_LFT0100cb8026e _sku LFT0100cb8026e
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0100cb8026e --featured_image=true
echo "Creating Variation: flex-011"
_LFT0110cb9026f=`wp post create --post_title="flex-011" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0011 --porcelain`
echo "Setting meta for product: flex-011 Variation: 011"
wp post meta update $_LFT0110cb9026f _visibility visible
wp post meta update $_LFT0110cb9026f attribute_edb_material 011
wp post meta update $_LFT0110cb9026f _stock 2
wp post meta update $_LFT0110cb9026f _stock_status instock
wp post meta update $_LFT0110cb9026f _manage_stock yes
wp post meta update $_LFT0110cb9026f _backorders yes
wp post meta update $_LFT0110cb9026f _price 350.00
wp post meta update $_LFT0110cb9026f _regular_price 350.00
wp post meta update $_LFT0110cb9026f _sku LFT0110cb9026f
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0110cb9026f --featured_image=true
echo "Creating Variation: flex-012"
_LFT0120cba0270=`wp post create --post_title="flex-012" --post_parent=$_LFTXXX042201b0 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=flex_lftxxx042201b0012 --porcelain`
echo "Setting meta for product: flex-012 Variation: 012"
wp post meta update $_LFT0120cba0270 _visibility visible
wp post meta update $_LFT0120cba0270 attribute_edb_material 012
wp post meta update $_LFT0120cba0270 _stock 2
wp post meta update $_LFT0120cba0270 _stock_status instock
wp post meta update $_LFT0120cba0270 _manage_stock yes
wp post meta update $_LFT0120cba0270 _backorders yes
wp post meta update $_LFT0120cba0270 _price 350.00
wp post meta update $_LFT0120cba0270 _regular_price 350.00
wp post meta update $_LFT0120cba0270 _sku LFT0120cba0270
wp media import ./data/products/12-flex/gallery/flex_000.jpg --post_id=$_LFT0120cba0270 --featured_image=true
echo "Creating Product: panorama"
_LFTXXX0f140350=`wp post create --post_title="panorama" --menu_order=11 --post_name="panorama_lftxxx0f140350" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: panorama"
wp post meta update $_LFTXXX0f140350 _visibility visible
wp post meta update $_LFTXXX0f140350 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_LFTXXX0f140350 _price 350.00
wp post meta update $_LFTXXX0f140350 _regular_price 350.00
wp post term set $_LFTXXX0f140350 product_shipping_class furniture
wp post term set $_LFTXXX0f140350 product_cat sectionals-left-facing
wp post term set $_LFTXXX0f140350 product_type variable
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFTXXX0f140350 --featured_image=true
_LFTXXX0f140350_0=`wp media import ./data/products/11-panorama/gallery/panorama_left_0000_001.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_1=`wp media import ./data/products/11-panorama/gallery/panorama_left_0001_002.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_2=`wp media import ./data/products/11-panorama/gallery/panorama_left_0002_003.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_3=`wp media import ./data/products/11-panorama/gallery/panorama_left_0003_004.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_4=`wp media import ./data/products/11-panorama/gallery/panorama_left_0004_005.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_5=`wp media import ./data/products/11-panorama/gallery/panorama_left_0005_006.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_6=`wp media import ./data/products/11-panorama/gallery/panorama_left_0006_007.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_7=`wp media import ./data/products/11-panorama/gallery/panorama_left_0000_008.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_8=`wp media import ./data/products/11-panorama/gallery/panorama_left_0001_009.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_9=`wp media import ./data/products/11-panorama/gallery/panorama_left_0002_010.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_10=`wp media import ./data/products/11-panorama/gallery/panorama_left_0003_011.jpg --post_id=$_LFTXXX0f140350 --porcelain`
_LFTXXX0f140350_11=`wp media import ./data/products/11-panorama/gallery/panorama_left_0004_012.jpg --post_id=$_LFTXXX0f140350 --porcelain`
wp post meta update $_LFTXXX0f140350 _product_image_gallery $_LFTXXX0f140350_0,$_LFTXXX0f140350_1,$_LFTXXX0f140350_2,$_LFTXXX0f140350_3,$_LFTXXX0f140350_4,$_LFTXXX0f140350_5,$_LFTXXX0f140350_6,$_LFTXXX0f140350_7,$_LFTXXX0f140350_8,$_LFTXXX0f140350_9,$_LFTXXX0f140350_10,$_LFTXXX0f140350_11
echo "Creating Variation: panorama-001"
_LFT0011e29040e=`wp post create --post_title="panorama-001" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350001 --porcelain`
echo "Setting meta for product: panorama-001 Variation: 001"
wp post meta update $_LFT0011e29040e _visibility visible
wp post meta update $_LFT0011e29040e attribute_edb_material 001
wp post meta update $_LFT0011e29040e _stock 2
wp post meta update $_LFT0011e29040e _stock_status instock
wp post meta update $_LFT0011e29040e _manage_stock yes
wp post meta update $_LFT0011e29040e _backorders yes
wp post meta update $_LFT0011e29040e _price 350.00
wp post meta update $_LFT0011e29040e _regular_price 350.00
wp post meta update $_LFT0011e29040e _sku LFT0011e29040e
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0011e29040e --featured_image=true
echo "Creating Variation: panorama-002"
_LFT0021e2a040f=`wp post create --post_title="panorama-002" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350002 --porcelain`
echo "Setting meta for product: panorama-002 Variation: 002"
wp post meta update $_LFT0021e2a040f _visibility visible
wp post meta update $_LFT0021e2a040f attribute_edb_material 002
wp post meta update $_LFT0021e2a040f _stock 2
wp post meta update $_LFT0021e2a040f _stock_status instock
wp post meta update $_LFT0021e2a040f _manage_stock yes
wp post meta update $_LFT0021e2a040f _backorders yes
wp post meta update $_LFT0021e2a040f _price 350.00
wp post meta update $_LFT0021e2a040f _regular_price 350.00
wp post meta update $_LFT0021e2a040f _sku LFT0021e2a040f
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0021e2a040f --featured_image=true
echo "Creating Variation: panorama-003"
_LFT0031e2b0410=`wp post create --post_title="panorama-003" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350003 --porcelain`
echo "Setting meta for product: panorama-003 Variation: 003"
wp post meta update $_LFT0031e2b0410 _visibility visible
wp post meta update $_LFT0031e2b0410 attribute_edb_material 003
wp post meta update $_LFT0031e2b0410 _stock 2
wp post meta update $_LFT0031e2b0410 _stock_status instock
wp post meta update $_LFT0031e2b0410 _manage_stock yes
wp post meta update $_LFT0031e2b0410 _backorders yes
wp post meta update $_LFT0031e2b0410 _price 350.00
wp post meta update $_LFT0031e2b0410 _regular_price 350.00
wp post meta update $_LFT0031e2b0410 _sku LFT0031e2b0410
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0031e2b0410 --featured_image=true
echo "Creating Variation: panorama-004"
_LFT0041e2c0411=`wp post create --post_title="panorama-004" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350004 --porcelain`
echo "Setting meta for product: panorama-004 Variation: 004"
wp post meta update $_LFT0041e2c0411 _visibility visible
wp post meta update $_LFT0041e2c0411 attribute_edb_material 004
wp post meta update $_LFT0041e2c0411 _stock 2
wp post meta update $_LFT0041e2c0411 _stock_status instock
wp post meta update $_LFT0041e2c0411 _manage_stock yes
wp post meta update $_LFT0041e2c0411 _backorders yes
wp post meta update $_LFT0041e2c0411 _price 350.00
wp post meta update $_LFT0041e2c0411 _regular_price 350.00
wp post meta update $_LFT0041e2c0411 _sku LFT0041e2c0411
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0041e2c0411 --featured_image=true
echo "Creating Variation: panorama-005"
_LFT0051e2d0412=`wp post create --post_title="panorama-005" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350005 --porcelain`
echo "Setting meta for product: panorama-005 Variation: 005"
wp post meta update $_LFT0051e2d0412 _visibility visible
wp post meta update $_LFT0051e2d0412 attribute_edb_material 005
wp post meta update $_LFT0051e2d0412 _stock 2
wp post meta update $_LFT0051e2d0412 _stock_status instock
wp post meta update $_LFT0051e2d0412 _manage_stock yes
wp post meta update $_LFT0051e2d0412 _backorders yes
wp post meta update $_LFT0051e2d0412 _price 350.00
wp post meta update $_LFT0051e2d0412 _regular_price 350.00
wp post meta update $_LFT0051e2d0412 _sku LFT0051e2d0412
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0051e2d0412 --featured_image=true
echo "Creating Variation: panorama-006"
_LFT0061e2e0413=`wp post create --post_title="panorama-006" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350006 --porcelain`
echo "Setting meta for product: panorama-006 Variation: 006"
wp post meta update $_LFT0061e2e0413 _visibility visible
wp post meta update $_LFT0061e2e0413 attribute_edb_material 006
wp post meta update $_LFT0061e2e0413 _stock 2
wp post meta update $_LFT0061e2e0413 _stock_status instock
wp post meta update $_LFT0061e2e0413 _manage_stock yes
wp post meta update $_LFT0061e2e0413 _backorders yes
wp post meta update $_LFT0061e2e0413 _price 350.00
wp post meta update $_LFT0061e2e0413 _regular_price 350.00
wp post meta update $_LFT0061e2e0413 _sku LFT0061e2e0413
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0061e2e0413 --featured_image=true
echo "Creating Variation: panorama-007"
_LFT0071e2f0414=`wp post create --post_title="panorama-007" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350007 --porcelain`
echo "Setting meta for product: panorama-007 Variation: 007"
wp post meta update $_LFT0071e2f0414 _visibility visible
wp post meta update $_LFT0071e2f0414 attribute_edb_material 007
wp post meta update $_LFT0071e2f0414 _stock 2
wp post meta update $_LFT0071e2f0414 _stock_status instock
wp post meta update $_LFT0071e2f0414 _manage_stock yes
wp post meta update $_LFT0071e2f0414 _backorders yes
wp post meta update $_LFT0071e2f0414 _price 350.00
wp post meta update $_LFT0071e2f0414 _regular_price 350.00
wp post meta update $_LFT0071e2f0414 _sku LFT0071e2f0414
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0071e2f0414 --featured_image=true
echo "Creating Variation: panorama-008"
_LFT0081e300415=`wp post create --post_title="panorama-008" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350008 --porcelain`
echo "Setting meta for product: panorama-008 Variation: 008"
wp post meta update $_LFT0081e300415 _visibility visible
wp post meta update $_LFT0081e300415 attribute_edb_material 008
wp post meta update $_LFT0081e300415 _stock 2
wp post meta update $_LFT0081e300415 _stock_status instock
wp post meta update $_LFT0081e300415 _manage_stock yes
wp post meta update $_LFT0081e300415 _backorders yes
wp post meta update $_LFT0081e300415 _price 350.00
wp post meta update $_LFT0081e300415 _regular_price 350.00
wp post meta update $_LFT0081e300415 _sku LFT0081e300415
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0081e300415 --featured_image=true
echo "Creating Variation: panorama-009"
_LFT0091e310416=`wp post create --post_title="panorama-009" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350009 --porcelain`
echo "Setting meta for product: panorama-009 Variation: 009"
wp post meta update $_LFT0091e310416 _visibility visible
wp post meta update $_LFT0091e310416 attribute_edb_material 009
wp post meta update $_LFT0091e310416 _stock 2
wp post meta update $_LFT0091e310416 _stock_status instock
wp post meta update $_LFT0091e310416 _manage_stock yes
wp post meta update $_LFT0091e310416 _backorders yes
wp post meta update $_LFT0091e310416 _price 350.00
wp post meta update $_LFT0091e310416 _regular_price 350.00
wp post meta update $_LFT0091e310416 _sku LFT0091e310416
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0091e310416 --featured_image=true
echo "Creating Variation: panorama-010"
_LFT0101e2a040e=`wp post create --post_title="panorama-010" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350010 --porcelain`
echo "Setting meta for product: panorama-010 Variation: 010"
wp post meta update $_LFT0101e2a040e _visibility visible
wp post meta update $_LFT0101e2a040e attribute_edb_material 010
wp post meta update $_LFT0101e2a040e _stock 2
wp post meta update $_LFT0101e2a040e _stock_status instock
wp post meta update $_LFT0101e2a040e _manage_stock yes
wp post meta update $_LFT0101e2a040e _backorders yes
wp post meta update $_LFT0101e2a040e _price 350.00
wp post meta update $_LFT0101e2a040e _regular_price 350.00
wp post meta update $_LFT0101e2a040e _sku LFT0101e2a040e
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0101e2a040e --featured_image=true
echo "Creating Variation: panorama-011"
_LFT0111e2b040f=`wp post create --post_title="panorama-011" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350011 --porcelain`
echo "Setting meta for product: panorama-011 Variation: 011"
wp post meta update $_LFT0111e2b040f _visibility visible
wp post meta update $_LFT0111e2b040f attribute_edb_material 011
wp post meta update $_LFT0111e2b040f _stock 2
wp post meta update $_LFT0111e2b040f _stock_status instock
wp post meta update $_LFT0111e2b040f _manage_stock yes
wp post meta update $_LFT0111e2b040f _backorders yes
wp post meta update $_LFT0111e2b040f _price 350.00
wp post meta update $_LFT0111e2b040f _regular_price 350.00
wp post meta update $_LFT0111e2b040f _sku LFT0111e2b040f
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0111e2b040f --featured_image=true
echo "Creating Variation: panorama-012"
_LFT0121e2c0410=`wp post create --post_title="panorama-012" --post_parent=$_LFTXXX0f140350 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=panorama_lftxxx0f140350012 --porcelain`
echo "Setting meta for product: panorama-012 Variation: 012"
wp post meta update $_LFT0121e2c0410 _visibility visible
wp post meta update $_LFT0121e2c0410 attribute_edb_material 012
wp post meta update $_LFT0121e2c0410 _stock 2
wp post meta update $_LFT0121e2c0410 _stock_status instock
wp post meta update $_LFT0121e2c0410 _manage_stock yes
wp post meta update $_LFT0121e2c0410 _backorders yes
wp post meta update $_LFT0121e2c0410 _price 350.00
wp post meta update $_LFT0121e2c0410 _regular_price 350.00
wp post meta update $_LFT0121e2c0410 _sku LFT0121e2c0410
wp media import ./data/products/11-panorama/gallery/panorama_left_000.jpg --post_id=$_LFT0121e2c0410 --featured_image=true
echo "Creating Product: duo"
_SOBXXX02880149=`wp post create --post_title="duo" --menu_order=10 --post_name="duo_sobxxx02880149" --post_content='{:en}Mid-century revival. Inspired by shapes and volumes from the 50'\''s, the Duo sofa-bed features long slender wooden tapered legs and quilted seat and backrest. Turn this sofa into a sleeping pad in a single motion.{:}{:fr}Mid-century revival. Inspired by shapes and volumes from the 50'\''s, the Duo sofa-bed features long slender wooden tapered legs and quilted seat and backrest. Turn this sofa into a sleeping pad in a single motion.{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: duo"
wp post meta update $_SOBXXX02880149 _visibility visible
wp post meta update $_SOBXXX02880149 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_SOBXXX02880149 _price 350.00
wp post meta update $_SOBXXX02880149 _regular_price 350.00
wp post term set $_SOBXXX02880149 product_shipping_class furniture
wp post term set $_SOBXXX02880149 product_cat sofa-beds
wp post term set $_SOBXXX02880149 product_type variable
wp post term add $_SOBXXX02880149 product_cat sofas
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOBXXX02880149 --featured_image=true
_SOBXXX02880149_0=`wp media import ./data/products/10-duo/gallery/duo_sofa_0000_001.jpg --post_id=$_SOBXXX02880149 --porcelain`
_SOBXXX02880149_1=`wp media import ./data/products/10-duo/gallery/duo_sofa_0001_002.jpg --post_id=$_SOBXXX02880149 --porcelain`
_SOBXXX02880149_2=`wp media import ./data/products/10-duo/gallery/duo_sofa_0002_003.jpg --post_id=$_SOBXXX02880149 --porcelain`
_SOBXXX02880149_3=`wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004.jpg --post_id=$_SOBXXX02880149 --porcelain`
_SOBXXX02880149_4=`wp media import ./data/products/10-duo/gallery/duo_sofa_0001_005.jpg --post_id=$_SOBXXX02880149 --porcelain`
_SOBXXX02880149_5=`wp media import ./data/products/10-duo/gallery/duo_sofa_0002_006.jpg --post_id=$_SOBXXX02880149 --porcelain`
_SOBXXX02880149_6=`wp media import ./data/products/10-duo/gallery/duo_sofa_0003_007.jpg --post_id=$_SOBXXX02880149 --porcelain`
_SOBXXX02880149_7=`wp media import ./data/products/10-duo/gallery/duo_sofa_0004_008.jpg --post_id=$_SOBXXX02880149 --porcelain`
wp post meta update $_SOBXXX02880149 _product_image_gallery $_SOBXXX02880149_0,$_SOBXXX02880149_1,$_SOBXXX02880149_2,$_SOBXXX02880149_3,$_SOBXXX02880149_4,$_SOBXXX02880149_5,$_SOBXXX02880149_6,$_SOBXXX02880149_7
echo "Creating Variation: duo-001"
_SOB00109810207=`wp post create --post_title="duo-001" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149001 --porcelain`
echo "Setting meta for product: duo-001 Variation: 001"
wp post meta update $_SOB00109810207 _visibility visible
wp post meta update $_SOB00109810207 attribute_edb_material 001
wp post meta update $_SOB00109810207 _stock 2
wp post meta update $_SOB00109810207 _stock_status instock
wp post meta update $_SOB00109810207 _manage_stock yes
wp post meta update $_SOB00109810207 _backorders yes
wp post meta update $_SOB00109810207 _price 350.00
wp post meta update $_SOB00109810207 _regular_price 350.00
wp post meta update $_SOB00109810207 _sku SOB00109810207
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB00109810207 --featured_image=true
echo "Creating Variation: duo-002"
_SOB00209820208=`wp post create --post_title="duo-002" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149002 --porcelain`
echo "Setting meta for product: duo-002 Variation: 002"
wp post meta update $_SOB00209820208 _visibility visible
wp post meta update $_SOB00209820208 attribute_edb_material 002
wp post meta update $_SOB00209820208 _stock 2
wp post meta update $_SOB00209820208 _stock_status instock
wp post meta update $_SOB00209820208 _manage_stock yes
wp post meta update $_SOB00209820208 _backorders yes
wp post meta update $_SOB00209820208 _price 350.00
wp post meta update $_SOB00209820208 _regular_price 350.00
wp post meta update $_SOB00209820208 _sku SOB00209820208
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB00209820208 --featured_image=true
echo "Creating Variation: duo-003"
_SOB00309830209=`wp post create --post_title="duo-003" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149003 --porcelain`
echo "Setting meta for product: duo-003 Variation: 003"
wp post meta update $_SOB00309830209 _visibility visible
wp post meta update $_SOB00309830209 attribute_edb_material 003
wp post meta update $_SOB00309830209 _stock 2
wp post meta update $_SOB00309830209 _stock_status instock
wp post meta update $_SOB00309830209 _manage_stock yes
wp post meta update $_SOB00309830209 _backorders yes
wp post meta update $_SOB00309830209 _price 350.00
wp post meta update $_SOB00309830209 _regular_price 350.00
wp post meta update $_SOB00309830209 _sku SOB00309830209
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB00309830209 --featured_image=true
echo "Creating Variation: duo-004"
_SOB0040984020a=`wp post create --post_title="duo-004" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149004 --porcelain`
echo "Setting meta for product: duo-004 Variation: 004"
wp post meta update $_SOB0040984020a _visibility visible
wp post meta update $_SOB0040984020a attribute_edb_material 004
wp post meta update $_SOB0040984020a _stock 2
wp post meta update $_SOB0040984020a _stock_status instock
wp post meta update $_SOB0040984020a _manage_stock yes
wp post meta update $_SOB0040984020a _backorders yes
wp post meta update $_SOB0040984020a _price 350.00
wp post meta update $_SOB0040984020a _regular_price 350.00
wp post meta update $_SOB0040984020a _sku SOB0040984020a
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB0040984020a --featured_image=true
echo "Creating Variation: duo-005"
_SOB0050985020b=`wp post create --post_title="duo-005" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149005 --porcelain`
echo "Setting meta for product: duo-005 Variation: 005"
wp post meta update $_SOB0050985020b _visibility visible
wp post meta update $_SOB0050985020b attribute_edb_material 005
wp post meta update $_SOB0050985020b _stock 2
wp post meta update $_SOB0050985020b _stock_status instock
wp post meta update $_SOB0050985020b _manage_stock yes
wp post meta update $_SOB0050985020b _backorders yes
wp post meta update $_SOB0050985020b _price 350.00
wp post meta update $_SOB0050985020b _regular_price 350.00
wp post meta update $_SOB0050985020b _sku SOB0050985020b
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB0050985020b --featured_image=true
echo "Creating Variation: duo-006"
_SOB0060986020c=`wp post create --post_title="duo-006" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149006 --porcelain`
echo "Setting meta for product: duo-006 Variation: 006"
wp post meta update $_SOB0060986020c _visibility visible
wp post meta update $_SOB0060986020c attribute_edb_material 006
wp post meta update $_SOB0060986020c _stock 2
wp post meta update $_SOB0060986020c _stock_status instock
wp post meta update $_SOB0060986020c _manage_stock yes
wp post meta update $_SOB0060986020c _backorders yes
wp post meta update $_SOB0060986020c _price 350.00
wp post meta update $_SOB0060986020c _regular_price 350.00
wp post meta update $_SOB0060986020c _sku SOB0060986020c
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB0060986020c --featured_image=true
echo "Creating Variation: duo-007"
_SOB0070987020d=`wp post create --post_title="duo-007" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149007 --porcelain`
echo "Setting meta for product: duo-007 Variation: 007"
wp post meta update $_SOB0070987020d _visibility visible
wp post meta update $_SOB0070987020d attribute_edb_material 007
wp post meta update $_SOB0070987020d _stock 2
wp post meta update $_SOB0070987020d _stock_status instock
wp post meta update $_SOB0070987020d _manage_stock yes
wp post meta update $_SOB0070987020d _backorders yes
wp post meta update $_SOB0070987020d _price 350.00
wp post meta update $_SOB0070987020d _regular_price 350.00
wp post meta update $_SOB0070987020d _sku SOB0070987020d
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB0070987020d --featured_image=true
echo "Creating Variation: duo-008"
_SOB0080988020e=`wp post create --post_title="duo-008" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149008 --porcelain`
echo "Setting meta for product: duo-008 Variation: 008"
wp post meta update $_SOB0080988020e _visibility visible
wp post meta update $_SOB0080988020e attribute_edb_material 008
wp post meta update $_SOB0080988020e _stock 2
wp post meta update $_SOB0080988020e _stock_status instock
wp post meta update $_SOB0080988020e _manage_stock yes
wp post meta update $_SOB0080988020e _backorders yes
wp post meta update $_SOB0080988020e _price 350.00
wp post meta update $_SOB0080988020e _regular_price 350.00
wp post meta update $_SOB0080988020e _sku SOB0080988020e
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB0080988020e --featured_image=true
echo "Creating Variation: duo-009"
_SOB0090989020f=`wp post create --post_title="duo-009" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149009 --porcelain`
echo "Setting meta for product: duo-009 Variation: 009"
wp post meta update $_SOB0090989020f _visibility visible
wp post meta update $_SOB0090989020f attribute_edb_material 009
wp post meta update $_SOB0090989020f _stock 2
wp post meta update $_SOB0090989020f _stock_status instock
wp post meta update $_SOB0090989020f _manage_stock yes
wp post meta update $_SOB0090989020f _backorders yes
wp post meta update $_SOB0090989020f _price 350.00
wp post meta update $_SOB0090989020f _regular_price 350.00
wp post meta update $_SOB0090989020f _sku SOB0090989020f
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB0090989020f --featured_image=true
echo "Creating Variation: duo-010"
_SOB01009820207=`wp post create --post_title="duo-010" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149010 --porcelain`
echo "Setting meta for product: duo-010 Variation: 010"
wp post meta update $_SOB01009820207 _visibility visible
wp post meta update $_SOB01009820207 attribute_edb_material 010
wp post meta update $_SOB01009820207 _stock 2
wp post meta update $_SOB01009820207 _stock_status instock
wp post meta update $_SOB01009820207 _manage_stock yes
wp post meta update $_SOB01009820207 _backorders yes
wp post meta update $_SOB01009820207 _price 350.00
wp post meta update $_SOB01009820207 _regular_price 350.00
wp post meta update $_SOB01009820207 _sku SOB01009820207
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB01009820207 --featured_image=true
echo "Creating Variation: duo-011"
_SOB01109830208=`wp post create --post_title="duo-011" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149011 --porcelain`
echo "Setting meta for product: duo-011 Variation: 011"
wp post meta update $_SOB01109830208 _visibility visible
wp post meta update $_SOB01109830208 attribute_edb_material 011
wp post meta update $_SOB01109830208 _stock 2
wp post meta update $_SOB01109830208 _stock_status instock
wp post meta update $_SOB01109830208 _manage_stock yes
wp post meta update $_SOB01109830208 _backorders yes
wp post meta update $_SOB01109830208 _price 350.00
wp post meta update $_SOB01109830208 _regular_price 350.00
wp post meta update $_SOB01109830208 _sku SOB01109830208
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB01109830208 --featured_image=true
echo "Creating Variation: duo-012"
_SOB01209840209=`wp post create --post_title="duo-012" --post_parent=$_SOBXXX02880149 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=duo_sobxxx02880149012 --porcelain`
echo "Setting meta for product: duo-012 Variation: 012"
wp post meta update $_SOB01209840209 _visibility visible
wp post meta update $_SOB01209840209 attribute_edb_material 012
wp post meta update $_SOB01209840209 _stock 2
wp post meta update $_SOB01209840209 _stock_status instock
wp post meta update $_SOB01209840209 _manage_stock yes
wp post meta update $_SOB01209840209 _backorders yes
wp post meta update $_SOB01209840209 _price 350.00
wp post meta update $_SOB01209840209 _regular_price 350.00
wp post meta update $_SOB01209840209 _sku SOB01209840209
wp media import ./data/products/10-duo/gallery/duo_sofa_0000_004_000.jpg --post_id=$_SOB01209840209 --featured_image=true
echo "Creating Product: teatime"
_SOBXXX0bc002ea=`wp post create --post_title="teatime" --menu_order=9 --post_name="teatime_sobxxx0bc002ea" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: teatime"
wp post meta update $_SOBXXX0bc002ea _visibility visible
wp post meta update $_SOBXXX0bc002ea _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_SOBXXX0bc002ea _price 350.00
wp post meta update $_SOBXXX0bc002ea _regular_price 350.00
wp post term set $_SOBXXX0bc002ea product_shipping_class furniture
wp post term set $_SOBXXX0bc002ea product_cat sofa-beds
wp post term set $_SOBXXX0bc002ea product_type variable
wp post term add $_SOBXXX0bc002ea product_cat sofas
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOBXXX0bc002ea --featured_image=true
_SOBXXX0bc002ea_0=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_001.jpg --post_id=$_SOBXXX0bc002ea --porcelain`
_SOBXXX0bc002ea_1=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0001_002.jpg --post_id=$_SOBXXX0bc002ea --porcelain`
_SOBXXX0bc002ea_2=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0002_003.jpg --post_id=$_SOBXXX0bc002ea --porcelain`
_SOBXXX0bc002ea_3=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004.jpg --post_id=$_SOBXXX0bc002ea --porcelain`
_SOBXXX0bc002ea_4=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0001_005.jpg --post_id=$_SOBXXX0bc002ea --porcelain`
_SOBXXX0bc002ea_5=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0002_006.jpg --post_id=$_SOBXXX0bc002ea --porcelain`
_SOBXXX0bc002ea_6=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0003_007.jpg --post_id=$_SOBXXX0bc002ea --porcelain`
_SOBXXX0bc002ea_7=`wp media import ./data/products/09-teatime/gallery/teatime_sofa_0004_008.jpg --post_id=$_SOBXXX0bc002ea --porcelain`
wp post meta update $_SOBXXX0bc002ea _product_image_gallery $_SOBXXX0bc002ea_0,$_SOBXXX0bc002ea_1,$_SOBXXX0bc002ea_2,$_SOBXXX0bc002ea_3,$_SOBXXX0bc002ea_4,$_SOBXXX0bc002ea_5,$_SOBXXX0bc002ea_6,$_SOBXXX0bc002ea_7
echo "Creating Variation: teatime-001"
_SOB001193d03a8=`wp post create --post_title="teatime-001" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea001 --porcelain`
echo "Setting meta for product: teatime-001 Variation: 001"
wp post meta update $_SOB001193d03a8 _visibility visible
wp post meta update $_SOB001193d03a8 attribute_edb_material 001
wp post meta update $_SOB001193d03a8 _stock 2
wp post meta update $_SOB001193d03a8 _stock_status instock
wp post meta update $_SOB001193d03a8 _manage_stock yes
wp post meta update $_SOB001193d03a8 _backorders yes
wp post meta update $_SOB001193d03a8 _price 350.00
wp post meta update $_SOB001193d03a8 _regular_price 350.00
wp post meta update $_SOB001193d03a8 _sku SOB001193d03a8
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB001193d03a8 --featured_image=true
echo "Creating Variation: teatime-002"
_SOB002193e03a9=`wp post create --post_title="teatime-002" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea002 --porcelain`
echo "Setting meta for product: teatime-002 Variation: 002"
wp post meta update $_SOB002193e03a9 _visibility visible
wp post meta update $_SOB002193e03a9 attribute_edb_material 002
wp post meta update $_SOB002193e03a9 _stock 2
wp post meta update $_SOB002193e03a9 _stock_status instock
wp post meta update $_SOB002193e03a9 _manage_stock yes
wp post meta update $_SOB002193e03a9 _backorders yes
wp post meta update $_SOB002193e03a9 _price 350.00
wp post meta update $_SOB002193e03a9 _regular_price 350.00
wp post meta update $_SOB002193e03a9 _sku SOB002193e03a9
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB002193e03a9 --featured_image=true
echo "Creating Variation: teatime-003"
_SOB003193f03aa=`wp post create --post_title="teatime-003" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea003 --porcelain`
echo "Setting meta for product: teatime-003 Variation: 003"
wp post meta update $_SOB003193f03aa _visibility visible
wp post meta update $_SOB003193f03aa attribute_edb_material 003
wp post meta update $_SOB003193f03aa _stock 2
wp post meta update $_SOB003193f03aa _stock_status instock
wp post meta update $_SOB003193f03aa _manage_stock yes
wp post meta update $_SOB003193f03aa _backorders yes
wp post meta update $_SOB003193f03aa _price 350.00
wp post meta update $_SOB003193f03aa _regular_price 350.00
wp post meta update $_SOB003193f03aa _sku SOB003193f03aa
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB003193f03aa --featured_image=true
echo "Creating Variation: teatime-004"
_SOB004194003ab=`wp post create --post_title="teatime-004" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea004 --porcelain`
echo "Setting meta for product: teatime-004 Variation: 004"
wp post meta update $_SOB004194003ab _visibility visible
wp post meta update $_SOB004194003ab attribute_edb_material 004
wp post meta update $_SOB004194003ab _stock 2
wp post meta update $_SOB004194003ab _stock_status instock
wp post meta update $_SOB004194003ab _manage_stock yes
wp post meta update $_SOB004194003ab _backorders yes
wp post meta update $_SOB004194003ab _price 350.00
wp post meta update $_SOB004194003ab _regular_price 350.00
wp post meta update $_SOB004194003ab _sku SOB004194003ab
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB004194003ab --featured_image=true
echo "Creating Variation: teatime-005"
_SOB005194103ac=`wp post create --post_title="teatime-005" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea005 --porcelain`
echo "Setting meta for product: teatime-005 Variation: 005"
wp post meta update $_SOB005194103ac _visibility visible
wp post meta update $_SOB005194103ac attribute_edb_material 005
wp post meta update $_SOB005194103ac _stock 2
wp post meta update $_SOB005194103ac _stock_status instock
wp post meta update $_SOB005194103ac _manage_stock yes
wp post meta update $_SOB005194103ac _backorders yes
wp post meta update $_SOB005194103ac _price 350.00
wp post meta update $_SOB005194103ac _regular_price 350.00
wp post meta update $_SOB005194103ac _sku SOB005194103ac
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB005194103ac --featured_image=true
echo "Creating Variation: teatime-006"
_SOB006194203ad=`wp post create --post_title="teatime-006" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea006 --porcelain`
echo "Setting meta for product: teatime-006 Variation: 006"
wp post meta update $_SOB006194203ad _visibility visible
wp post meta update $_SOB006194203ad attribute_edb_material 006
wp post meta update $_SOB006194203ad _stock 2
wp post meta update $_SOB006194203ad _stock_status instock
wp post meta update $_SOB006194203ad _manage_stock yes
wp post meta update $_SOB006194203ad _backorders yes
wp post meta update $_SOB006194203ad _price 350.00
wp post meta update $_SOB006194203ad _regular_price 350.00
wp post meta update $_SOB006194203ad _sku SOB006194203ad
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB006194203ad --featured_image=true
echo "Creating Variation: teatime-007"
_SOB007194303ae=`wp post create --post_title="teatime-007" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea007 --porcelain`
echo "Setting meta for product: teatime-007 Variation: 007"
wp post meta update $_SOB007194303ae _visibility visible
wp post meta update $_SOB007194303ae attribute_edb_material 007
wp post meta update $_SOB007194303ae _stock 2
wp post meta update $_SOB007194303ae _stock_status instock
wp post meta update $_SOB007194303ae _manage_stock yes
wp post meta update $_SOB007194303ae _backorders yes
wp post meta update $_SOB007194303ae _price 350.00
wp post meta update $_SOB007194303ae _regular_price 350.00
wp post meta update $_SOB007194303ae _sku SOB007194303ae
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB007194303ae --featured_image=true
echo "Creating Variation: teatime-008"
_SOB008194403af=`wp post create --post_title="teatime-008" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea008 --porcelain`
echo "Setting meta for product: teatime-008 Variation: 008"
wp post meta update $_SOB008194403af _visibility visible
wp post meta update $_SOB008194403af attribute_edb_material 008
wp post meta update $_SOB008194403af _stock 2
wp post meta update $_SOB008194403af _stock_status instock
wp post meta update $_SOB008194403af _manage_stock yes
wp post meta update $_SOB008194403af _backorders yes
wp post meta update $_SOB008194403af _price 350.00
wp post meta update $_SOB008194403af _regular_price 350.00
wp post meta update $_SOB008194403af _sku SOB008194403af
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB008194403af --featured_image=true
echo "Creating Variation: teatime-009"
_SOB009194503b0=`wp post create --post_title="teatime-009" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea009 --porcelain`
echo "Setting meta for product: teatime-009 Variation: 009"
wp post meta update $_SOB009194503b0 _visibility visible
wp post meta update $_SOB009194503b0 attribute_edb_material 009
wp post meta update $_SOB009194503b0 _stock 2
wp post meta update $_SOB009194503b0 _stock_status instock
wp post meta update $_SOB009194503b0 _manage_stock yes
wp post meta update $_SOB009194503b0 _backorders yes
wp post meta update $_SOB009194503b0 _price 350.00
wp post meta update $_SOB009194503b0 _regular_price 350.00
wp post meta update $_SOB009194503b0 _sku SOB009194503b0
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB009194503b0 --featured_image=true
echo "Creating Variation: teatime-010"
_SOB010193e03a8=`wp post create --post_title="teatime-010" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea010 --porcelain`
echo "Setting meta for product: teatime-010 Variation: 010"
wp post meta update $_SOB010193e03a8 _visibility visible
wp post meta update $_SOB010193e03a8 attribute_edb_material 010
wp post meta update $_SOB010193e03a8 _stock 2
wp post meta update $_SOB010193e03a8 _stock_status instock
wp post meta update $_SOB010193e03a8 _manage_stock yes
wp post meta update $_SOB010193e03a8 _backorders yes
wp post meta update $_SOB010193e03a8 _price 350.00
wp post meta update $_SOB010193e03a8 _regular_price 350.00
wp post meta update $_SOB010193e03a8 _sku SOB010193e03a8
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB010193e03a8 --featured_image=true
echo "Creating Variation: teatime-011"
_SOB011193f03a9=`wp post create --post_title="teatime-011" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea011 --porcelain`
echo "Setting meta for product: teatime-011 Variation: 011"
wp post meta update $_SOB011193f03a9 _visibility visible
wp post meta update $_SOB011193f03a9 attribute_edb_material 011
wp post meta update $_SOB011193f03a9 _stock 2
wp post meta update $_SOB011193f03a9 _stock_status instock
wp post meta update $_SOB011193f03a9 _manage_stock yes
wp post meta update $_SOB011193f03a9 _backorders yes
wp post meta update $_SOB011193f03a9 _price 350.00
wp post meta update $_SOB011193f03a9 _regular_price 350.00
wp post meta update $_SOB011193f03a9 _sku SOB011193f03a9
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB011193f03a9 --featured_image=true
echo "Creating Variation: teatime-012"
_SOB012194003aa=`wp post create --post_title="teatime-012" --post_parent=$_SOBXXX0bc002ea --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=teatime_sobxxx0bc002ea012 --porcelain`
echo "Setting meta for product: teatime-012 Variation: 012"
wp post meta update $_SOB012194003aa _visibility visible
wp post meta update $_SOB012194003aa attribute_edb_material 012
wp post meta update $_SOB012194003aa _stock 2
wp post meta update $_SOB012194003aa _stock_status instock
wp post meta update $_SOB012194003aa _manage_stock yes
wp post meta update $_SOB012194003aa _backorders yes
wp post meta update $_SOB012194003aa _price 350.00
wp post meta update $_SOB012194003aa _regular_price 350.00
wp post meta update $_SOB012194003aa _sku SOB012194003aa
wp media import ./data/products/09-teatime/gallery/teatime_sofa_0000_004_000.jpg --post_id=$_SOB012194003aa --featured_image=true
echo "Creating Product: capsule"
_SOBXXX0b9a02ee=`wp post create --post_title="capsule" --menu_order=8 --post_name="capsule_sobxxx0b9a02ee" --post_content='{:en}Mini & practical. Designed for small spaces, the Capsule sofa bed is ultra compact. It can turn into a double bed in a matter of seconds. Perfect for lofts or guestrooms.{:}{:fr}Tout petit, bourré de charme et grandement utile. Conçu pour les micro-apartements, Capsule se déploie en un lit à deux places en quelques secondes. À noter, le détail de son dossier à capitonnage et son siège à surpiqûre. À preuve que le style, ce n'\''est pas que pour les grands. {:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: capsule"
wp post meta update $_SOBXXX0b9a02ee _visibility visible
wp post meta update $_SOBXXX0b9a02ee _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_SOBXXX0b9a02ee _price 350.00
wp post meta update $_SOBXXX0b9a02ee _regular_price 350.00
wp post term set $_SOBXXX0b9a02ee product_shipping_class furniture
wp post term set $_SOBXXX0b9a02ee product_cat sofa-beds
wp post term set $_SOBXXX0b9a02ee product_type variable
wp post term add $_SOBXXX0b9a02ee product_cat sofas
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOBXXX0b9a02ee --featured_image=true
_SOBXXX0b9a02ee_0=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_001.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
_SOBXXX0b9a02ee_1=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0001_002.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
_SOBXXX0b9a02ee_2=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0002_003.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
_SOBXXX0b9a02ee_3=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
_SOBXXX0b9a02ee_4=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0001_005.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
_SOBXXX0b9a02ee_5=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0002_006.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
_SOBXXX0b9a02ee_6=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0003_007.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
_SOBXXX0b9a02ee_7=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0004_008.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
_SOBXXX0b9a02ee_8=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0005_009.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
_SOBXXX0b9a02ee_9=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0006_010.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
_SOBXXX0b9a02ee_10=`wp media import ./data/products/08-capsule/gallery/capsule_sofa_0007_011.jpg --post_id=$_SOBXXX0b9a02ee --porcelain`
wp post meta update $_SOBXXX0b9a02ee _product_image_gallery $_SOBXXX0b9a02ee_0,$_SOBXXX0b9a02ee_1,$_SOBXXX0b9a02ee_2,$_SOBXXX0b9a02ee_3,$_SOBXXX0b9a02ee_4,$_SOBXXX0b9a02ee_5,$_SOBXXX0b9a02ee_6,$_SOBXXX0b9a02ee_7,$_SOBXXX0b9a02ee_8,$_SOBXXX0b9a02ee_9,$_SOBXXX0b9a02ee_10
echo "Creating Variation: capsule-001"
_SOB001192703ac=`wp post create --post_title="capsule-001" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee001 --porcelain`
echo "Setting meta for product: capsule-001 Variation: 001"
wp post meta update $_SOB001192703ac _visibility visible
wp post meta update $_SOB001192703ac attribute_edb_material 001
wp post meta update $_SOB001192703ac _stock 2
wp post meta update $_SOB001192703ac _stock_status instock
wp post meta update $_SOB001192703ac _manage_stock yes
wp post meta update $_SOB001192703ac _backorders yes
wp post meta update $_SOB001192703ac _price 350.00
wp post meta update $_SOB001192703ac _regular_price 350.00
wp post meta update $_SOB001192703ac _sku SOB001192703ac
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB001192703ac --featured_image=true
echo "Creating Variation: capsule-002"
_SOB002192803ad=`wp post create --post_title="capsule-002" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee002 --porcelain`
echo "Setting meta for product: capsule-002 Variation: 002"
wp post meta update $_SOB002192803ad _visibility visible
wp post meta update $_SOB002192803ad attribute_edb_material 002
wp post meta update $_SOB002192803ad _stock 2
wp post meta update $_SOB002192803ad _stock_status instock
wp post meta update $_SOB002192803ad _manage_stock yes
wp post meta update $_SOB002192803ad _backorders yes
wp post meta update $_SOB002192803ad _price 350.00
wp post meta update $_SOB002192803ad _regular_price 350.00
wp post meta update $_SOB002192803ad _sku SOB002192803ad
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB002192803ad --featured_image=true
echo "Creating Variation: capsule-003"
_SOB003192903ae=`wp post create --post_title="capsule-003" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee003 --porcelain`
echo "Setting meta for product: capsule-003 Variation: 003"
wp post meta update $_SOB003192903ae _visibility visible
wp post meta update $_SOB003192903ae attribute_edb_material 003
wp post meta update $_SOB003192903ae _stock 2
wp post meta update $_SOB003192903ae _stock_status instock
wp post meta update $_SOB003192903ae _manage_stock yes
wp post meta update $_SOB003192903ae _backorders yes
wp post meta update $_SOB003192903ae _price 350.00
wp post meta update $_SOB003192903ae _regular_price 350.00
wp post meta update $_SOB003192903ae _sku SOB003192903ae
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB003192903ae --featured_image=true
echo "Creating Variation: capsule-004"
_SOB004192a03af=`wp post create --post_title="capsule-004" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee004 --porcelain`
echo "Setting meta for product: capsule-004 Variation: 004"
wp post meta update $_SOB004192a03af _visibility visible
wp post meta update $_SOB004192a03af attribute_edb_material 004
wp post meta update $_SOB004192a03af _stock 2
wp post meta update $_SOB004192a03af _stock_status instock
wp post meta update $_SOB004192a03af _manage_stock yes
wp post meta update $_SOB004192a03af _backorders yes
wp post meta update $_SOB004192a03af _price 350.00
wp post meta update $_SOB004192a03af _regular_price 350.00
wp post meta update $_SOB004192a03af _sku SOB004192a03af
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB004192a03af --featured_image=true
echo "Creating Variation: capsule-005"
_SOB005192b03b0=`wp post create --post_title="capsule-005" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee005 --porcelain`
echo "Setting meta for product: capsule-005 Variation: 005"
wp post meta update $_SOB005192b03b0 _visibility visible
wp post meta update $_SOB005192b03b0 attribute_edb_material 005
wp post meta update $_SOB005192b03b0 _stock 2
wp post meta update $_SOB005192b03b0 _stock_status instock
wp post meta update $_SOB005192b03b0 _manage_stock yes
wp post meta update $_SOB005192b03b0 _backorders yes
wp post meta update $_SOB005192b03b0 _price 350.00
wp post meta update $_SOB005192b03b0 _regular_price 350.00
wp post meta update $_SOB005192b03b0 _sku SOB005192b03b0
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB005192b03b0 --featured_image=true
echo "Creating Variation: capsule-006"
_SOB006192c03b1=`wp post create --post_title="capsule-006" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee006 --porcelain`
echo "Setting meta for product: capsule-006 Variation: 006"
wp post meta update $_SOB006192c03b1 _visibility visible
wp post meta update $_SOB006192c03b1 attribute_edb_material 006
wp post meta update $_SOB006192c03b1 _stock 2
wp post meta update $_SOB006192c03b1 _stock_status instock
wp post meta update $_SOB006192c03b1 _manage_stock yes
wp post meta update $_SOB006192c03b1 _backorders yes
wp post meta update $_SOB006192c03b1 _price 350.00
wp post meta update $_SOB006192c03b1 _regular_price 350.00
wp post meta update $_SOB006192c03b1 _sku SOB006192c03b1
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB006192c03b1 --featured_image=true
echo "Creating Variation: capsule-007"
_SOB007192d03b2=`wp post create --post_title="capsule-007" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee007 --porcelain`
echo "Setting meta for product: capsule-007 Variation: 007"
wp post meta update $_SOB007192d03b2 _visibility visible
wp post meta update $_SOB007192d03b2 attribute_edb_material 007
wp post meta update $_SOB007192d03b2 _stock 2
wp post meta update $_SOB007192d03b2 _stock_status instock
wp post meta update $_SOB007192d03b2 _manage_stock yes
wp post meta update $_SOB007192d03b2 _backorders yes
wp post meta update $_SOB007192d03b2 _price 350.00
wp post meta update $_SOB007192d03b2 _regular_price 350.00
wp post meta update $_SOB007192d03b2 _sku SOB007192d03b2
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB007192d03b2 --featured_image=true
echo "Creating Variation: capsule-008"
_SOB008192e03b3=`wp post create --post_title="capsule-008" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee008 --porcelain`
echo "Setting meta for product: capsule-008 Variation: 008"
wp post meta update $_SOB008192e03b3 _visibility visible
wp post meta update $_SOB008192e03b3 attribute_edb_material 008
wp post meta update $_SOB008192e03b3 _stock 2
wp post meta update $_SOB008192e03b3 _stock_status instock
wp post meta update $_SOB008192e03b3 _manage_stock yes
wp post meta update $_SOB008192e03b3 _backorders yes
wp post meta update $_SOB008192e03b3 _price 350.00
wp post meta update $_SOB008192e03b3 _regular_price 350.00
wp post meta update $_SOB008192e03b3 _sku SOB008192e03b3
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB008192e03b3 --featured_image=true
echo "Creating Variation: capsule-009"
_SOB009192f03b4=`wp post create --post_title="capsule-009" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee009 --porcelain`
echo "Setting meta for product: capsule-009 Variation: 009"
wp post meta update $_SOB009192f03b4 _visibility visible
wp post meta update $_SOB009192f03b4 attribute_edb_material 009
wp post meta update $_SOB009192f03b4 _stock 2
wp post meta update $_SOB009192f03b4 _stock_status instock
wp post meta update $_SOB009192f03b4 _manage_stock yes
wp post meta update $_SOB009192f03b4 _backorders yes
wp post meta update $_SOB009192f03b4 _price 350.00
wp post meta update $_SOB009192f03b4 _regular_price 350.00
wp post meta update $_SOB009192f03b4 _sku SOB009192f03b4
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB009192f03b4 --featured_image=true
echo "Creating Variation: capsule-010"
_SOB010192803ac=`wp post create --post_title="capsule-010" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee010 --porcelain`
echo "Setting meta for product: capsule-010 Variation: 010"
wp post meta update $_SOB010192803ac _visibility visible
wp post meta update $_SOB010192803ac attribute_edb_material 010
wp post meta update $_SOB010192803ac _stock 2
wp post meta update $_SOB010192803ac _stock_status instock
wp post meta update $_SOB010192803ac _manage_stock yes
wp post meta update $_SOB010192803ac _backorders yes
wp post meta update $_SOB010192803ac _price 350.00
wp post meta update $_SOB010192803ac _regular_price 350.00
wp post meta update $_SOB010192803ac _sku SOB010192803ac
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB010192803ac --featured_image=true
echo "Creating Variation: capsule-011"
_SOB011192903ad=`wp post create --post_title="capsule-011" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee011 --porcelain`
echo "Setting meta for product: capsule-011 Variation: 011"
wp post meta update $_SOB011192903ad _visibility visible
wp post meta update $_SOB011192903ad attribute_edb_material 011
wp post meta update $_SOB011192903ad _stock 2
wp post meta update $_SOB011192903ad _stock_status instock
wp post meta update $_SOB011192903ad _manage_stock yes
wp post meta update $_SOB011192903ad _backorders yes
wp post meta update $_SOB011192903ad _price 350.00
wp post meta update $_SOB011192903ad _regular_price 350.00
wp post meta update $_SOB011192903ad _sku SOB011192903ad
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB011192903ad --featured_image=true
echo "Creating Variation: capsule-012"
_SOB012192a03ae=`wp post create --post_title="capsule-012" --post_parent=$_SOBXXX0b9a02ee --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=capsule_sobxxx0b9a02ee012 --porcelain`
echo "Setting meta for product: capsule-012 Variation: 012"
wp post meta update $_SOB012192a03ae _visibility visible
wp post meta update $_SOB012192a03ae attribute_edb_material 012
wp post meta update $_SOB012192a03ae _stock 2
wp post meta update $_SOB012192a03ae _stock_status instock
wp post meta update $_SOB012192a03ae _manage_stock yes
wp post meta update $_SOB012192a03ae _backorders yes
wp post meta update $_SOB012192a03ae _price 350.00
wp post meta update $_SOB012192a03ae _regular_price 350.00
wp post meta update $_SOB012192a03ae _sku SOB012192a03ae
wp media import ./data/products/08-capsule/gallery/capsule_sofa_0000_004_000.jpg --post_id=$_SOB012192a03ae --featured_image=true
echo "Creating Product: slope"
_3STXXX06860224=`wp post create --post_title="slope" --menu_order=7 --post_name="slope_3stxxx06860224" --post_content='{:en}Shabby elegance. If you seek an affordable, cosy and relax sofa, look no further. The Slope sofa fulfils all these functions and more. The feather and foam cushions provide great comfort. The loosely fitted slipcover gives a sense of informality and restfulness. {:}{:fr}L'\''élégance shabby chic par excellence. Un canapé détente qui assure ce petit côté cosy tant recherché. Bien qu'\''offert à prix très abordable, Slope propose des coussins plumes et mousse du plus grand confort. Légèrement ample, sa housse exprime une certaine nonchalance décontractée et un caractère très informel.{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: slope"
wp post meta update $_3STXXX06860224 _visibility visible
wp post meta update $_3STXXX06860224 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3STXXX06860224 _price 350.00
wp post meta update $_3STXXX06860224 _regular_price 350.00
wp post term set $_3STXXX06860224 product_shipping_class furniture
wp post term set $_3STXXX06860224 product_cat sofas-3-seater
wp post term set $_3STXXX06860224 product_type variable
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3STXXX06860224 --featured_image=true
_3STXXX06860224_0=`wp media import ./data/products/07-slope/gallery/slope_sofa_0000_001.jpg --post_id=$_3STXXX06860224 --porcelain`
_3STXXX06860224_1=`wp media import ./data/products/07-slope/gallery/slope_sofa_0001_002.jpg --post_id=$_3STXXX06860224 --porcelain`
_3STXXX06860224_2=`wp media import ./data/products/07-slope/gallery/slope_sofa_0002_003.jpg --post_id=$_3STXXX06860224 --porcelain`
_3STXXX06860224_3=`wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004.jpg --post_id=$_3STXXX06860224 --porcelain`
_3STXXX06860224_4=`wp media import ./data/products/07-slope/gallery/slope_sofa_0001_005.jpg --post_id=$_3STXXX06860224 --porcelain`
_3STXXX06860224_5=`wp media import ./data/products/07-slope/gallery/slope_sofa_0002_006.jpg --post_id=$_3STXXX06860224 --porcelain`
wp post meta update $_3STXXX06860224 _product_image_gallery $_3STXXX06860224_0,$_3STXXX06860224_1,$_3STXXX06860224_2,$_3STXXX06860224_3,$_3STXXX06860224_4,$_3STXXX06860224_5
echo "Creating Variation: slope-001"
_3ST00110eb02e2=`wp post create --post_title="slope-001" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224001 --porcelain`
echo "Setting meta for product: slope-001 Variation: 001"
wp post meta update $_3ST00110eb02e2 _visibility visible
wp post meta update $_3ST00110eb02e2 attribute_edb_material 001
wp post meta update $_3ST00110eb02e2 _stock 2
wp post meta update $_3ST00110eb02e2 _stock_status instock
wp post meta update $_3ST00110eb02e2 _manage_stock yes
wp post meta update $_3ST00110eb02e2 _backorders yes
wp post meta update $_3ST00110eb02e2 _price 350.00
wp post meta update $_3ST00110eb02e2 _regular_price 350.00
wp post meta update $_3ST00110eb02e2 _sku 3ST00110eb02e2
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST00110eb02e2 --featured_image=true
echo "Creating Variation: slope-002"
_3ST00210ec02e3=`wp post create --post_title="slope-002" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224002 --porcelain`
echo "Setting meta for product: slope-002 Variation: 002"
wp post meta update $_3ST00210ec02e3 _visibility visible
wp post meta update $_3ST00210ec02e3 attribute_edb_material 002
wp post meta update $_3ST00210ec02e3 _stock 2
wp post meta update $_3ST00210ec02e3 _stock_status instock
wp post meta update $_3ST00210ec02e3 _manage_stock yes
wp post meta update $_3ST00210ec02e3 _backorders yes
wp post meta update $_3ST00210ec02e3 _price 350.00
wp post meta update $_3ST00210ec02e3 _regular_price 350.00
wp post meta update $_3ST00210ec02e3 _sku 3ST00210ec02e3
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST00210ec02e3 --featured_image=true
echo "Creating Variation: slope-003"
_3ST00310ed02e4=`wp post create --post_title="slope-003" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224003 --porcelain`
echo "Setting meta for product: slope-003 Variation: 003"
wp post meta update $_3ST00310ed02e4 _visibility visible
wp post meta update $_3ST00310ed02e4 attribute_edb_material 003
wp post meta update $_3ST00310ed02e4 _stock 2
wp post meta update $_3ST00310ed02e4 _stock_status instock
wp post meta update $_3ST00310ed02e4 _manage_stock yes
wp post meta update $_3ST00310ed02e4 _backorders yes
wp post meta update $_3ST00310ed02e4 _price 350.00
wp post meta update $_3ST00310ed02e4 _regular_price 350.00
wp post meta update $_3ST00310ed02e4 _sku 3ST00310ed02e4
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST00310ed02e4 --featured_image=true
echo "Creating Variation: slope-004"
_3ST00410ee02e5=`wp post create --post_title="slope-004" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224004 --porcelain`
echo "Setting meta for product: slope-004 Variation: 004"
wp post meta update $_3ST00410ee02e5 _visibility visible
wp post meta update $_3ST00410ee02e5 attribute_edb_material 004
wp post meta update $_3ST00410ee02e5 _stock 2
wp post meta update $_3ST00410ee02e5 _stock_status instock
wp post meta update $_3ST00410ee02e5 _manage_stock yes
wp post meta update $_3ST00410ee02e5 _backorders yes
wp post meta update $_3ST00410ee02e5 _price 350.00
wp post meta update $_3ST00410ee02e5 _regular_price 350.00
wp post meta update $_3ST00410ee02e5 _sku 3ST00410ee02e5
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST00410ee02e5 --featured_image=true
echo "Creating Variation: slope-005"
_3ST00510ef02e6=`wp post create --post_title="slope-005" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224005 --porcelain`
echo "Setting meta for product: slope-005 Variation: 005"
wp post meta update $_3ST00510ef02e6 _visibility visible
wp post meta update $_3ST00510ef02e6 attribute_edb_material 005
wp post meta update $_3ST00510ef02e6 _stock 2
wp post meta update $_3ST00510ef02e6 _stock_status instock
wp post meta update $_3ST00510ef02e6 _manage_stock yes
wp post meta update $_3ST00510ef02e6 _backorders yes
wp post meta update $_3ST00510ef02e6 _price 350.00
wp post meta update $_3ST00510ef02e6 _regular_price 350.00
wp post meta update $_3ST00510ef02e6 _sku 3ST00510ef02e6
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST00510ef02e6 --featured_image=true
echo "Creating Variation: slope-006"
_3ST00610f002e7=`wp post create --post_title="slope-006" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224006 --porcelain`
echo "Setting meta for product: slope-006 Variation: 006"
wp post meta update $_3ST00610f002e7 _visibility visible
wp post meta update $_3ST00610f002e7 attribute_edb_material 006
wp post meta update $_3ST00610f002e7 _stock 2
wp post meta update $_3ST00610f002e7 _stock_status instock
wp post meta update $_3ST00610f002e7 _manage_stock yes
wp post meta update $_3ST00610f002e7 _backorders yes
wp post meta update $_3ST00610f002e7 _price 350.00
wp post meta update $_3ST00610f002e7 _regular_price 350.00
wp post meta update $_3ST00610f002e7 _sku 3ST00610f002e7
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST00610f002e7 --featured_image=true
echo "Creating Variation: slope-007"
_3ST00710f102e8=`wp post create --post_title="slope-007" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224007 --porcelain`
echo "Setting meta for product: slope-007 Variation: 007"
wp post meta update $_3ST00710f102e8 _visibility visible
wp post meta update $_3ST00710f102e8 attribute_edb_material 007
wp post meta update $_3ST00710f102e8 _stock 2
wp post meta update $_3ST00710f102e8 _stock_status instock
wp post meta update $_3ST00710f102e8 _manage_stock yes
wp post meta update $_3ST00710f102e8 _backorders yes
wp post meta update $_3ST00710f102e8 _price 350.00
wp post meta update $_3ST00710f102e8 _regular_price 350.00
wp post meta update $_3ST00710f102e8 _sku 3ST00710f102e8
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST00710f102e8 --featured_image=true
echo "Creating Variation: slope-008"
_3ST00810f202e9=`wp post create --post_title="slope-008" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224008 --porcelain`
echo "Setting meta for product: slope-008 Variation: 008"
wp post meta update $_3ST00810f202e9 _visibility visible
wp post meta update $_3ST00810f202e9 attribute_edb_material 008
wp post meta update $_3ST00810f202e9 _stock 2
wp post meta update $_3ST00810f202e9 _stock_status instock
wp post meta update $_3ST00810f202e9 _manage_stock yes
wp post meta update $_3ST00810f202e9 _backorders yes
wp post meta update $_3ST00810f202e9 _price 350.00
wp post meta update $_3ST00810f202e9 _regular_price 350.00
wp post meta update $_3ST00810f202e9 _sku 3ST00810f202e9
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST00810f202e9 --featured_image=true
echo "Creating Variation: slope-009"
_3ST00910f302ea=`wp post create --post_title="slope-009" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224009 --porcelain`
echo "Setting meta for product: slope-009 Variation: 009"
wp post meta update $_3ST00910f302ea _visibility visible
wp post meta update $_3ST00910f302ea attribute_edb_material 009
wp post meta update $_3ST00910f302ea _stock 2
wp post meta update $_3ST00910f302ea _stock_status instock
wp post meta update $_3ST00910f302ea _manage_stock yes
wp post meta update $_3ST00910f302ea _backorders yes
wp post meta update $_3ST00910f302ea _price 350.00
wp post meta update $_3ST00910f302ea _regular_price 350.00
wp post meta update $_3ST00910f302ea _sku 3ST00910f302ea
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST00910f302ea --featured_image=true
echo "Creating Variation: slope-010"
_3ST01010ec02e2=`wp post create --post_title="slope-010" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224010 --porcelain`
echo "Setting meta for product: slope-010 Variation: 010"
wp post meta update $_3ST01010ec02e2 _visibility visible
wp post meta update $_3ST01010ec02e2 attribute_edb_material 010
wp post meta update $_3ST01010ec02e2 _stock 2
wp post meta update $_3ST01010ec02e2 _stock_status instock
wp post meta update $_3ST01010ec02e2 _manage_stock yes
wp post meta update $_3ST01010ec02e2 _backorders yes
wp post meta update $_3ST01010ec02e2 _price 350.00
wp post meta update $_3ST01010ec02e2 _regular_price 350.00
wp post meta update $_3ST01010ec02e2 _sku 3ST01010ec02e2
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST01010ec02e2 --featured_image=true
echo "Creating Variation: slope-011"
_3ST01110ed02e3=`wp post create --post_title="slope-011" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224011 --porcelain`
echo "Setting meta for product: slope-011 Variation: 011"
wp post meta update $_3ST01110ed02e3 _visibility visible
wp post meta update $_3ST01110ed02e3 attribute_edb_material 011
wp post meta update $_3ST01110ed02e3 _stock 2
wp post meta update $_3ST01110ed02e3 _stock_status instock
wp post meta update $_3ST01110ed02e3 _manage_stock yes
wp post meta update $_3ST01110ed02e3 _backorders yes
wp post meta update $_3ST01110ed02e3 _price 350.00
wp post meta update $_3ST01110ed02e3 _regular_price 350.00
wp post meta update $_3ST01110ed02e3 _sku 3ST01110ed02e3
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST01110ed02e3 --featured_image=true
echo "Creating Variation: slope-012"
_3ST01210ee02e4=`wp post create --post_title="slope-012" --post_parent=$_3STXXX06860224 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=slope_3stxxx06860224012 --porcelain`
echo "Setting meta for product: slope-012 Variation: 012"
wp post meta update $_3ST01210ee02e4 _visibility visible
wp post meta update $_3ST01210ee02e4 attribute_edb_material 012
wp post meta update $_3ST01210ee02e4 _stock 2
wp post meta update $_3ST01210ee02e4 _stock_status instock
wp post meta update $_3ST01210ee02e4 _manage_stock yes
wp post meta update $_3ST01210ee02e4 _backorders yes
wp post meta update $_3ST01210ee02e4 _price 350.00
wp post meta update $_3ST01210ee02e4 _regular_price 350.00
wp post meta update $_3ST01210ee02e4 _sku 3ST01210ee02e4
wp media import ./data/products/07-slope/gallery/slope_sofa_0000_004_000.jpg --post_id=$_3ST01210ee02e4 --featured_image=true
echo "Creating Product: taxi"
_3STXXX045001b7=`wp post create --post_title="taxi" --menu_order=6 --post_name="taxi_3stxxx045001b7" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: taxi"
wp post meta update $_3STXXX045001b7 _visibility visible
wp post meta update $_3STXXX045001b7 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3STXXX045001b7 _price 350.00
wp post meta update $_3STXXX045001b7 _regular_price 350.00
wp post term set $_3STXXX045001b7 product_shipping_class furniture
wp post term set $_3STXXX045001b7 product_cat sofas-3-seater
wp post term set $_3STXXX045001b7 product_type variable
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3STXXX045001b7 --featured_image=true
_3STXXX045001b7_0=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_001.jpg --post_id=$_3STXXX045001b7 --porcelain`
_3STXXX045001b7_1=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0001_002.jpg --post_id=$_3STXXX045001b7 --porcelain`
_3STXXX045001b7_2=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0002_003.jpg --post_id=$_3STXXX045001b7 --porcelain`
_3STXXX045001b7_3=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004.jpg --post_id=$_3STXXX045001b7 --porcelain`
_3STXXX045001b7_4=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0001_005.jpg --post_id=$_3STXXX045001b7 --porcelain`
_3STXXX045001b7_5=`wp media import ./data/products/06-taxi/gallery/taxi_sofa_0002_006.jpg --post_id=$_3STXXX045001b7 --porcelain`
wp post meta update $_3STXXX045001b7 _product_image_gallery $_3STXXX045001b7_0,$_3STXXX045001b7_1,$_3STXXX045001b7_2,$_3STXXX045001b7_3,$_3STXXX045001b7_4,$_3STXXX045001b7_5
echo "Creating Variation: taxi-001"
_3ST0010d010275=`wp post create --post_title="taxi-001" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7001 --porcelain`
echo "Setting meta for product: taxi-001 Variation: 001"
wp post meta update $_3ST0010d010275 _visibility visible
wp post meta update $_3ST0010d010275 attribute_edb_material 001
wp post meta update $_3ST0010d010275 _stock 2
wp post meta update $_3ST0010d010275 _stock_status instock
wp post meta update $_3ST0010d010275 _manage_stock yes
wp post meta update $_3ST0010d010275 _backorders yes
wp post meta update $_3ST0010d010275 _price 350.00
wp post meta update $_3ST0010d010275 _regular_price 350.00
wp post meta update $_3ST0010d010275 _sku 3ST0010d010275
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0010d010275 --featured_image=true
echo "Creating Variation: taxi-002"
_3ST0020d020276=`wp post create --post_title="taxi-002" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7002 --porcelain`
echo "Setting meta for product: taxi-002 Variation: 002"
wp post meta update $_3ST0020d020276 _visibility visible
wp post meta update $_3ST0020d020276 attribute_edb_material 002
wp post meta update $_3ST0020d020276 _stock 2
wp post meta update $_3ST0020d020276 _stock_status instock
wp post meta update $_3ST0020d020276 _manage_stock yes
wp post meta update $_3ST0020d020276 _backorders yes
wp post meta update $_3ST0020d020276 _price 350.00
wp post meta update $_3ST0020d020276 _regular_price 350.00
wp post meta update $_3ST0020d020276 _sku 3ST0020d020276
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0020d020276 --featured_image=true
echo "Creating Variation: taxi-003"
_3ST0030d030277=`wp post create --post_title="taxi-003" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7003 --porcelain`
echo "Setting meta for product: taxi-003 Variation: 003"
wp post meta update $_3ST0030d030277 _visibility visible
wp post meta update $_3ST0030d030277 attribute_edb_material 003
wp post meta update $_3ST0030d030277 _stock 2
wp post meta update $_3ST0030d030277 _stock_status instock
wp post meta update $_3ST0030d030277 _manage_stock yes
wp post meta update $_3ST0030d030277 _backorders yes
wp post meta update $_3ST0030d030277 _price 350.00
wp post meta update $_3ST0030d030277 _regular_price 350.00
wp post meta update $_3ST0030d030277 _sku 3ST0030d030277
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0030d030277 --featured_image=true
echo "Creating Variation: taxi-004"
_3ST0040d040278=`wp post create --post_title="taxi-004" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7004 --porcelain`
echo "Setting meta for product: taxi-004 Variation: 004"
wp post meta update $_3ST0040d040278 _visibility visible
wp post meta update $_3ST0040d040278 attribute_edb_material 004
wp post meta update $_3ST0040d040278 _stock 2
wp post meta update $_3ST0040d040278 _stock_status instock
wp post meta update $_3ST0040d040278 _manage_stock yes
wp post meta update $_3ST0040d040278 _backorders yes
wp post meta update $_3ST0040d040278 _price 350.00
wp post meta update $_3ST0040d040278 _regular_price 350.00
wp post meta update $_3ST0040d040278 _sku 3ST0040d040278
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0040d040278 --featured_image=true
echo "Creating Variation: taxi-005"
_3ST0050d050279=`wp post create --post_title="taxi-005" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7005 --porcelain`
echo "Setting meta for product: taxi-005 Variation: 005"
wp post meta update $_3ST0050d050279 _visibility visible
wp post meta update $_3ST0050d050279 attribute_edb_material 005
wp post meta update $_3ST0050d050279 _stock 2
wp post meta update $_3ST0050d050279 _stock_status instock
wp post meta update $_3ST0050d050279 _manage_stock yes
wp post meta update $_3ST0050d050279 _backorders yes
wp post meta update $_3ST0050d050279 _price 350.00
wp post meta update $_3ST0050d050279 _regular_price 350.00
wp post meta update $_3ST0050d050279 _sku 3ST0050d050279
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0050d050279 --featured_image=true
echo "Creating Variation: taxi-006"
_3ST0060d06027a=`wp post create --post_title="taxi-006" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7006 --porcelain`
echo "Setting meta for product: taxi-006 Variation: 006"
wp post meta update $_3ST0060d06027a _visibility visible
wp post meta update $_3ST0060d06027a attribute_edb_material 006
wp post meta update $_3ST0060d06027a _stock 2
wp post meta update $_3ST0060d06027a _stock_status instock
wp post meta update $_3ST0060d06027a _manage_stock yes
wp post meta update $_3ST0060d06027a _backorders yes
wp post meta update $_3ST0060d06027a _price 350.00
wp post meta update $_3ST0060d06027a _regular_price 350.00
wp post meta update $_3ST0060d06027a _sku 3ST0060d06027a
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0060d06027a --featured_image=true
echo "Creating Variation: taxi-007"
_3ST0070d07027b=`wp post create --post_title="taxi-007" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7007 --porcelain`
echo "Setting meta for product: taxi-007 Variation: 007"
wp post meta update $_3ST0070d07027b _visibility visible
wp post meta update $_3ST0070d07027b attribute_edb_material 007
wp post meta update $_3ST0070d07027b _stock 2
wp post meta update $_3ST0070d07027b _stock_status instock
wp post meta update $_3ST0070d07027b _manage_stock yes
wp post meta update $_3ST0070d07027b _backorders yes
wp post meta update $_3ST0070d07027b _price 350.00
wp post meta update $_3ST0070d07027b _regular_price 350.00
wp post meta update $_3ST0070d07027b _sku 3ST0070d07027b
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0070d07027b --featured_image=true
echo "Creating Variation: taxi-008"
_3ST0080d08027c=`wp post create --post_title="taxi-008" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7008 --porcelain`
echo "Setting meta for product: taxi-008 Variation: 008"
wp post meta update $_3ST0080d08027c _visibility visible
wp post meta update $_3ST0080d08027c attribute_edb_material 008
wp post meta update $_3ST0080d08027c _stock 2
wp post meta update $_3ST0080d08027c _stock_status instock
wp post meta update $_3ST0080d08027c _manage_stock yes
wp post meta update $_3ST0080d08027c _backorders yes
wp post meta update $_3ST0080d08027c _price 350.00
wp post meta update $_3ST0080d08027c _regular_price 350.00
wp post meta update $_3ST0080d08027c _sku 3ST0080d08027c
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0080d08027c --featured_image=true
echo "Creating Variation: taxi-009"
_3ST0090d09027d=`wp post create --post_title="taxi-009" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7009 --porcelain`
echo "Setting meta for product: taxi-009 Variation: 009"
wp post meta update $_3ST0090d09027d _visibility visible
wp post meta update $_3ST0090d09027d attribute_edb_material 009
wp post meta update $_3ST0090d09027d _stock 2
wp post meta update $_3ST0090d09027d _stock_status instock
wp post meta update $_3ST0090d09027d _manage_stock yes
wp post meta update $_3ST0090d09027d _backorders yes
wp post meta update $_3ST0090d09027d _price 350.00
wp post meta update $_3ST0090d09027d _regular_price 350.00
wp post meta update $_3ST0090d09027d _sku 3ST0090d09027d
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0090d09027d --featured_image=true
echo "Creating Variation: taxi-010"
_3ST0100d020275=`wp post create --post_title="taxi-010" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7010 --porcelain`
echo "Setting meta for product: taxi-010 Variation: 010"
wp post meta update $_3ST0100d020275 _visibility visible
wp post meta update $_3ST0100d020275 attribute_edb_material 010
wp post meta update $_3ST0100d020275 _stock 2
wp post meta update $_3ST0100d020275 _stock_status instock
wp post meta update $_3ST0100d020275 _manage_stock yes
wp post meta update $_3ST0100d020275 _backorders yes
wp post meta update $_3ST0100d020275 _price 350.00
wp post meta update $_3ST0100d020275 _regular_price 350.00
wp post meta update $_3ST0100d020275 _sku 3ST0100d020275
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0100d020275 --featured_image=true
echo "Creating Variation: taxi-011"
_3ST0110d030276=`wp post create --post_title="taxi-011" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7011 --porcelain`
echo "Setting meta for product: taxi-011 Variation: 011"
wp post meta update $_3ST0110d030276 _visibility visible
wp post meta update $_3ST0110d030276 attribute_edb_material 011
wp post meta update $_3ST0110d030276 _stock 2
wp post meta update $_3ST0110d030276 _stock_status instock
wp post meta update $_3ST0110d030276 _manage_stock yes
wp post meta update $_3ST0110d030276 _backorders yes
wp post meta update $_3ST0110d030276 _price 350.00
wp post meta update $_3ST0110d030276 _regular_price 350.00
wp post meta update $_3ST0110d030276 _sku 3ST0110d030276
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0110d030276 --featured_image=true
echo "Creating Variation: taxi-012"
_3ST0120d040277=`wp post create --post_title="taxi-012" --post_parent=$_3STXXX045001b7 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=taxi_3stxxx045001b7012 --porcelain`
echo "Setting meta for product: taxi-012 Variation: 012"
wp post meta update $_3ST0120d040277 _visibility visible
wp post meta update $_3ST0120d040277 attribute_edb_material 012
wp post meta update $_3ST0120d040277 _stock 2
wp post meta update $_3ST0120d040277 _stock_status instock
wp post meta update $_3ST0120d040277 _manage_stock yes
wp post meta update $_3ST0120d040277 _backorders yes
wp post meta update $_3ST0120d040277 _price 350.00
wp post meta update $_3ST0120d040277 _regular_price 350.00
wp post meta update $_3ST0120d040277 _sku 3ST0120d040277
wp media import ./data/products/06-taxi/gallery/taxi_sofa_0000_004_000.jpg --post_id=$_3ST0120d040277 --featured_image=true
echo "Creating Product: atrium"
_3STXXX08ea0293=`wp post create --post_title="atrium" --menu_order=5 --post_name="atrium_3stxxx08ea0293" --post_content='{:en}The strength of simple lines. Thin arms and soft cushions characterize the Atrium sofa. With its pure and rigorous rectangular volume, the shape is enduring. A touch of timelessness at home. {:}{:fr}La force de la ligne. Un superbe volume composé de lignes pures, simples et rigoureuses à la fois. Un seul coussin pour le dossier, un seul pour le siège et le réconfort de deux traversins en bout de ligne. Que du caractère. Et aussi une beauté intemporelle.{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: atrium"
wp post meta update $_3STXXX08ea0293 _visibility visible
wp post meta update $_3STXXX08ea0293 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3STXXX08ea0293 _price 350.00
wp post meta update $_3STXXX08ea0293 _regular_price 350.00
wp post term set $_3STXXX08ea0293 product_shipping_class furniture
wp post term set $_3STXXX08ea0293 product_cat sofas-3-seater
wp post term set $_3STXXX08ea0293 product_type variable
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3STXXX08ea0293 --featured_image=true
_3STXXX08ea0293_0=`wp media import ./data/products/05-atrium/gallery/atrium_sofa_0000_001.jpg --post_id=$_3STXXX08ea0293 --porcelain`
_3STXXX08ea0293_1=`wp media import ./data/products/05-atrium/gallery/atrium_sofa_0001_002.jpg --post_id=$_3STXXX08ea0293 --porcelain`
_3STXXX08ea0293_2=`wp media import ./data/products/05-atrium/gallery/atrium_sofa_0002_003.jpg --post_id=$_3STXXX08ea0293 --porcelain`
_3STXXX08ea0293_3=`wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004.jpg --post_id=$_3STXXX08ea0293 --porcelain`
_3STXXX08ea0293_4=`wp media import ./data/products/05-atrium/gallery/atrium_natural_0001_005.jpg --post_id=$_3STXXX08ea0293 --porcelain`
_3STXXX08ea0293_5=`wp media import ./data/products/05-atrium/gallery/atrium_natural_0002_006.jpg --post_id=$_3STXXX08ea0293 --porcelain`
wp post meta update $_3STXXX08ea0293 _product_image_gallery $_3STXXX08ea0293_0,$_3STXXX08ea0293_1,$_3STXXX08ea0293_2,$_3STXXX08ea0293_3,$_3STXXX08ea0293_4,$_3STXXX08ea0293_5
echo "Creating Variation: atrium-001"
_3ST001150b0351=`wp post create --post_title="atrium-001" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293001 --porcelain`
echo "Setting meta for product: atrium-001 Variation: 001"
wp post meta update $_3ST001150b0351 _visibility visible
wp post meta update $_3ST001150b0351 attribute_edb_material 001
wp post meta update $_3ST001150b0351 _stock 2
wp post meta update $_3ST001150b0351 _stock_status instock
wp post meta update $_3ST001150b0351 _manage_stock yes
wp post meta update $_3ST001150b0351 _backorders yes
wp post meta update $_3ST001150b0351 _price 350.00
wp post meta update $_3ST001150b0351 _regular_price 350.00
wp post meta update $_3ST001150b0351 _sku 3ST001150b0351
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST001150b0351 --featured_image=true
echo "Creating Variation: atrium-002"
_3ST002150c0352=`wp post create --post_title="atrium-002" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293002 --porcelain`
echo "Setting meta for product: atrium-002 Variation: 002"
wp post meta update $_3ST002150c0352 _visibility visible
wp post meta update $_3ST002150c0352 attribute_edb_material 002
wp post meta update $_3ST002150c0352 _stock 2
wp post meta update $_3ST002150c0352 _stock_status instock
wp post meta update $_3ST002150c0352 _manage_stock yes
wp post meta update $_3ST002150c0352 _backorders yes
wp post meta update $_3ST002150c0352 _price 350.00
wp post meta update $_3ST002150c0352 _regular_price 350.00
wp post meta update $_3ST002150c0352 _sku 3ST002150c0352
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST002150c0352 --featured_image=true
echo "Creating Variation: atrium-003"
_3ST003150d0353=`wp post create --post_title="atrium-003" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293003 --porcelain`
echo "Setting meta for product: atrium-003 Variation: 003"
wp post meta update $_3ST003150d0353 _visibility visible
wp post meta update $_3ST003150d0353 attribute_edb_material 003
wp post meta update $_3ST003150d0353 _stock 2
wp post meta update $_3ST003150d0353 _stock_status instock
wp post meta update $_3ST003150d0353 _manage_stock yes
wp post meta update $_3ST003150d0353 _backorders yes
wp post meta update $_3ST003150d0353 _price 350.00
wp post meta update $_3ST003150d0353 _regular_price 350.00
wp post meta update $_3ST003150d0353 _sku 3ST003150d0353
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST003150d0353 --featured_image=true
echo "Creating Variation: atrium-004"
_3ST004150e0354=`wp post create --post_title="atrium-004" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293004 --porcelain`
echo "Setting meta for product: atrium-004 Variation: 004"
wp post meta update $_3ST004150e0354 _visibility visible
wp post meta update $_3ST004150e0354 attribute_edb_material 004
wp post meta update $_3ST004150e0354 _stock 2
wp post meta update $_3ST004150e0354 _stock_status instock
wp post meta update $_3ST004150e0354 _manage_stock yes
wp post meta update $_3ST004150e0354 _backorders yes
wp post meta update $_3ST004150e0354 _price 350.00
wp post meta update $_3ST004150e0354 _regular_price 350.00
wp post meta update $_3ST004150e0354 _sku 3ST004150e0354
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST004150e0354 --featured_image=true
echo "Creating Variation: atrium-005"
_3ST005150f0355=`wp post create --post_title="atrium-005" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293005 --porcelain`
echo "Setting meta for product: atrium-005 Variation: 005"
wp post meta update $_3ST005150f0355 _visibility visible
wp post meta update $_3ST005150f0355 attribute_edb_material 005
wp post meta update $_3ST005150f0355 _stock 2
wp post meta update $_3ST005150f0355 _stock_status instock
wp post meta update $_3ST005150f0355 _manage_stock yes
wp post meta update $_3ST005150f0355 _backorders yes
wp post meta update $_3ST005150f0355 _price 350.00
wp post meta update $_3ST005150f0355 _regular_price 350.00
wp post meta update $_3ST005150f0355 _sku 3ST005150f0355
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST005150f0355 --featured_image=true
echo "Creating Variation: atrium-006"
_3ST00615100356=`wp post create --post_title="atrium-006" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293006 --porcelain`
echo "Setting meta for product: atrium-006 Variation: 006"
wp post meta update $_3ST00615100356 _visibility visible
wp post meta update $_3ST00615100356 attribute_edb_material 006
wp post meta update $_3ST00615100356 _stock 2
wp post meta update $_3ST00615100356 _stock_status instock
wp post meta update $_3ST00615100356 _manage_stock yes
wp post meta update $_3ST00615100356 _backorders yes
wp post meta update $_3ST00615100356 _price 350.00
wp post meta update $_3ST00615100356 _regular_price 350.00
wp post meta update $_3ST00615100356 _sku 3ST00615100356
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST00615100356 --featured_image=true
echo "Creating Variation: atrium-007"
_3ST00715110357=`wp post create --post_title="atrium-007" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293007 --porcelain`
echo "Setting meta for product: atrium-007 Variation: 007"
wp post meta update $_3ST00715110357 _visibility visible
wp post meta update $_3ST00715110357 attribute_edb_material 007
wp post meta update $_3ST00715110357 _stock 2
wp post meta update $_3ST00715110357 _stock_status instock
wp post meta update $_3ST00715110357 _manage_stock yes
wp post meta update $_3ST00715110357 _backorders yes
wp post meta update $_3ST00715110357 _price 350.00
wp post meta update $_3ST00715110357 _regular_price 350.00
wp post meta update $_3ST00715110357 _sku 3ST00715110357
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST00715110357 --featured_image=true
echo "Creating Variation: atrium-008"
_3ST00815120358=`wp post create --post_title="atrium-008" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293008 --porcelain`
echo "Setting meta for product: atrium-008 Variation: 008"
wp post meta update $_3ST00815120358 _visibility visible
wp post meta update $_3ST00815120358 attribute_edb_material 008
wp post meta update $_3ST00815120358 _stock 2
wp post meta update $_3ST00815120358 _stock_status instock
wp post meta update $_3ST00815120358 _manage_stock yes
wp post meta update $_3ST00815120358 _backorders yes
wp post meta update $_3ST00815120358 _price 350.00
wp post meta update $_3ST00815120358 _regular_price 350.00
wp post meta update $_3ST00815120358 _sku 3ST00815120358
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST00815120358 --featured_image=true
echo "Creating Variation: atrium-009"
_3ST00915130359=`wp post create --post_title="atrium-009" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293009 --porcelain`
echo "Setting meta for product: atrium-009 Variation: 009"
wp post meta update $_3ST00915130359 _visibility visible
wp post meta update $_3ST00915130359 attribute_edb_material 009
wp post meta update $_3ST00915130359 _stock 2
wp post meta update $_3ST00915130359 _stock_status instock
wp post meta update $_3ST00915130359 _manage_stock yes
wp post meta update $_3ST00915130359 _backorders yes
wp post meta update $_3ST00915130359 _price 350.00
wp post meta update $_3ST00915130359 _regular_price 350.00
wp post meta update $_3ST00915130359 _sku 3ST00915130359
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST00915130359 --featured_image=true
echo "Creating Variation: atrium-010"
_3ST010150c0351=`wp post create --post_title="atrium-010" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293010 --porcelain`
echo "Setting meta for product: atrium-010 Variation: 010"
wp post meta update $_3ST010150c0351 _visibility visible
wp post meta update $_3ST010150c0351 attribute_edb_material 010
wp post meta update $_3ST010150c0351 _stock 2
wp post meta update $_3ST010150c0351 _stock_status instock
wp post meta update $_3ST010150c0351 _manage_stock yes
wp post meta update $_3ST010150c0351 _backorders yes
wp post meta update $_3ST010150c0351 _price 350.00
wp post meta update $_3ST010150c0351 _regular_price 350.00
wp post meta update $_3ST010150c0351 _sku 3ST010150c0351
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST010150c0351 --featured_image=true
echo "Creating Variation: atrium-011"
_3ST011150d0352=`wp post create --post_title="atrium-011" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293011 --porcelain`
echo "Setting meta for product: atrium-011 Variation: 011"
wp post meta update $_3ST011150d0352 _visibility visible
wp post meta update $_3ST011150d0352 attribute_edb_material 011
wp post meta update $_3ST011150d0352 _stock 2
wp post meta update $_3ST011150d0352 _stock_status instock
wp post meta update $_3ST011150d0352 _manage_stock yes
wp post meta update $_3ST011150d0352 _backorders yes
wp post meta update $_3ST011150d0352 _price 350.00
wp post meta update $_3ST011150d0352 _regular_price 350.00
wp post meta update $_3ST011150d0352 _sku 3ST011150d0352
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST011150d0352 --featured_image=true
echo "Creating Variation: atrium-012"
_3ST012150e0353=`wp post create --post_title="atrium-012" --post_parent=$_3STXXX08ea0293 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=atrium_3stxxx08ea0293012 --porcelain`
echo "Setting meta for product: atrium-012 Variation: 012"
wp post meta update $_3ST012150e0353 _visibility visible
wp post meta update $_3ST012150e0353 attribute_edb_material 012
wp post meta update $_3ST012150e0353 _stock 2
wp post meta update $_3ST012150e0353 _stock_status instock
wp post meta update $_3ST012150e0353 _manage_stock yes
wp post meta update $_3ST012150e0353 _backorders yes
wp post meta update $_3ST012150e0353 _price 350.00
wp post meta update $_3ST012150e0353 _regular_price 350.00
wp post meta update $_3ST012150e0353 _sku 3ST012150e0353
wp media import ./data/products/05-atrium/gallery/atrium_natural_0000_004_000.jpg --post_id=$_3ST012150e0353 --featured_image=true
echo "Creating Product: study"
_3STXXX06b4023a=`wp post create --post_title="study" --menu_order=4 --post_name="study_3stxxx06b4023a" --post_content='{:en}Fall into heaven. Designed by celebrated design studio Blazysgérard, the Study sofa is pure comfort. Extra deep feather and foam seat cushions make this the perfect sofa to sink into and forget about our everyday worries. The rounded back adds an extra touch of snuggleness and privacy. Pull your favorite book and spend all afternoon lazing around.{:}{:fr}Une descente au paradis. Conçu par le renommé studio de design Bkazysgérard, le canapé Study, c'\''est le confort avec un grand C. Généreusement garnis de plumes et de mousse, ses coussins de siège invitent à une détente prolongée. Et les formes arrondies de son dossier ajoutent ce petit extra d'\''intimité et de confort. On y passe des après-midi entiers, bien blotti, à y lire le dernier polar à la mode…{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: study"
wp post meta update $_3STXXX06b4023a _visibility visible
wp post meta update $_3STXXX06b4023a _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3STXXX06b4023a _price 350.00
wp post meta update $_3STXXX06b4023a _regular_price 350.00
wp post term set $_3STXXX06b4023a product_shipping_class furniture
wp post term set $_3STXXX06b4023a product_cat sofas-3-seater
wp post term set $_3STXXX06b4023a product_type variable
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3STXXX06b4023a --featured_image=true
_3STXXX06b4023a_0=`wp media import ./data/products/04-study/gallery/study_sofa_0000_001.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_1=`wp media import ./data/products/04-study/gallery/study_sofa_0001_002.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_2=`wp media import ./data/products/04-study/gallery/study_sofa_0002_003.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_3=`wp media import ./data/products/04-study/gallery/study_sofa_0003_004.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_4=`wp media import ./data/products/04-study/gallery/study_sofa_0004_005.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_5=`wp media import ./data/products/04-study/gallery/study_sofa_0005_006.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_6=`wp media import ./data/products/04-study/gallery/study_sofa_0006_007.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_7=`wp media import ./data/products/04-study/gallery/study_sofa_0000_008.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_8=`wp media import ./data/products/04-study/gallery/study_sofa_0000_009.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_9=`wp media import ./data/products/04-study/gallery/study_sofa_0000_010.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_10=`wp media import ./data/products/04-study/gallery/study_sofa_0000_011.jpg --post_id=$_3STXXX06b4023a --porcelain`
_3STXXX06b4023a_11=`wp media import ./data/products/04-study/gallery/study_sofa_0000_012.jpg --post_id=$_3STXXX06b4023a --porcelain`
wp post meta update $_3STXXX06b4023a _product_image_gallery $_3STXXX06b4023a_0,$_3STXXX06b4023a_1,$_3STXXX06b4023a_2,$_3STXXX06b4023a_3,$_3STXXX06b4023a_4,$_3STXXX06b4023a_5,$_3STXXX06b4023a_6,$_3STXXX06b4023a_7,$_3STXXX06b4023a_8,$_3STXXX06b4023a_9,$_3STXXX06b4023a_10,$_3STXXX06b4023a_11
echo "Creating Variation: study-001"
_3ST001117102f8=`wp post create --post_title="study-001" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a001 --porcelain`
echo "Setting meta for product: study-001 Variation: 001"
wp post meta update $_3ST001117102f8 _visibility visible
wp post meta update $_3ST001117102f8 attribute_edb_material 001
wp post meta update $_3ST001117102f8 _stock 2
wp post meta update $_3ST001117102f8 _stock_status instock
wp post meta update $_3ST001117102f8 _manage_stock yes
wp post meta update $_3ST001117102f8 _backorders yes
wp post meta update $_3ST001117102f8 _price 350.00
wp post meta update $_3ST001117102f8 _regular_price 350.00
wp post meta update $_3ST001117102f8 _sku 3ST001117102f8
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST001117102f8 --featured_image=true
echo "Creating Variation: study-002"
_3ST002117202f9=`wp post create --post_title="study-002" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a002 --porcelain`
echo "Setting meta for product: study-002 Variation: 002"
wp post meta update $_3ST002117202f9 _visibility visible
wp post meta update $_3ST002117202f9 attribute_edb_material 002
wp post meta update $_3ST002117202f9 _stock 2
wp post meta update $_3ST002117202f9 _stock_status instock
wp post meta update $_3ST002117202f9 _manage_stock yes
wp post meta update $_3ST002117202f9 _backorders yes
wp post meta update $_3ST002117202f9 _price 350.00
wp post meta update $_3ST002117202f9 _regular_price 350.00
wp post meta update $_3ST002117202f9 _sku 3ST002117202f9
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST002117202f9 --featured_image=true
echo "Creating Variation: study-003"
_3ST003117302fa=`wp post create --post_title="study-003" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a003 --porcelain`
echo "Setting meta for product: study-003 Variation: 003"
wp post meta update $_3ST003117302fa _visibility visible
wp post meta update $_3ST003117302fa attribute_edb_material 003
wp post meta update $_3ST003117302fa _stock 2
wp post meta update $_3ST003117302fa _stock_status instock
wp post meta update $_3ST003117302fa _manage_stock yes
wp post meta update $_3ST003117302fa _backorders yes
wp post meta update $_3ST003117302fa _price 350.00
wp post meta update $_3ST003117302fa _regular_price 350.00
wp post meta update $_3ST003117302fa _sku 3ST003117302fa
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST003117302fa --featured_image=true
echo "Creating Variation: study-004"
_3ST004117402fb=`wp post create --post_title="study-004" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a004 --porcelain`
echo "Setting meta for product: study-004 Variation: 004"
wp post meta update $_3ST004117402fb _visibility visible
wp post meta update $_3ST004117402fb attribute_edb_material 004
wp post meta update $_3ST004117402fb _stock 2
wp post meta update $_3ST004117402fb _stock_status instock
wp post meta update $_3ST004117402fb _manage_stock yes
wp post meta update $_3ST004117402fb _backorders yes
wp post meta update $_3ST004117402fb _price 350.00
wp post meta update $_3ST004117402fb _regular_price 350.00
wp post meta update $_3ST004117402fb _sku 3ST004117402fb
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST004117402fb --featured_image=true
echo "Creating Variation: study-005"
_3ST005117502fc=`wp post create --post_title="study-005" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a005 --porcelain`
echo "Setting meta for product: study-005 Variation: 005"
wp post meta update $_3ST005117502fc _visibility visible
wp post meta update $_3ST005117502fc attribute_edb_material 005
wp post meta update $_3ST005117502fc _stock 2
wp post meta update $_3ST005117502fc _stock_status instock
wp post meta update $_3ST005117502fc _manage_stock yes
wp post meta update $_3ST005117502fc _backorders yes
wp post meta update $_3ST005117502fc _price 350.00
wp post meta update $_3ST005117502fc _regular_price 350.00
wp post meta update $_3ST005117502fc _sku 3ST005117502fc
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST005117502fc --featured_image=true
echo "Creating Variation: study-006"
_3ST006117602fd=`wp post create --post_title="study-006" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a006 --porcelain`
echo "Setting meta for product: study-006 Variation: 006"
wp post meta update $_3ST006117602fd _visibility visible
wp post meta update $_3ST006117602fd attribute_edb_material 006
wp post meta update $_3ST006117602fd _stock 2
wp post meta update $_3ST006117602fd _stock_status instock
wp post meta update $_3ST006117602fd _manage_stock yes
wp post meta update $_3ST006117602fd _backorders yes
wp post meta update $_3ST006117602fd _price 350.00
wp post meta update $_3ST006117602fd _regular_price 350.00
wp post meta update $_3ST006117602fd _sku 3ST006117602fd
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST006117602fd --featured_image=true
echo "Creating Variation: study-007"
_3ST007117702fe=`wp post create --post_title="study-007" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a007 --porcelain`
echo "Setting meta for product: study-007 Variation: 007"
wp post meta update $_3ST007117702fe _visibility visible
wp post meta update $_3ST007117702fe attribute_edb_material 007
wp post meta update $_3ST007117702fe _stock 2
wp post meta update $_3ST007117702fe _stock_status instock
wp post meta update $_3ST007117702fe _manage_stock yes
wp post meta update $_3ST007117702fe _backorders yes
wp post meta update $_3ST007117702fe _price 350.00
wp post meta update $_3ST007117702fe _regular_price 350.00
wp post meta update $_3ST007117702fe _sku 3ST007117702fe
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST007117702fe --featured_image=true
echo "Creating Variation: study-008"
_3ST008117802ff=`wp post create --post_title="study-008" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a008 --porcelain`
echo "Setting meta for product: study-008 Variation: 008"
wp post meta update $_3ST008117802ff _visibility visible
wp post meta update $_3ST008117802ff attribute_edb_material 008
wp post meta update $_3ST008117802ff _stock 2
wp post meta update $_3ST008117802ff _stock_status instock
wp post meta update $_3ST008117802ff _manage_stock yes
wp post meta update $_3ST008117802ff _backorders yes
wp post meta update $_3ST008117802ff _price 350.00
wp post meta update $_3ST008117802ff _regular_price 350.00
wp post meta update $_3ST008117802ff _sku 3ST008117802ff
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST008117802ff --featured_image=true
echo "Creating Variation: study-009"
_3ST00911790300=`wp post create --post_title="study-009" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a009 --porcelain`
echo "Setting meta for product: study-009 Variation: 009"
wp post meta update $_3ST00911790300 _visibility visible
wp post meta update $_3ST00911790300 attribute_edb_material 009
wp post meta update $_3ST00911790300 _stock 2
wp post meta update $_3ST00911790300 _stock_status instock
wp post meta update $_3ST00911790300 _manage_stock yes
wp post meta update $_3ST00911790300 _backorders yes
wp post meta update $_3ST00911790300 _price 350.00
wp post meta update $_3ST00911790300 _regular_price 350.00
wp post meta update $_3ST00911790300 _sku 3ST00911790300
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST00911790300 --featured_image=true
echo "Creating Variation: study-010"
_3ST010117202f8=`wp post create --post_title="study-010" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a010 --porcelain`
echo "Setting meta for product: study-010 Variation: 010"
wp post meta update $_3ST010117202f8 _visibility visible
wp post meta update $_3ST010117202f8 attribute_edb_material 010
wp post meta update $_3ST010117202f8 _stock 2
wp post meta update $_3ST010117202f8 _stock_status instock
wp post meta update $_3ST010117202f8 _manage_stock yes
wp post meta update $_3ST010117202f8 _backorders yes
wp post meta update $_3ST010117202f8 _price 350.00
wp post meta update $_3ST010117202f8 _regular_price 350.00
wp post meta update $_3ST010117202f8 _sku 3ST010117202f8
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST010117202f8 --featured_image=true
echo "Creating Variation: study-011"
_3ST011117302f9=`wp post create --post_title="study-011" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a011 --porcelain`
echo "Setting meta for product: study-011 Variation: 011"
wp post meta update $_3ST011117302f9 _visibility visible
wp post meta update $_3ST011117302f9 attribute_edb_material 011
wp post meta update $_3ST011117302f9 _stock 2
wp post meta update $_3ST011117302f9 _stock_status instock
wp post meta update $_3ST011117302f9 _manage_stock yes
wp post meta update $_3ST011117302f9 _backorders yes
wp post meta update $_3ST011117302f9 _price 350.00
wp post meta update $_3ST011117302f9 _regular_price 350.00
wp post meta update $_3ST011117302f9 _sku 3ST011117302f9
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST011117302f9 --featured_image=true
echo "Creating Variation: study-012"
_3ST012117402fa=`wp post create --post_title="study-012" --post_parent=$_3STXXX06b4023a --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=study_3stxxx06b4023a012 --porcelain`
echo "Setting meta for product: study-012 Variation: 012"
wp post meta update $_3ST012117402fa _visibility visible
wp post meta update $_3ST012117402fa attribute_edb_material 012
wp post meta update $_3ST012117402fa _stock 2
wp post meta update $_3ST012117402fa _stock_status instock
wp post meta update $_3ST012117402fa _manage_stock yes
wp post meta update $_3ST012117402fa _backorders yes
wp post meta update $_3ST012117402fa _price 350.00
wp post meta update $_3ST012117402fa _regular_price 350.00
wp post meta update $_3ST012117402fa _sku 3ST012117402fa
wp media import ./data/products/04-study/gallery/study_sofa_0000_008_000.jpg --post_id=$_3ST012117402fa --featured_image=true
echo "Creating Product: stripe"
_3STXXX09440298=`wp post create --post_title="stripe" --menu_order=3 --post_name="stripe_3stxxx09440298" --post_content='{:en}Vintage spirit. As its name describes it, the Stripes sofa is defined by the vertical quilt pattern running along its back. With rounded feather-filled seat cushions, this sofa brings a touch of cosiness and retro elegance in the room. Pour yourself your favorite drink, sit back and enjoy the evening lounging in Stripes. {:}{:fr}Esprit vintage. Comme son nom l'\''indique, son style se définit par le matelassage vertical de son dossier, élément qui lui donne une bienveillante rondeur. Ses coussins garnis de plumes assurent un confort cozy, accueillant. En prime, son petit air d'\''élégance rétro. On y savoure son cocktail préféré, et en bonne compagnie.{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: stripe"
wp post meta update $_3STXXX09440298 _visibility visible
wp post meta update $_3STXXX09440298 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3STXXX09440298 _price 350.00
wp post meta update $_3STXXX09440298 _regular_price 350.00
wp post term set $_3STXXX09440298 product_shipping_class furniture
wp post term set $_3STXXX09440298 product_cat sofas-3-seater
wp post term set $_3STXXX09440298 product_type variable
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3STXXX09440298 --featured_image=true
_3STXXX09440298_0=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_001.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_1=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0001_002.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_2=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0002_003.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_3=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0003_004.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_4=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0004_005.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_5=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0005_006.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_6=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0006_007.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_7=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_8=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0001_009.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_9=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0002_010.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_10=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0003_011.jpg --post_id=$_3STXXX09440298 --porcelain`
_3STXXX09440298_11=`wp media import ./data/products/03-stripes/gallery/stripes_sofa_0004_012.jpg --post_id=$_3STXXX09440298 --porcelain`
wp post meta update $_3STXXX09440298 _product_image_gallery $_3STXXX09440298_0,$_3STXXX09440298_1,$_3STXXX09440298_2,$_3STXXX09440298_3,$_3STXXX09440298_4,$_3STXXX09440298_5,$_3STXXX09440298_6,$_3STXXX09440298_7,$_3STXXX09440298_8,$_3STXXX09440298_9,$_3STXXX09440298_10,$_3STXXX09440298_11
echo "Creating Variation: stripe-001"
_3ST00115790356=`wp post create --post_title="stripe-001" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298001 --porcelain`
echo "Setting meta for product: stripe-001 Variation: 001"
wp post meta update $_3ST00115790356 _visibility visible
wp post meta update $_3ST00115790356 attribute_edb_material 001
wp post meta update $_3ST00115790356 _stock 2
wp post meta update $_3ST00115790356 _stock_status instock
wp post meta update $_3ST00115790356 _manage_stock yes
wp post meta update $_3ST00115790356 _backorders yes
wp post meta update $_3ST00115790356 _price 350.00
wp post meta update $_3ST00115790356 _regular_price 350.00
wp post meta update $_3ST00115790356 _sku 3ST00115790356
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST00115790356 --featured_image=true
echo "Creating Variation: stripe-002"
_3ST002157a0357=`wp post create --post_title="stripe-002" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298002 --porcelain`
echo "Setting meta for product: stripe-002 Variation: 002"
wp post meta update $_3ST002157a0357 _visibility visible
wp post meta update $_3ST002157a0357 attribute_edb_material 002
wp post meta update $_3ST002157a0357 _stock 2
wp post meta update $_3ST002157a0357 _stock_status instock
wp post meta update $_3ST002157a0357 _manage_stock yes
wp post meta update $_3ST002157a0357 _backorders yes
wp post meta update $_3ST002157a0357 _price 350.00
wp post meta update $_3ST002157a0357 _regular_price 350.00
wp post meta update $_3ST002157a0357 _sku 3ST002157a0357
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST002157a0357 --featured_image=true
echo "Creating Variation: stripe-003"
_3ST003157b0358=`wp post create --post_title="stripe-003" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298003 --porcelain`
echo "Setting meta for product: stripe-003 Variation: 003"
wp post meta update $_3ST003157b0358 _visibility visible
wp post meta update $_3ST003157b0358 attribute_edb_material 003
wp post meta update $_3ST003157b0358 _stock 2
wp post meta update $_3ST003157b0358 _stock_status instock
wp post meta update $_3ST003157b0358 _manage_stock yes
wp post meta update $_3ST003157b0358 _backorders yes
wp post meta update $_3ST003157b0358 _price 350.00
wp post meta update $_3ST003157b0358 _regular_price 350.00
wp post meta update $_3ST003157b0358 _sku 3ST003157b0358
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST003157b0358 --featured_image=true
echo "Creating Variation: stripe-004"
_3ST004157c0359=`wp post create --post_title="stripe-004" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298004 --porcelain`
echo "Setting meta for product: stripe-004 Variation: 004"
wp post meta update $_3ST004157c0359 _visibility visible
wp post meta update $_3ST004157c0359 attribute_edb_material 004
wp post meta update $_3ST004157c0359 _stock 2
wp post meta update $_3ST004157c0359 _stock_status instock
wp post meta update $_3ST004157c0359 _manage_stock yes
wp post meta update $_3ST004157c0359 _backorders yes
wp post meta update $_3ST004157c0359 _price 350.00
wp post meta update $_3ST004157c0359 _regular_price 350.00
wp post meta update $_3ST004157c0359 _sku 3ST004157c0359
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST004157c0359 --featured_image=true
echo "Creating Variation: stripe-005"
_3ST005157d035a=`wp post create --post_title="stripe-005" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298005 --porcelain`
echo "Setting meta for product: stripe-005 Variation: 005"
wp post meta update $_3ST005157d035a _visibility visible
wp post meta update $_3ST005157d035a attribute_edb_material 005
wp post meta update $_3ST005157d035a _stock 2
wp post meta update $_3ST005157d035a _stock_status instock
wp post meta update $_3ST005157d035a _manage_stock yes
wp post meta update $_3ST005157d035a _backorders yes
wp post meta update $_3ST005157d035a _price 350.00
wp post meta update $_3ST005157d035a _regular_price 350.00
wp post meta update $_3ST005157d035a _sku 3ST005157d035a
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST005157d035a --featured_image=true
echo "Creating Variation: stripe-006"
_3ST006157e035b=`wp post create --post_title="stripe-006" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298006 --porcelain`
echo "Setting meta for product: stripe-006 Variation: 006"
wp post meta update $_3ST006157e035b _visibility visible
wp post meta update $_3ST006157e035b attribute_edb_material 006
wp post meta update $_3ST006157e035b _stock 2
wp post meta update $_3ST006157e035b _stock_status instock
wp post meta update $_3ST006157e035b _manage_stock yes
wp post meta update $_3ST006157e035b _backorders yes
wp post meta update $_3ST006157e035b _price 350.00
wp post meta update $_3ST006157e035b _regular_price 350.00
wp post meta update $_3ST006157e035b _sku 3ST006157e035b
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST006157e035b --featured_image=true
echo "Creating Variation: stripe-007"
_3ST007157f035c=`wp post create --post_title="stripe-007" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298007 --porcelain`
echo "Setting meta for product: stripe-007 Variation: 007"
wp post meta update $_3ST007157f035c _visibility visible
wp post meta update $_3ST007157f035c attribute_edb_material 007
wp post meta update $_3ST007157f035c _stock 2
wp post meta update $_3ST007157f035c _stock_status instock
wp post meta update $_3ST007157f035c _manage_stock yes
wp post meta update $_3ST007157f035c _backorders yes
wp post meta update $_3ST007157f035c _price 350.00
wp post meta update $_3ST007157f035c _regular_price 350.00
wp post meta update $_3ST007157f035c _sku 3ST007157f035c
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST007157f035c --featured_image=true
echo "Creating Variation: stripe-008"
_3ST0081580035d=`wp post create --post_title="stripe-008" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298008 --porcelain`
echo "Setting meta for product: stripe-008 Variation: 008"
wp post meta update $_3ST0081580035d _visibility visible
wp post meta update $_3ST0081580035d attribute_edb_material 008
wp post meta update $_3ST0081580035d _stock 2
wp post meta update $_3ST0081580035d _stock_status instock
wp post meta update $_3ST0081580035d _manage_stock yes
wp post meta update $_3ST0081580035d _backorders yes
wp post meta update $_3ST0081580035d _price 350.00
wp post meta update $_3ST0081580035d _regular_price 350.00
wp post meta update $_3ST0081580035d _sku 3ST0081580035d
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST0081580035d --featured_image=true
echo "Creating Variation: stripe-009"
_3ST0091581035e=`wp post create --post_title="stripe-009" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298009 --porcelain`
echo "Setting meta for product: stripe-009 Variation: 009"
wp post meta update $_3ST0091581035e _visibility visible
wp post meta update $_3ST0091581035e attribute_edb_material 009
wp post meta update $_3ST0091581035e _stock 2
wp post meta update $_3ST0091581035e _stock_status instock
wp post meta update $_3ST0091581035e _manage_stock yes
wp post meta update $_3ST0091581035e _backorders yes
wp post meta update $_3ST0091581035e _price 350.00
wp post meta update $_3ST0091581035e _regular_price 350.00
wp post meta update $_3ST0091581035e _sku 3ST0091581035e
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST0091581035e --featured_image=true
echo "Creating Variation: stripe-010"
_3ST010157a0356=`wp post create --post_title="stripe-010" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298010 --porcelain`
echo "Setting meta for product: stripe-010 Variation: 010"
wp post meta update $_3ST010157a0356 _visibility visible
wp post meta update $_3ST010157a0356 attribute_edb_material 010
wp post meta update $_3ST010157a0356 _stock 2
wp post meta update $_3ST010157a0356 _stock_status instock
wp post meta update $_3ST010157a0356 _manage_stock yes
wp post meta update $_3ST010157a0356 _backorders yes
wp post meta update $_3ST010157a0356 _price 350.00
wp post meta update $_3ST010157a0356 _regular_price 350.00
wp post meta update $_3ST010157a0356 _sku 3ST010157a0356
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST010157a0356 --featured_image=true
echo "Creating Variation: stripe-011"
_3ST011157b0357=`wp post create --post_title="stripe-011" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298011 --porcelain`
echo "Setting meta for product: stripe-011 Variation: 011"
wp post meta update $_3ST011157b0357 _visibility visible
wp post meta update $_3ST011157b0357 attribute_edb_material 011
wp post meta update $_3ST011157b0357 _stock 2
wp post meta update $_3ST011157b0357 _stock_status instock
wp post meta update $_3ST011157b0357 _manage_stock yes
wp post meta update $_3ST011157b0357 _backorders yes
wp post meta update $_3ST011157b0357 _price 350.00
wp post meta update $_3ST011157b0357 _regular_price 350.00
wp post meta update $_3ST011157b0357 _sku 3ST011157b0357
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST011157b0357 --featured_image=true
echo "Creating Variation: stripe-012"
_3ST012157c0358=`wp post create --post_title="stripe-012" --post_parent=$_3STXXX09440298 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=stripe_3stxxx09440298012 --porcelain`
echo "Setting meta for product: stripe-012 Variation: 012"
wp post meta update $_3ST012157c0358 _visibility visible
wp post meta update $_3ST012157c0358 attribute_edb_material 012
wp post meta update $_3ST012157c0358 _stock 2
wp post meta update $_3ST012157c0358 _stock_status instock
wp post meta update $_3ST012157c0358 _manage_stock yes
wp post meta update $_3ST012157c0358 _backorders yes
wp post meta update $_3ST012157c0358 _price 350.00
wp post meta update $_3ST012157c0358 _regular_price 350.00
wp post meta update $_3ST012157c0358 _sku 3ST012157c0358
wp media import ./data/products/03-stripes/gallery/stripes_sofa_0000_008_000.jpg --post_id=$_3ST012157c0358 --featured_image=true
echo "Creating Product: maritime"
_3STXXX0f1a0359=`wp post create --post_title="maritime" --menu_order=2 --post_name="maritime_3stxxx0f1a0359" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: maritime"
wp post meta update $_3STXXX0f1a0359 _subtitle "{:en}natural{:}{:fr}natural{:}"
wp post meta update $_3STXXX0f1a0359 _visibility visible
wp post meta update $_3STXXX0f1a0359 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3STXXX0f1a0359 _price 350.00
wp post meta update $_3STXXX0f1a0359 _regular_price 350.00
wp post term set $_3STXXX0f1a0359 product_shipping_class furniture
wp post term set $_3STXXX0f1a0359 product_cat sofas-3-seater
wp post term set $_3STXXX0f1a0359 product_type variable
wp post meta update $_3STXXX0f1a0359 _subtitle "{:en}natural{:}{:fr}natural{:}"
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3STXXX0f1a0359 --featured_image=true
_3STXXX0f1a0359_0=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_001.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_1=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0001_002.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_2=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0002_003.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_3=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0003_004.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_4=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0004_005.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_5=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0005_006.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_6=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0006_007.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_7=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_8=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0001_009.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_9=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0002_010.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_10=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0003_011.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_11=`wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0004_012.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
wp post meta update $_3STXXX0f1a0359 _product_image_gallery $_3STXXX0f1a0359_0,$_3STXXX0f1a0359_1,$_3STXXX0f1a0359_2,$_3STXXX0f1a0359_3,$_3STXXX0f1a0359_4,$_3STXXX0f1a0359_5,$_3STXXX0f1a0359_6,$_3STXXX0f1a0359_7,$_3STXXX0f1a0359_8,$_3STXXX0f1a0359_9,$_3STXXX0f1a0359_10,$_3STXXX0f1a0359_11
echo "Creating Variation: maritime-001"
_3ST0011e530417=`wp post create --post_title="maritime-001" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359001 --porcelain`
echo "Setting meta for product: maritime-001 Variation: 001"
wp post meta update $_3ST0011e530417 _visibility visible
wp post meta update $_3ST0011e530417 attribute_edb_material 001
wp post meta update $_3ST0011e530417 _stock 2
wp post meta update $_3ST0011e530417 _stock_status instock
wp post meta update $_3ST0011e530417 _manage_stock yes
wp post meta update $_3ST0011e530417 _backorders yes
wp post meta update $_3ST0011e530417 _price 350.00
wp post meta update $_3ST0011e530417 _regular_price 350.00
wp post meta update $_3ST0011e530417 _sku 3ST0011e530417
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0011e530417 --featured_image=true
echo "Creating Variation: maritime-002"
_3ST0021e540418=`wp post create --post_title="maritime-002" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359002 --porcelain`
echo "Setting meta for product: maritime-002 Variation: 002"
wp post meta update $_3ST0021e540418 _visibility visible
wp post meta update $_3ST0021e540418 attribute_edb_material 002
wp post meta update $_3ST0021e540418 _stock 2
wp post meta update $_3ST0021e540418 _stock_status instock
wp post meta update $_3ST0021e540418 _manage_stock yes
wp post meta update $_3ST0021e540418 _backorders yes
wp post meta update $_3ST0021e540418 _price 350.00
wp post meta update $_3ST0021e540418 _regular_price 350.00
wp post meta update $_3ST0021e540418 _sku 3ST0021e540418
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0021e540418 --featured_image=true
echo "Creating Variation: maritime-003"
_3ST0031e550419=`wp post create --post_title="maritime-003" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359003 --porcelain`
echo "Setting meta for product: maritime-003 Variation: 003"
wp post meta update $_3ST0031e550419 _visibility visible
wp post meta update $_3ST0031e550419 attribute_edb_material 003
wp post meta update $_3ST0031e550419 _stock 2
wp post meta update $_3ST0031e550419 _stock_status instock
wp post meta update $_3ST0031e550419 _manage_stock yes
wp post meta update $_3ST0031e550419 _backorders yes
wp post meta update $_3ST0031e550419 _price 350.00
wp post meta update $_3ST0031e550419 _regular_price 350.00
wp post meta update $_3ST0031e550419 _sku 3ST0031e550419
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0031e550419 --featured_image=true
echo "Creating Variation: maritime-004"
_3ST0041e56041a=`wp post create --post_title="maritime-004" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359004 --porcelain`
echo "Setting meta for product: maritime-004 Variation: 004"
wp post meta update $_3ST0041e56041a _visibility visible
wp post meta update $_3ST0041e56041a attribute_edb_material 004
wp post meta update $_3ST0041e56041a _stock 2
wp post meta update $_3ST0041e56041a _stock_status instock
wp post meta update $_3ST0041e56041a _manage_stock yes
wp post meta update $_3ST0041e56041a _backorders yes
wp post meta update $_3ST0041e56041a _price 350.00
wp post meta update $_3ST0041e56041a _regular_price 350.00
wp post meta update $_3ST0041e56041a _sku 3ST0041e56041a
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0041e56041a --featured_image=true
echo "Creating Variation: maritime-005"
_3ST0051e57041b=`wp post create --post_title="maritime-005" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359005 --porcelain`
echo "Setting meta for product: maritime-005 Variation: 005"
wp post meta update $_3ST0051e57041b _visibility visible
wp post meta update $_3ST0051e57041b attribute_edb_material 005
wp post meta update $_3ST0051e57041b _stock 2
wp post meta update $_3ST0051e57041b _stock_status instock
wp post meta update $_3ST0051e57041b _manage_stock yes
wp post meta update $_3ST0051e57041b _backorders yes
wp post meta update $_3ST0051e57041b _price 350.00
wp post meta update $_3ST0051e57041b _regular_price 350.00
wp post meta update $_3ST0051e57041b _sku 3ST0051e57041b
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0051e57041b --featured_image=true
echo "Creating Variation: maritime-006"
_3ST0061e58041c=`wp post create --post_title="maritime-006" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359006 --porcelain`
echo "Setting meta for product: maritime-006 Variation: 006"
wp post meta update $_3ST0061e58041c _visibility visible
wp post meta update $_3ST0061e58041c attribute_edb_material 006
wp post meta update $_3ST0061e58041c _stock 2
wp post meta update $_3ST0061e58041c _stock_status instock
wp post meta update $_3ST0061e58041c _manage_stock yes
wp post meta update $_3ST0061e58041c _backorders yes
wp post meta update $_3ST0061e58041c _price 350.00
wp post meta update $_3ST0061e58041c _regular_price 350.00
wp post meta update $_3ST0061e58041c _sku 3ST0061e58041c
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0061e58041c --featured_image=true
echo "Creating Variation: maritime-007"
_3ST0071e59041d=`wp post create --post_title="maritime-007" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359007 --porcelain`
echo "Setting meta for product: maritime-007 Variation: 007"
wp post meta update $_3ST0071e59041d _visibility visible
wp post meta update $_3ST0071e59041d attribute_edb_material 007
wp post meta update $_3ST0071e59041d _stock 2
wp post meta update $_3ST0071e59041d _stock_status instock
wp post meta update $_3ST0071e59041d _manage_stock yes
wp post meta update $_3ST0071e59041d _backorders yes
wp post meta update $_3ST0071e59041d _price 350.00
wp post meta update $_3ST0071e59041d _regular_price 350.00
wp post meta update $_3ST0071e59041d _sku 3ST0071e59041d
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0071e59041d --featured_image=true
echo "Creating Variation: maritime-008"
_3ST0081e5a041e=`wp post create --post_title="maritime-008" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359008 --porcelain`
echo "Setting meta for product: maritime-008 Variation: 008"
wp post meta update $_3ST0081e5a041e _visibility visible
wp post meta update $_3ST0081e5a041e attribute_edb_material 008
wp post meta update $_3ST0081e5a041e _stock 2
wp post meta update $_3ST0081e5a041e _stock_status instock
wp post meta update $_3ST0081e5a041e _manage_stock yes
wp post meta update $_3ST0081e5a041e _backorders yes
wp post meta update $_3ST0081e5a041e _price 350.00
wp post meta update $_3ST0081e5a041e _regular_price 350.00
wp post meta update $_3ST0081e5a041e _sku 3ST0081e5a041e
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0081e5a041e --featured_image=true
echo "Creating Variation: maritime-009"
_3ST0091e5b041f=`wp post create --post_title="maritime-009" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359009 --porcelain`
echo "Setting meta for product: maritime-009 Variation: 009"
wp post meta update $_3ST0091e5b041f _visibility visible
wp post meta update $_3ST0091e5b041f attribute_edb_material 009
wp post meta update $_3ST0091e5b041f _stock 2
wp post meta update $_3ST0091e5b041f _stock_status instock
wp post meta update $_3ST0091e5b041f _manage_stock yes
wp post meta update $_3ST0091e5b041f _backorders yes
wp post meta update $_3ST0091e5b041f _price 350.00
wp post meta update $_3ST0091e5b041f _regular_price 350.00
wp post meta update $_3ST0091e5b041f _sku 3ST0091e5b041f
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0091e5b041f --featured_image=true
echo "Creating Variation: maritime-010"
_3ST0101e540417=`wp post create --post_title="maritime-010" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359010 --porcelain`
echo "Setting meta for product: maritime-010 Variation: 010"
wp post meta update $_3ST0101e540417 _visibility visible
wp post meta update $_3ST0101e540417 attribute_edb_material 010
wp post meta update $_3ST0101e540417 _stock 2
wp post meta update $_3ST0101e540417 _stock_status instock
wp post meta update $_3ST0101e540417 _manage_stock yes
wp post meta update $_3ST0101e540417 _backorders yes
wp post meta update $_3ST0101e540417 _price 350.00
wp post meta update $_3ST0101e540417 _regular_price 350.00
wp post meta update $_3ST0101e540417 _sku 3ST0101e540417
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0101e540417 --featured_image=true
echo "Creating Variation: maritime-011"
_3ST0111e550418=`wp post create --post_title="maritime-011" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359011 --porcelain`
echo "Setting meta for product: maritime-011 Variation: 011"
wp post meta update $_3ST0111e550418 _visibility visible
wp post meta update $_3ST0111e550418 attribute_edb_material 011
wp post meta update $_3ST0111e550418 _stock 2
wp post meta update $_3ST0111e550418 _stock_status instock
wp post meta update $_3ST0111e550418 _manage_stock yes
wp post meta update $_3ST0111e550418 _backorders yes
wp post meta update $_3ST0111e550418 _price 350.00
wp post meta update $_3ST0111e550418 _regular_price 350.00
wp post meta update $_3ST0111e550418 _sku 3ST0111e550418
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0111e550418 --featured_image=true
echo "Creating Variation: maritime-012"
_3ST0121e560419=`wp post create --post_title="maritime-012" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359012 --porcelain`
echo "Setting meta for product: maritime-012 Variation: 012"
wp post meta update $_3ST0121e560419 _visibility visible
wp post meta update $_3ST0121e560419 attribute_edb_material 012
wp post meta update $_3ST0121e560419 _stock 2
wp post meta update $_3ST0121e560419 _stock_status instock
wp post meta update $_3ST0121e560419 _manage_stock yes
wp post meta update $_3ST0121e560419 _backorders yes
wp post meta update $_3ST0121e560419 _price 350.00
wp post meta update $_3ST0121e560419 _regular_price 350.00
wp post meta update $_3ST0121e560419 _sku 3ST0121e560419
wp media import ./data/products/02-maritime_natural/gallery/maritime_natural_0000_008_000.jpg --post_id=$_3ST0121e560419 --featured_image=true
echo "Creating Product: maritime"
_3STXXX0f1a0359=`wp post create --post_title="maritime" --menu_order=1 --post_name="maritime_3stxxx0f1a0359" --post_content='{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}' --post_type=product --post_status=publish --porcelain`
echo "Setting meta for: maritime"
wp post meta update $_3STXXX0f1a0359 _subtitle "{:en}walnut{:}{:fr}walnut{:}"
wp post meta update $_3STXXX0f1a0359 _visibility visible
wp post meta update $_3STXXX0f1a0359 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post meta update $_3STXXX0f1a0359 _price 350.00
wp post meta update $_3STXXX0f1a0359 _regular_price 350.00
wp post term set $_3STXXX0f1a0359 product_shipping_class furniture
wp post term set $_3STXXX0f1a0359 product_cat sofas-3-seater
wp post term set $_3STXXX0f1a0359 product_type variable
wp post meta update $_3STXXX0f1a0359 _subtitle "{:en}walnut{:}{:fr}walnut{:}"
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3STXXX0f1a0359 --featured_image=true
_3STXXX0f1a0359_0=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0000_maritime_walnut_001.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_1=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0001_maritime_walnut_002.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_2=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0002_maritime_walnut_003.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_3=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0003_maritime_walnut_004.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_4=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0004_maritime_walnut_005.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_5=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0005_maritime_walnut_006.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_6=`wp media import ./data/products/01-maritime_walnut/gallery/maritime_walnut_0006_maritime_walnut_007.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_7=`wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_8=`wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0001_maritime_walnut_009.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_9=`wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0002_maritime_walnut_010.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_10=`wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0003_maritime_walnut_011.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
_3STXXX0f1a0359_11=`wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0004_maritime_walnut_012.jpg --post_id=$_3STXXX0f1a0359 --porcelain`
wp post meta update $_3STXXX0f1a0359 _product_image_gallery $_3STXXX0f1a0359_0,$_3STXXX0f1a0359_1,$_3STXXX0f1a0359_2,$_3STXXX0f1a0359_3,$_3STXXX0f1a0359_4,$_3STXXX0f1a0359_5,$_3STXXX0f1a0359_6,$_3STXXX0f1a0359_7,$_3STXXX0f1a0359_8,$_3STXXX0f1a0359_9,$_3STXXX0f1a0359_10,$_3STXXX0f1a0359_11
echo "Creating Variation: maritime-001"
_3ST0011e530417=`wp post create --post_title="maritime-001" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359001 --porcelain`
echo "Setting meta for product: maritime-001 Variation: 001"
wp post meta update $_3ST0011e530417 _visibility visible
wp post meta update $_3ST0011e530417 attribute_edb_material 001
wp post meta update $_3ST0011e530417 _stock 2
wp post meta update $_3ST0011e530417 _stock_status instock
wp post meta update $_3ST0011e530417 _manage_stock yes
wp post meta update $_3ST0011e530417 _backorders yes
wp post meta update $_3ST0011e530417 _price 350.00
wp post meta update $_3ST0011e530417 _regular_price 350.00
wp post meta update $_3ST0011e530417 _sku 3ST0011e530417
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0011e530417 --featured_image=true
echo "Creating Variation: maritime-002"
_3ST0021e540418=`wp post create --post_title="maritime-002" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359002 --porcelain`
echo "Setting meta for product: maritime-002 Variation: 002"
wp post meta update $_3ST0021e540418 _visibility visible
wp post meta update $_3ST0021e540418 attribute_edb_material 002
wp post meta update $_3ST0021e540418 _stock 2
wp post meta update $_3ST0021e540418 _stock_status instock
wp post meta update $_3ST0021e540418 _manage_stock yes
wp post meta update $_3ST0021e540418 _backorders yes
wp post meta update $_3ST0021e540418 _price 350.00
wp post meta update $_3ST0021e540418 _regular_price 350.00
wp post meta update $_3ST0021e540418 _sku 3ST0021e540418
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0021e540418 --featured_image=true
echo "Creating Variation: maritime-003"
_3ST0031e550419=`wp post create --post_title="maritime-003" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359003 --porcelain`
echo "Setting meta for product: maritime-003 Variation: 003"
wp post meta update $_3ST0031e550419 _visibility visible
wp post meta update $_3ST0031e550419 attribute_edb_material 003
wp post meta update $_3ST0031e550419 _stock 2
wp post meta update $_3ST0031e550419 _stock_status instock
wp post meta update $_3ST0031e550419 _manage_stock yes
wp post meta update $_3ST0031e550419 _backorders yes
wp post meta update $_3ST0031e550419 _price 350.00
wp post meta update $_3ST0031e550419 _regular_price 350.00
wp post meta update $_3ST0031e550419 _sku 3ST0031e550419
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0031e550419 --featured_image=true
echo "Creating Variation: maritime-004"
_3ST0041e56041a=`wp post create --post_title="maritime-004" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359004 --porcelain`
echo "Setting meta for product: maritime-004 Variation: 004"
wp post meta update $_3ST0041e56041a _visibility visible
wp post meta update $_3ST0041e56041a attribute_edb_material 004
wp post meta update $_3ST0041e56041a _stock 2
wp post meta update $_3ST0041e56041a _stock_status instock
wp post meta update $_3ST0041e56041a _manage_stock yes
wp post meta update $_3ST0041e56041a _backorders yes
wp post meta update $_3ST0041e56041a _price 350.00
wp post meta update $_3ST0041e56041a _regular_price 350.00
wp post meta update $_3ST0041e56041a _sku 3ST0041e56041a
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0041e56041a --featured_image=true
echo "Creating Variation: maritime-005"
_3ST0051e57041b=`wp post create --post_title="maritime-005" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359005 --porcelain`
echo "Setting meta for product: maritime-005 Variation: 005"
wp post meta update $_3ST0051e57041b _visibility visible
wp post meta update $_3ST0051e57041b attribute_edb_material 005
wp post meta update $_3ST0051e57041b _stock 2
wp post meta update $_3ST0051e57041b _stock_status instock
wp post meta update $_3ST0051e57041b _manage_stock yes
wp post meta update $_3ST0051e57041b _backorders yes
wp post meta update $_3ST0051e57041b _price 350.00
wp post meta update $_3ST0051e57041b _regular_price 350.00
wp post meta update $_3ST0051e57041b _sku 3ST0051e57041b
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0051e57041b --featured_image=true
echo "Creating Variation: maritime-006"
_3ST0061e58041c=`wp post create --post_title="maritime-006" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359006 --porcelain`
echo "Setting meta for product: maritime-006 Variation: 006"
wp post meta update $_3ST0061e58041c _visibility visible
wp post meta update $_3ST0061e58041c attribute_edb_material 006
wp post meta update $_3ST0061e58041c _stock 2
wp post meta update $_3ST0061e58041c _stock_status instock
wp post meta update $_3ST0061e58041c _manage_stock yes
wp post meta update $_3ST0061e58041c _backorders yes
wp post meta update $_3ST0061e58041c _price 350.00
wp post meta update $_3ST0061e58041c _regular_price 350.00
wp post meta update $_3ST0061e58041c _sku 3ST0061e58041c
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0061e58041c --featured_image=true
echo "Creating Variation: maritime-007"
_3ST0071e59041d=`wp post create --post_title="maritime-007" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359007 --porcelain`
echo "Setting meta for product: maritime-007 Variation: 007"
wp post meta update $_3ST0071e59041d _visibility visible
wp post meta update $_3ST0071e59041d attribute_edb_material 007
wp post meta update $_3ST0071e59041d _stock 2
wp post meta update $_3ST0071e59041d _stock_status instock
wp post meta update $_3ST0071e59041d _manage_stock yes
wp post meta update $_3ST0071e59041d _backorders yes
wp post meta update $_3ST0071e59041d _price 350.00
wp post meta update $_3ST0071e59041d _regular_price 350.00
wp post meta update $_3ST0071e59041d _sku 3ST0071e59041d
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0071e59041d --featured_image=true
echo "Creating Variation: maritime-008"
_3ST0081e5a041e=`wp post create --post_title="maritime-008" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359008 --porcelain`
echo "Setting meta for product: maritime-008 Variation: 008"
wp post meta update $_3ST0081e5a041e _visibility visible
wp post meta update $_3ST0081e5a041e attribute_edb_material 008
wp post meta update $_3ST0081e5a041e _stock 2
wp post meta update $_3ST0081e5a041e _stock_status instock
wp post meta update $_3ST0081e5a041e _manage_stock yes
wp post meta update $_3ST0081e5a041e _backorders yes
wp post meta update $_3ST0081e5a041e _price 350.00
wp post meta update $_3ST0081e5a041e _regular_price 350.00
wp post meta update $_3ST0081e5a041e _sku 3ST0081e5a041e
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0081e5a041e --featured_image=true
echo "Creating Variation: maritime-009"
_3ST0091e5b041f=`wp post create --post_title="maritime-009" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359009 --porcelain`
echo "Setting meta for product: maritime-009 Variation: 009"
wp post meta update $_3ST0091e5b041f _visibility visible
wp post meta update $_3ST0091e5b041f attribute_edb_material 009
wp post meta update $_3ST0091e5b041f _stock 2
wp post meta update $_3ST0091e5b041f _stock_status instock
wp post meta update $_3ST0091e5b041f _manage_stock yes
wp post meta update $_3ST0091e5b041f _backorders yes
wp post meta update $_3ST0091e5b041f _price 350.00
wp post meta update $_3ST0091e5b041f _regular_price 350.00
wp post meta update $_3ST0091e5b041f _sku 3ST0091e5b041f
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0091e5b041f --featured_image=true
echo "Creating Variation: maritime-010"
_3ST0101e540417=`wp post create --post_title="maritime-010" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359010 --porcelain`
echo "Setting meta for product: maritime-010 Variation: 010"
wp post meta update $_3ST0101e540417 _visibility visible
wp post meta update $_3ST0101e540417 attribute_edb_material 010
wp post meta update $_3ST0101e540417 _stock 2
wp post meta update $_3ST0101e540417 _stock_status instock
wp post meta update $_3ST0101e540417 _manage_stock yes
wp post meta update $_3ST0101e540417 _backorders yes
wp post meta update $_3ST0101e540417 _price 350.00
wp post meta update $_3ST0101e540417 _regular_price 350.00
wp post meta update $_3ST0101e540417 _sku 3ST0101e540417
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0101e540417 --featured_image=true
echo "Creating Variation: maritime-011"
_3ST0111e550418=`wp post create --post_title="maritime-011" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359011 --porcelain`
echo "Setting meta for product: maritime-011 Variation: 011"
wp post meta update $_3ST0111e550418 _visibility visible
wp post meta update $_3ST0111e550418 attribute_edb_material 011
wp post meta update $_3ST0111e550418 _stock 2
wp post meta update $_3ST0111e550418 _stock_status instock
wp post meta update $_3ST0111e550418 _manage_stock yes
wp post meta update $_3ST0111e550418 _backorders yes
wp post meta update $_3ST0111e550418 _price 350.00
wp post meta update $_3ST0111e550418 _regular_price 350.00
wp post meta update $_3ST0111e550418 _sku 3ST0111e550418
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0111e550418 --featured_image=true
echo "Creating Variation: maritime-012"
_3ST0121e560419=`wp post create --post_title="maritime-012" --post_parent=$_3STXXX0f1a0359 --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name=maritime_3stxxx0f1a0359012 --porcelain`
echo "Setting meta for product: maritime-012 Variation: 012"
wp post meta update $_3ST0121e560419 _visibility visible
wp post meta update $_3ST0121e560419 attribute_edb_material 012
wp post meta update $_3ST0121e560419 _stock 2
wp post meta update $_3ST0121e560419 _stock_status instock
wp post meta update $_3ST0121e560419 _manage_stock yes
wp post meta update $_3ST0121e560419 _backorders yes
wp post meta update $_3ST0121e560419 _price 350.00
wp post meta update $_3ST0121e560419 _regular_price 350.00
wp post meta update $_3ST0121e560419 _sku 3ST0121e560419
wp media import ./data/products/01-maritime_walnut/gallery/maritme_walnut_0000_maritime_walnut_008_000.jpg --post_id=$_3ST0121e560419 --featured_image=true