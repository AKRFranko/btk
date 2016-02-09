_2_seater_product_0=`wp post create ./post-content.txt --post_title="2-seater" --post_type=product --post_status=publish --post_name=2_seater --porcelain`
wp post meta update $_2_seater_product_0 _visibility visible
wp post meta update $_2_seater_product_0 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_2_seater_product_0 product_shipping_class furniture
wp post term set $_2_seater_product_0 product_cat 2-seater
wp post term set $_2_seater_product_0 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_2_seater_product_0 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_2_seater_product_0 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_2_seater_product_0 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_2_seater_product_0 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_2_seater_product_0 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_2_seater_product_0 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_2_seater_product_0 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_2_seater_product_0 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_2_seater_product_0 
_2_seater_product_0_001=`wp post create ./post-content.txt --post_title="2-seater 001" --post_type=product_variation --post_status=publish --post_name=2_seater_001 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_001 _visibility visible
wp post meta update $_2_seater_product_0_001 attribute_edb_material 001
wp post meta update $_2_seater_product_0_001 _stock 2
wp post meta update $_2_seater_product_0_001 _stock_status instock
wp post meta update $_2_seater_product_0_001 _manage_stock yes
wp post meta update $_2_seater_product_0_001 _backorders yes
wp post meta update $_2_seater_product_0_001 _price 350.00
wp post meta update $_2_seater_product_0_001 _regular_price 350.00
wp post meta update $_2_seater_product_0_001 _sku SO2-001-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_2_seater_product_0_001 --featured_image=true
_2_seater_product_0_002=`wp post create ./post-content.txt --post_title="2-seater 002" --post_type=product_variation --post_status=publish --post_name=2_seater_002 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_002 _visibility visible
wp post meta update $_2_seater_product_0_002 attribute_edb_material 002
wp post meta update $_2_seater_product_0_002 _stock 2
wp post meta update $_2_seater_product_0_002 _stock_status instock
wp post meta update $_2_seater_product_0_002 _manage_stock yes
wp post meta update $_2_seater_product_0_002 _backorders yes
wp post meta update $_2_seater_product_0_002 _price 350.00
wp post meta update $_2_seater_product_0_002 _regular_price 350.00
wp post meta update $_2_seater_product_0_002 _sku SO2-002-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_2_seater_product_0_002 --featured_image=true
_2_seater_product_0_003=`wp post create ./post-content.txt --post_title="2-seater 003" --post_type=product_variation --post_status=publish --post_name=2_seater_003 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_003 _visibility visible
wp post meta update $_2_seater_product_0_003 attribute_edb_material 003
wp post meta update $_2_seater_product_0_003 _stock 2
wp post meta update $_2_seater_product_0_003 _stock_status instock
wp post meta update $_2_seater_product_0_003 _manage_stock yes
wp post meta update $_2_seater_product_0_003 _backorders yes
wp post meta update $_2_seater_product_0_003 _price 350.00
wp post meta update $_2_seater_product_0_003 _regular_price 350.00
wp post meta update $_2_seater_product_0_003 _sku SO2-003-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_2_seater_product_0_003 --featured_image=true
_2_seater_product_0_004=`wp post create ./post-content.txt --post_title="2-seater 004" --post_type=product_variation --post_status=publish --post_name=2_seater_004 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_004 _visibility visible
wp post meta update $_2_seater_product_0_004 attribute_edb_material 004
wp post meta update $_2_seater_product_0_004 _stock 2
wp post meta update $_2_seater_product_0_004 _stock_status instock
wp post meta update $_2_seater_product_0_004 _manage_stock yes
wp post meta update $_2_seater_product_0_004 _backorders yes
wp post meta update $_2_seater_product_0_004 _price 350.00
wp post meta update $_2_seater_product_0_004 _regular_price 350.00
wp post meta update $_2_seater_product_0_004 _sku SO2-004-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_2_seater_product_0_004 --featured_image=true
_2_seater_product_0_005=`wp post create ./post-content.txt --post_title="2-seater 005" --post_type=product_variation --post_status=publish --post_name=2_seater_005 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_005 _visibility visible
wp post meta update $_2_seater_product_0_005 attribute_edb_material 005
wp post meta update $_2_seater_product_0_005 _stock 2
wp post meta update $_2_seater_product_0_005 _stock_status instock
wp post meta update $_2_seater_product_0_005 _manage_stock yes
wp post meta update $_2_seater_product_0_005 _backorders yes
wp post meta update $_2_seater_product_0_005 _price 350.00
wp post meta update $_2_seater_product_0_005 _regular_price 350.00
wp post meta update $_2_seater_product_0_005 _sku SO2-005-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_2_seater_product_0_005 --featured_image=true
_2_seater_product_0_006=`wp post create ./post-content.txt --post_title="2-seater 006" --post_type=product_variation --post_status=publish --post_name=2_seater_006 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_006 _visibility visible
wp post meta update $_2_seater_product_0_006 attribute_edb_material 006
wp post meta update $_2_seater_product_0_006 _stock 2
wp post meta update $_2_seater_product_0_006 _stock_status instock
wp post meta update $_2_seater_product_0_006 _manage_stock yes
wp post meta update $_2_seater_product_0_006 _backorders yes
wp post meta update $_2_seater_product_0_006 _price 350.00
wp post meta update $_2_seater_product_0_006 _regular_price 350.00
wp post meta update $_2_seater_product_0_006 _sku SO2-006-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_2_seater_product_0_006 --featured_image=true
_2_seater_product_0_007=`wp post create ./post-content.txt --post_title="2-seater 007" --post_type=product_variation --post_status=publish --post_name=2_seater_007 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_007 _visibility visible
wp post meta update $_2_seater_product_0_007 attribute_edb_material 007
wp post meta update $_2_seater_product_0_007 _stock 2
wp post meta update $_2_seater_product_0_007 _stock_status instock
wp post meta update $_2_seater_product_0_007 _manage_stock yes
wp post meta update $_2_seater_product_0_007 _backorders yes
wp post meta update $_2_seater_product_0_007 _price 350.00
wp post meta update $_2_seater_product_0_007 _regular_price 350.00
wp post meta update $_2_seater_product_0_007 _sku SO2-007-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_007.jpg --post_id=$_2_seater_product_0_007 --featured_image=true
_2_seater_product_0_008=`wp post create ./post-content.txt --post_title="2-seater 008" --post_type=product_variation --post_status=publish --post_name=2_seater_008 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_008 _visibility visible
wp post meta update $_2_seater_product_0_008 attribute_edb_material 008
wp post meta update $_2_seater_product_0_008 _stock 2
wp post meta update $_2_seater_product_0_008 _stock_status instock
wp post meta update $_2_seater_product_0_008 _manage_stock yes
wp post meta update $_2_seater_product_0_008 _backorders yes
wp post meta update $_2_seater_product_0_008 _price 350.00
wp post meta update $_2_seater_product_0_008 _regular_price 350.00
wp post meta update $_2_seater_product_0_008 _sku SO2-008-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_008.jpg --post_id=$_2_seater_product_0_008 --featured_image=true
_2_seater_product_0_009=`wp post create ./post-content.txt --post_title="2-seater 009" --post_type=product_variation --post_status=publish --post_name=2_seater_009 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_009 _visibility visible
wp post meta update $_2_seater_product_0_009 attribute_edb_material 009
wp post meta update $_2_seater_product_0_009 _stock 2
wp post meta update $_2_seater_product_0_009 _stock_status instock
wp post meta update $_2_seater_product_0_009 _manage_stock yes
wp post meta update $_2_seater_product_0_009 _backorders yes
wp post meta update $_2_seater_product_0_009 _price 350.00
wp post meta update $_2_seater_product_0_009 _regular_price 350.00
wp post meta update $_2_seater_product_0_009 _sku SO2-009-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_009.jpg --post_id=$_2_seater_product_0_009 --featured_image=true
_2_seater_product_0_010=`wp post create ./post-content.txt --post_title="2-seater 010" --post_type=product_variation --post_status=publish --post_name=2_seater_010 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_010 _visibility visible
wp post meta update $_2_seater_product_0_010 attribute_edb_material 010
wp post meta update $_2_seater_product_0_010 _stock 2
wp post meta update $_2_seater_product_0_010 _stock_status instock
wp post meta update $_2_seater_product_0_010 _manage_stock yes
wp post meta update $_2_seater_product_0_010 _backorders yes
wp post meta update $_2_seater_product_0_010 _price 350.00
wp post meta update $_2_seater_product_0_010 _regular_price 350.00
wp post meta update $_2_seater_product_0_010 _sku SO2-010-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_010.jpg --post_id=$_2_seater_product_0_010 --featured_image=true
_2_seater_product_0_011=`wp post create ./post-content.txt --post_title="2-seater 011" --post_type=product_variation --post_status=publish --post_name=2_seater_011 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_011 _visibility visible
wp post meta update $_2_seater_product_0_011 attribute_edb_material 011
wp post meta update $_2_seater_product_0_011 _stock 2
wp post meta update $_2_seater_product_0_011 _stock_status instock
wp post meta update $_2_seater_product_0_011 _manage_stock yes
wp post meta update $_2_seater_product_0_011 _backorders yes
wp post meta update $_2_seater_product_0_011 _price 350.00
wp post meta update $_2_seater_product_0_011 _regular_price 350.00
wp post meta update $_2_seater_product_0_011 _sku SO2-011-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_011.jpg --post_id=$_2_seater_product_0_011 --featured_image=true
_2_seater_product_0_012=`wp post create ./post-content.txt --post_title="2-seater 012" --post_type=product_variation --post_status=publish --post_name=2_seater_012 --post_parent="$_2_seater_product_0"  --porcelain`
wp post meta update $_2_seater_product_0_012 _visibility visible
wp post meta update $_2_seater_product_0_012 attribute_edb_material 012
wp post meta update $_2_seater_product_0_012 _stock 2
wp post meta update $_2_seater_product_0_012 _stock_status instock
wp post meta update $_2_seater_product_0_012 _manage_stock yes
wp post meta update $_2_seater_product_0_012 _backorders yes
wp post meta update $_2_seater_product_0_012 _price 350.00
wp post meta update $_2_seater_product_0_012 _regular_price 350.00
wp post meta update $_2_seater_product_0_012 _sku SO2-012-0
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_012.jpg --post_id=$_2_seater_product_0_012 --featured_image=true
_3_seater_product_1=`wp post create ./post-content.txt --post_title="3-seater" --post_type=product --post_status=publish --post_name=3_seater --porcelain`
wp post meta update $_3_seater_product_1 _visibility visible
wp post meta update $_3_seater_product_1 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_3_seater_product_1 product_shipping_class furniture
wp post term set $_3_seater_product_1 product_cat 3-seater
wp post term set $_3_seater_product_1 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_3_seater_product_1 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_3_seater_product_1 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_3_seater_product_1 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_3_seater_product_1 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_3_seater_product_1 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_3_seater_product_1 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_3_seater_product_1 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_3_seater_product_1 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_3_seater_product_1 
_3_seater_product_1_001=`wp post create ./post-content.txt --post_title="3-seater 001" --post_type=product_variation --post_status=publish --post_name=3_seater_001 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_001 _visibility visible
wp post meta update $_3_seater_product_1_001 attribute_edb_material 001
wp post meta update $_3_seater_product_1_001 _stock 2
wp post meta update $_3_seater_product_1_001 _stock_status instock
wp post meta update $_3_seater_product_1_001 _manage_stock yes
wp post meta update $_3_seater_product_1_001 _backorders yes
wp post meta update $_3_seater_product_1_001 _price 350.00
wp post meta update $_3_seater_product_1_001 _regular_price 350.00
wp post meta update $_3_seater_product_1_001 _sku SO3-001-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_3_seater_product_1_001 --featured_image=true
_3_seater_product_1_002=`wp post create ./post-content.txt --post_title="3-seater 002" --post_type=product_variation --post_status=publish --post_name=3_seater_002 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_002 _visibility visible
wp post meta update $_3_seater_product_1_002 attribute_edb_material 002
wp post meta update $_3_seater_product_1_002 _stock 2
wp post meta update $_3_seater_product_1_002 _stock_status instock
wp post meta update $_3_seater_product_1_002 _manage_stock yes
wp post meta update $_3_seater_product_1_002 _backorders yes
wp post meta update $_3_seater_product_1_002 _price 350.00
wp post meta update $_3_seater_product_1_002 _regular_price 350.00
wp post meta update $_3_seater_product_1_002 _sku SO3-002-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_3_seater_product_1_002 --featured_image=true
_3_seater_product_1_003=`wp post create ./post-content.txt --post_title="3-seater 003" --post_type=product_variation --post_status=publish --post_name=3_seater_003 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_003 _visibility visible
wp post meta update $_3_seater_product_1_003 attribute_edb_material 003
wp post meta update $_3_seater_product_1_003 _stock 2
wp post meta update $_3_seater_product_1_003 _stock_status instock
wp post meta update $_3_seater_product_1_003 _manage_stock yes
wp post meta update $_3_seater_product_1_003 _backorders yes
wp post meta update $_3_seater_product_1_003 _price 350.00
wp post meta update $_3_seater_product_1_003 _regular_price 350.00
wp post meta update $_3_seater_product_1_003 _sku SO3-003-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_3_seater_product_1_003 --featured_image=true
_3_seater_product_1_004=`wp post create ./post-content.txt --post_title="3-seater 004" --post_type=product_variation --post_status=publish --post_name=3_seater_004 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_004 _visibility visible
wp post meta update $_3_seater_product_1_004 attribute_edb_material 004
wp post meta update $_3_seater_product_1_004 _stock 2
wp post meta update $_3_seater_product_1_004 _stock_status instock
wp post meta update $_3_seater_product_1_004 _manage_stock yes
wp post meta update $_3_seater_product_1_004 _backorders yes
wp post meta update $_3_seater_product_1_004 _price 350.00
wp post meta update $_3_seater_product_1_004 _regular_price 350.00
wp post meta update $_3_seater_product_1_004 _sku SO3-004-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_3_seater_product_1_004 --featured_image=true
_3_seater_product_1_005=`wp post create ./post-content.txt --post_title="3-seater 005" --post_type=product_variation --post_status=publish --post_name=3_seater_005 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_005 _visibility visible
wp post meta update $_3_seater_product_1_005 attribute_edb_material 005
wp post meta update $_3_seater_product_1_005 _stock 2
wp post meta update $_3_seater_product_1_005 _stock_status instock
wp post meta update $_3_seater_product_1_005 _manage_stock yes
wp post meta update $_3_seater_product_1_005 _backorders yes
wp post meta update $_3_seater_product_1_005 _price 350.00
wp post meta update $_3_seater_product_1_005 _regular_price 350.00
wp post meta update $_3_seater_product_1_005 _sku SO3-005-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_3_seater_product_1_005 --featured_image=true
_3_seater_product_1_006=`wp post create ./post-content.txt --post_title="3-seater 006" --post_type=product_variation --post_status=publish --post_name=3_seater_006 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_006 _visibility visible
wp post meta update $_3_seater_product_1_006 attribute_edb_material 006
wp post meta update $_3_seater_product_1_006 _stock 2
wp post meta update $_3_seater_product_1_006 _stock_status instock
wp post meta update $_3_seater_product_1_006 _manage_stock yes
wp post meta update $_3_seater_product_1_006 _backorders yes
wp post meta update $_3_seater_product_1_006 _price 350.00
wp post meta update $_3_seater_product_1_006 _regular_price 350.00
wp post meta update $_3_seater_product_1_006 _sku SO3-006-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_3_seater_product_1_006 --featured_image=true
_3_seater_product_1_007=`wp post create ./post-content.txt --post_title="3-seater 007" --post_type=product_variation --post_status=publish --post_name=3_seater_007 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_007 _visibility visible
wp post meta update $_3_seater_product_1_007 attribute_edb_material 007
wp post meta update $_3_seater_product_1_007 _stock 2
wp post meta update $_3_seater_product_1_007 _stock_status instock
wp post meta update $_3_seater_product_1_007 _manage_stock yes
wp post meta update $_3_seater_product_1_007 _backorders yes
wp post meta update $_3_seater_product_1_007 _price 350.00
wp post meta update $_3_seater_product_1_007 _regular_price 350.00
wp post meta update $_3_seater_product_1_007 _sku SO3-007-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_007.jpg --post_id=$_3_seater_product_1_007 --featured_image=true
_3_seater_product_1_008=`wp post create ./post-content.txt --post_title="3-seater 008" --post_type=product_variation --post_status=publish --post_name=3_seater_008 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_008 _visibility visible
wp post meta update $_3_seater_product_1_008 attribute_edb_material 008
wp post meta update $_3_seater_product_1_008 _stock 2
wp post meta update $_3_seater_product_1_008 _stock_status instock
wp post meta update $_3_seater_product_1_008 _manage_stock yes
wp post meta update $_3_seater_product_1_008 _backorders yes
wp post meta update $_3_seater_product_1_008 _price 350.00
wp post meta update $_3_seater_product_1_008 _regular_price 350.00
wp post meta update $_3_seater_product_1_008 _sku SO3-008-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_008.jpg --post_id=$_3_seater_product_1_008 --featured_image=true
_3_seater_product_1_009=`wp post create ./post-content.txt --post_title="3-seater 009" --post_type=product_variation --post_status=publish --post_name=3_seater_009 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_009 _visibility visible
wp post meta update $_3_seater_product_1_009 attribute_edb_material 009
wp post meta update $_3_seater_product_1_009 _stock 2
wp post meta update $_3_seater_product_1_009 _stock_status instock
wp post meta update $_3_seater_product_1_009 _manage_stock yes
wp post meta update $_3_seater_product_1_009 _backorders yes
wp post meta update $_3_seater_product_1_009 _price 350.00
wp post meta update $_3_seater_product_1_009 _regular_price 350.00
wp post meta update $_3_seater_product_1_009 _sku SO3-009-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_009.jpg --post_id=$_3_seater_product_1_009 --featured_image=true
_3_seater_product_1_010=`wp post create ./post-content.txt --post_title="3-seater 010" --post_type=product_variation --post_status=publish --post_name=3_seater_010 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_010 _visibility visible
wp post meta update $_3_seater_product_1_010 attribute_edb_material 010
wp post meta update $_3_seater_product_1_010 _stock 2
wp post meta update $_3_seater_product_1_010 _stock_status instock
wp post meta update $_3_seater_product_1_010 _manage_stock yes
wp post meta update $_3_seater_product_1_010 _backorders yes
wp post meta update $_3_seater_product_1_010 _price 350.00
wp post meta update $_3_seater_product_1_010 _regular_price 350.00
wp post meta update $_3_seater_product_1_010 _sku SO3-010-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_010.jpg --post_id=$_3_seater_product_1_010 --featured_image=true
_3_seater_product_1_011=`wp post create ./post-content.txt --post_title="3-seater 011" --post_type=product_variation --post_status=publish --post_name=3_seater_011 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_011 _visibility visible
wp post meta update $_3_seater_product_1_011 attribute_edb_material 011
wp post meta update $_3_seater_product_1_011 _stock 2
wp post meta update $_3_seater_product_1_011 _stock_status instock
wp post meta update $_3_seater_product_1_011 _manage_stock yes
wp post meta update $_3_seater_product_1_011 _backorders yes
wp post meta update $_3_seater_product_1_011 _price 350.00
wp post meta update $_3_seater_product_1_011 _regular_price 350.00
wp post meta update $_3_seater_product_1_011 _sku SO3-011-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_011.jpg --post_id=$_3_seater_product_1_011 --featured_image=true
_3_seater_product_1_012=`wp post create ./post-content.txt --post_title="3-seater 012" --post_type=product_variation --post_status=publish --post_name=3_seater_012 --post_parent="$_3_seater_product_1"  --porcelain`
wp post meta update $_3_seater_product_1_012 _visibility visible
wp post meta update $_3_seater_product_1_012 attribute_edb_material 012
wp post meta update $_3_seater_product_1_012 _stock 2
wp post meta update $_3_seater_product_1_012 _stock_status instock
wp post meta update $_3_seater_product_1_012 _manage_stock yes
wp post meta update $_3_seater_product_1_012 _backorders yes
wp post meta update $_3_seater_product_1_012 _price 350.00
wp post meta update $_3_seater_product_1_012 _regular_price 350.00
wp post meta update $_3_seater_product_1_012 _sku SO3-012-1
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_012.jpg --post_id=$_3_seater_product_1_012 --featured_image=true
_sofa_beds_product_2=`wp post create ./post-content.txt --post_title="sofa-bed" --post_type=product --post_status=publish --post_name=sofa_bed --porcelain`
wp post meta update $_sofa_beds_product_2 _visibility visible
wp post meta update $_sofa_beds_product_2 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_sofa_beds_product_2 product_shipping_class furniture
wp post term set $_sofa_beds_product_2 product_cat sofa-beds
wp post term set $_sofa_beds_product_2 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_sofa_beds_product_2 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_sofa_beds_product_2 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_sofa_beds_product_2 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_sofa_beds_product_2 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_sofa_beds_product_2 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_sofa_beds_product_2 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_sofa_beds_product_2 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_sofa_beds_product_2 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_sofa_beds_product_2 
_sofa_beds_product_2_001=`wp post create ./post-content.txt --post_title="sofa-beds 001" --post_type=product_variation --post_status=publish --post_name=sofa_bed_001 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_001 _visibility visible
wp post meta update $_sofa_beds_product_2_001 attribute_edb_material 001
wp post meta update $_sofa_beds_product_2_001 _stock 2
wp post meta update $_sofa_beds_product_2_001 _stock_status instock
wp post meta update $_sofa_beds_product_2_001 _manage_stock yes
wp post meta update $_sofa_beds_product_2_001 _backorders yes
wp post meta update $_sofa_beds_product_2_001 _price 350.00
wp post meta update $_sofa_beds_product_2_001 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_001 _sku SOF-001-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_sofa_beds_product_2_001 --featured_image=true
_sofa_beds_product_2_002=`wp post create ./post-content.txt --post_title="sofa-beds 002" --post_type=product_variation --post_status=publish --post_name=sofa_bed_002 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_002 _visibility visible
wp post meta update $_sofa_beds_product_2_002 attribute_edb_material 002
wp post meta update $_sofa_beds_product_2_002 _stock 2
wp post meta update $_sofa_beds_product_2_002 _stock_status instock
wp post meta update $_sofa_beds_product_2_002 _manage_stock yes
wp post meta update $_sofa_beds_product_2_002 _backorders yes
wp post meta update $_sofa_beds_product_2_002 _price 350.00
wp post meta update $_sofa_beds_product_2_002 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_002 _sku SOF-002-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_sofa_beds_product_2_002 --featured_image=true
_sofa_beds_product_2_003=`wp post create ./post-content.txt --post_title="sofa-beds 003" --post_type=product_variation --post_status=publish --post_name=sofa_bed_003 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_003 _visibility visible
wp post meta update $_sofa_beds_product_2_003 attribute_edb_material 003
wp post meta update $_sofa_beds_product_2_003 _stock 2
wp post meta update $_sofa_beds_product_2_003 _stock_status instock
wp post meta update $_sofa_beds_product_2_003 _manage_stock yes
wp post meta update $_sofa_beds_product_2_003 _backorders yes
wp post meta update $_sofa_beds_product_2_003 _price 350.00
wp post meta update $_sofa_beds_product_2_003 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_003 _sku SOF-003-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_sofa_beds_product_2_003 --featured_image=true
_sofa_beds_product_2_004=`wp post create ./post-content.txt --post_title="sofa-beds 004" --post_type=product_variation --post_status=publish --post_name=sofa_bed_004 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_004 _visibility visible
wp post meta update $_sofa_beds_product_2_004 attribute_edb_material 004
wp post meta update $_sofa_beds_product_2_004 _stock 2
wp post meta update $_sofa_beds_product_2_004 _stock_status instock
wp post meta update $_sofa_beds_product_2_004 _manage_stock yes
wp post meta update $_sofa_beds_product_2_004 _backorders yes
wp post meta update $_sofa_beds_product_2_004 _price 350.00
wp post meta update $_sofa_beds_product_2_004 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_004 _sku SOF-004-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_sofa_beds_product_2_004 --featured_image=true
_sofa_beds_product_2_005=`wp post create ./post-content.txt --post_title="sofa-beds 005" --post_type=product_variation --post_status=publish --post_name=sofa_bed_005 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_005 _visibility visible
wp post meta update $_sofa_beds_product_2_005 attribute_edb_material 005
wp post meta update $_sofa_beds_product_2_005 _stock 2
wp post meta update $_sofa_beds_product_2_005 _stock_status instock
wp post meta update $_sofa_beds_product_2_005 _manage_stock yes
wp post meta update $_sofa_beds_product_2_005 _backorders yes
wp post meta update $_sofa_beds_product_2_005 _price 350.00
wp post meta update $_sofa_beds_product_2_005 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_005 _sku SOF-005-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_sofa_beds_product_2_005 --featured_image=true
_sofa_beds_product_2_006=`wp post create ./post-content.txt --post_title="sofa-beds 006" --post_type=product_variation --post_status=publish --post_name=sofa_bed_006 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_006 _visibility visible
wp post meta update $_sofa_beds_product_2_006 attribute_edb_material 006
wp post meta update $_sofa_beds_product_2_006 _stock 2
wp post meta update $_sofa_beds_product_2_006 _stock_status instock
wp post meta update $_sofa_beds_product_2_006 _manage_stock yes
wp post meta update $_sofa_beds_product_2_006 _backorders yes
wp post meta update $_sofa_beds_product_2_006 _price 350.00
wp post meta update $_sofa_beds_product_2_006 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_006 _sku SOF-006-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_sofa_beds_product_2_006 --featured_image=true
_sofa_beds_product_2_007=`wp post create ./post-content.txt --post_title="sofa-beds 007" --post_type=product_variation --post_status=publish --post_name=sofa_bed_007 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_007 _visibility visible
wp post meta update $_sofa_beds_product_2_007 attribute_edb_material 007
wp post meta update $_sofa_beds_product_2_007 _stock 2
wp post meta update $_sofa_beds_product_2_007 _stock_status instock
wp post meta update $_sofa_beds_product_2_007 _manage_stock yes
wp post meta update $_sofa_beds_product_2_007 _backorders yes
wp post meta update $_sofa_beds_product_2_007 _price 350.00
wp post meta update $_sofa_beds_product_2_007 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_007 _sku SOF-007-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_007.jpg --post_id=$_sofa_beds_product_2_007 --featured_image=true
_sofa_beds_product_2_008=`wp post create ./post-content.txt --post_title="sofa-beds 008" --post_type=product_variation --post_status=publish --post_name=sofa_bed_008 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_008 _visibility visible
wp post meta update $_sofa_beds_product_2_008 attribute_edb_material 008
wp post meta update $_sofa_beds_product_2_008 _stock 2
wp post meta update $_sofa_beds_product_2_008 _stock_status instock
wp post meta update $_sofa_beds_product_2_008 _manage_stock yes
wp post meta update $_sofa_beds_product_2_008 _backorders yes
wp post meta update $_sofa_beds_product_2_008 _price 350.00
wp post meta update $_sofa_beds_product_2_008 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_008 _sku SOF-008-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_008.jpg --post_id=$_sofa_beds_product_2_008 --featured_image=true
_sofa_beds_product_2_009=`wp post create ./post-content.txt --post_title="sofa-beds 009" --post_type=product_variation --post_status=publish --post_name=sofa_bed_009 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_009 _visibility visible
wp post meta update $_sofa_beds_product_2_009 attribute_edb_material 009
wp post meta update $_sofa_beds_product_2_009 _stock 2
wp post meta update $_sofa_beds_product_2_009 _stock_status instock
wp post meta update $_sofa_beds_product_2_009 _manage_stock yes
wp post meta update $_sofa_beds_product_2_009 _backorders yes
wp post meta update $_sofa_beds_product_2_009 _price 350.00
wp post meta update $_sofa_beds_product_2_009 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_009 _sku SOF-009-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_009.jpg --post_id=$_sofa_beds_product_2_009 --featured_image=true
_sofa_beds_product_2_010=`wp post create ./post-content.txt --post_title="sofa-beds 010" --post_type=product_variation --post_status=publish --post_name=sofa_bed_010 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_010 _visibility visible
wp post meta update $_sofa_beds_product_2_010 attribute_edb_material 010
wp post meta update $_sofa_beds_product_2_010 _stock 2
wp post meta update $_sofa_beds_product_2_010 _stock_status instock
wp post meta update $_sofa_beds_product_2_010 _manage_stock yes
wp post meta update $_sofa_beds_product_2_010 _backorders yes
wp post meta update $_sofa_beds_product_2_010 _price 350.00
wp post meta update $_sofa_beds_product_2_010 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_010 _sku SOF-010-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_010.jpg --post_id=$_sofa_beds_product_2_010 --featured_image=true
_sofa_beds_product_2_011=`wp post create ./post-content.txt --post_title="sofa-beds 011" --post_type=product_variation --post_status=publish --post_name=sofa_bed_011 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_011 _visibility visible
wp post meta update $_sofa_beds_product_2_011 attribute_edb_material 011
wp post meta update $_sofa_beds_product_2_011 _stock 2
wp post meta update $_sofa_beds_product_2_011 _stock_status instock
wp post meta update $_sofa_beds_product_2_011 _manage_stock yes
wp post meta update $_sofa_beds_product_2_011 _backorders yes
wp post meta update $_sofa_beds_product_2_011 _price 350.00
wp post meta update $_sofa_beds_product_2_011 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_011 _sku SOF-011-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_011.jpg --post_id=$_sofa_beds_product_2_011 --featured_image=true
_sofa_beds_product_2_012=`wp post create ./post-content.txt --post_title="sofa-beds 012" --post_type=product_variation --post_status=publish --post_name=sofa_bed_012 --post_parent="$_sofa_beds_product_2"  --porcelain`
wp post meta update $_sofa_beds_product_2_012 _visibility visible
wp post meta update $_sofa_beds_product_2_012 attribute_edb_material 012
wp post meta update $_sofa_beds_product_2_012 _stock 2
wp post meta update $_sofa_beds_product_2_012 _stock_status instock
wp post meta update $_sofa_beds_product_2_012 _manage_stock yes
wp post meta update $_sofa_beds_product_2_012 _backorders yes
wp post meta update $_sofa_beds_product_2_012 _price 350.00
wp post meta update $_sofa_beds_product_2_012 _regular_price 350.00
wp post meta update $_sofa_beds_product_2_012 _sku SOF-012-2
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_012.jpg --post_id=$_sofa_beds_product_2_012 --featured_image=true
_left_facing_product_3=`wp post create ./post-content.txt --post_title="left-facing" --post_type=product --post_status=publish --post_name=left_facing --porcelain`
wp post meta update $_left_facing_product_3 _visibility visible
wp post meta update $_left_facing_product_3 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_left_facing_product_3 product_shipping_class furniture
wp post term set $_left_facing_product_3 product_cat left-facing
wp post term set $_left_facing_product_3 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_left_facing_product_3 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_left_facing_product_3 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_left_facing_product_3 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_left_facing_product_3 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_left_facing_product_3 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_left_facing_product_3 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_left_facing_product_3 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_left_facing_product_3 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_left_facing_product_3 
_left_facing_product_3_001=`wp post create ./post-content.txt --post_title="left-facing 001" --post_type=product_variation --post_status=publish --post_name=left_facing_001 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_001 _visibility visible
wp post meta update $_left_facing_product_3_001 attribute_edb_material 001
wp post meta update $_left_facing_product_3_001 _stock 2
wp post meta update $_left_facing_product_3_001 _stock_status instock
wp post meta update $_left_facing_product_3_001 _manage_stock yes
wp post meta update $_left_facing_product_3_001 _backorders yes
wp post meta update $_left_facing_product_3_001 _price 350.00
wp post meta update $_left_facing_product_3_001 _regular_price 350.00
wp post meta update $_left_facing_product_3_001 _sku SEL-001-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_left_facing_product_3_001 --featured_image=true
_left_facing_product_3_002=`wp post create ./post-content.txt --post_title="left-facing 002" --post_type=product_variation --post_status=publish --post_name=left_facing_002 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_002 _visibility visible
wp post meta update $_left_facing_product_3_002 attribute_edb_material 002
wp post meta update $_left_facing_product_3_002 _stock 2
wp post meta update $_left_facing_product_3_002 _stock_status instock
wp post meta update $_left_facing_product_3_002 _manage_stock yes
wp post meta update $_left_facing_product_3_002 _backorders yes
wp post meta update $_left_facing_product_3_002 _price 350.00
wp post meta update $_left_facing_product_3_002 _regular_price 350.00
wp post meta update $_left_facing_product_3_002 _sku SEL-002-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_left_facing_product_3_002 --featured_image=true
_left_facing_product_3_003=`wp post create ./post-content.txt --post_title="left-facing 003" --post_type=product_variation --post_status=publish --post_name=left_facing_003 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_003 _visibility visible
wp post meta update $_left_facing_product_3_003 attribute_edb_material 003
wp post meta update $_left_facing_product_3_003 _stock 2
wp post meta update $_left_facing_product_3_003 _stock_status instock
wp post meta update $_left_facing_product_3_003 _manage_stock yes
wp post meta update $_left_facing_product_3_003 _backorders yes
wp post meta update $_left_facing_product_3_003 _price 350.00
wp post meta update $_left_facing_product_3_003 _regular_price 350.00
wp post meta update $_left_facing_product_3_003 _sku SEL-003-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_left_facing_product_3_003 --featured_image=true
_left_facing_product_3_004=`wp post create ./post-content.txt --post_title="left-facing 004" --post_type=product_variation --post_status=publish --post_name=left_facing_004 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_004 _visibility visible
wp post meta update $_left_facing_product_3_004 attribute_edb_material 004
wp post meta update $_left_facing_product_3_004 _stock 2
wp post meta update $_left_facing_product_3_004 _stock_status instock
wp post meta update $_left_facing_product_3_004 _manage_stock yes
wp post meta update $_left_facing_product_3_004 _backorders yes
wp post meta update $_left_facing_product_3_004 _price 350.00
wp post meta update $_left_facing_product_3_004 _regular_price 350.00
wp post meta update $_left_facing_product_3_004 _sku SEL-004-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_left_facing_product_3_004 --featured_image=true
_left_facing_product_3_005=`wp post create ./post-content.txt --post_title="left-facing 005" --post_type=product_variation --post_status=publish --post_name=left_facing_005 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_005 _visibility visible
wp post meta update $_left_facing_product_3_005 attribute_edb_material 005
wp post meta update $_left_facing_product_3_005 _stock 2
wp post meta update $_left_facing_product_3_005 _stock_status instock
wp post meta update $_left_facing_product_3_005 _manage_stock yes
wp post meta update $_left_facing_product_3_005 _backorders yes
wp post meta update $_left_facing_product_3_005 _price 350.00
wp post meta update $_left_facing_product_3_005 _regular_price 350.00
wp post meta update $_left_facing_product_3_005 _sku SEL-005-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_left_facing_product_3_005 --featured_image=true
_left_facing_product_3_006=`wp post create ./post-content.txt --post_title="left-facing 006" --post_type=product_variation --post_status=publish --post_name=left_facing_006 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_006 _visibility visible
wp post meta update $_left_facing_product_3_006 attribute_edb_material 006
wp post meta update $_left_facing_product_3_006 _stock 2
wp post meta update $_left_facing_product_3_006 _stock_status instock
wp post meta update $_left_facing_product_3_006 _manage_stock yes
wp post meta update $_left_facing_product_3_006 _backorders yes
wp post meta update $_left_facing_product_3_006 _price 350.00
wp post meta update $_left_facing_product_3_006 _regular_price 350.00
wp post meta update $_left_facing_product_3_006 _sku SEL-006-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_left_facing_product_3_006 --featured_image=true
_left_facing_product_3_007=`wp post create ./post-content.txt --post_title="left-facing 007" --post_type=product_variation --post_status=publish --post_name=left_facing_007 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_007 _visibility visible
wp post meta update $_left_facing_product_3_007 attribute_edb_material 007
wp post meta update $_left_facing_product_3_007 _stock 2
wp post meta update $_left_facing_product_3_007 _stock_status instock
wp post meta update $_left_facing_product_3_007 _manage_stock yes
wp post meta update $_left_facing_product_3_007 _backorders yes
wp post meta update $_left_facing_product_3_007 _price 350.00
wp post meta update $_left_facing_product_3_007 _regular_price 350.00
wp post meta update $_left_facing_product_3_007 _sku SEL-007-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_007.jpg --post_id=$_left_facing_product_3_007 --featured_image=true
_left_facing_product_3_008=`wp post create ./post-content.txt --post_title="left-facing 008" --post_type=product_variation --post_status=publish --post_name=left_facing_008 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_008 _visibility visible
wp post meta update $_left_facing_product_3_008 attribute_edb_material 008
wp post meta update $_left_facing_product_3_008 _stock 2
wp post meta update $_left_facing_product_3_008 _stock_status instock
wp post meta update $_left_facing_product_3_008 _manage_stock yes
wp post meta update $_left_facing_product_3_008 _backorders yes
wp post meta update $_left_facing_product_3_008 _price 350.00
wp post meta update $_left_facing_product_3_008 _regular_price 350.00
wp post meta update $_left_facing_product_3_008 _sku SEL-008-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_008.jpg --post_id=$_left_facing_product_3_008 --featured_image=true
_left_facing_product_3_009=`wp post create ./post-content.txt --post_title="left-facing 009" --post_type=product_variation --post_status=publish --post_name=left_facing_009 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_009 _visibility visible
wp post meta update $_left_facing_product_3_009 attribute_edb_material 009
wp post meta update $_left_facing_product_3_009 _stock 2
wp post meta update $_left_facing_product_3_009 _stock_status instock
wp post meta update $_left_facing_product_3_009 _manage_stock yes
wp post meta update $_left_facing_product_3_009 _backorders yes
wp post meta update $_left_facing_product_3_009 _price 350.00
wp post meta update $_left_facing_product_3_009 _regular_price 350.00
wp post meta update $_left_facing_product_3_009 _sku SEL-009-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_009.jpg --post_id=$_left_facing_product_3_009 --featured_image=true
_left_facing_product_3_010=`wp post create ./post-content.txt --post_title="left-facing 010" --post_type=product_variation --post_status=publish --post_name=left_facing_010 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_010 _visibility visible
wp post meta update $_left_facing_product_3_010 attribute_edb_material 010
wp post meta update $_left_facing_product_3_010 _stock 2
wp post meta update $_left_facing_product_3_010 _stock_status instock
wp post meta update $_left_facing_product_3_010 _manage_stock yes
wp post meta update $_left_facing_product_3_010 _backorders yes
wp post meta update $_left_facing_product_3_010 _price 350.00
wp post meta update $_left_facing_product_3_010 _regular_price 350.00
wp post meta update $_left_facing_product_3_010 _sku SEL-010-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_010.jpg --post_id=$_left_facing_product_3_010 --featured_image=true
_left_facing_product_3_011=`wp post create ./post-content.txt --post_title="left-facing 011" --post_type=product_variation --post_status=publish --post_name=left_facing_011 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_011 _visibility visible
wp post meta update $_left_facing_product_3_011 attribute_edb_material 011
wp post meta update $_left_facing_product_3_011 _stock 2
wp post meta update $_left_facing_product_3_011 _stock_status instock
wp post meta update $_left_facing_product_3_011 _manage_stock yes
wp post meta update $_left_facing_product_3_011 _backorders yes
wp post meta update $_left_facing_product_3_011 _price 350.00
wp post meta update $_left_facing_product_3_011 _regular_price 350.00
wp post meta update $_left_facing_product_3_011 _sku SEL-011-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_011.jpg --post_id=$_left_facing_product_3_011 --featured_image=true
_left_facing_product_3_012=`wp post create ./post-content.txt --post_title="left-facing 012" --post_type=product_variation --post_status=publish --post_name=left_facing_012 --post_parent="$_left_facing_product_3"  --porcelain`
wp post meta update $_left_facing_product_3_012 _visibility visible
wp post meta update $_left_facing_product_3_012 attribute_edb_material 012
wp post meta update $_left_facing_product_3_012 _stock 2
wp post meta update $_left_facing_product_3_012 _stock_status instock
wp post meta update $_left_facing_product_3_012 _manage_stock yes
wp post meta update $_left_facing_product_3_012 _backorders yes
wp post meta update $_left_facing_product_3_012 _price 350.00
wp post meta update $_left_facing_product_3_012 _regular_price 350.00
wp post meta update $_left_facing_product_3_012 _sku SEL-012-3
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_012.jpg --post_id=$_left_facing_product_3_012 --featured_image=true
_right_facing_product_4=`wp post create ./post-content.txt --post_title="right-facing" --post_type=product --post_status=publish --post_name=right_facing --porcelain`
wp post meta update $_right_facing_product_4 _visibility visible
wp post meta update $_right_facing_product_4 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_right_facing_product_4 product_shipping_class furniture
wp post term set $_right_facing_product_4 product_cat right-facing
wp post term set $_right_facing_product_4 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_right_facing_product_4 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_right_facing_product_4 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_right_facing_product_4 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_right_facing_product_4 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_right_facing_product_4 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_right_facing_product_4 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_right_facing_product_4 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_right_facing_product_4 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_right_facing_product_4 
_right_facing_product_4_001=`wp post create ./post-content.txt --post_title="right-facing 001" --post_type=product_variation --post_status=publish --post_name=right_facing_001 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_001 _visibility visible
wp post meta update $_right_facing_product_4_001 attribute_edb_material 001
wp post meta update $_right_facing_product_4_001 _stock 2
wp post meta update $_right_facing_product_4_001 _stock_status instock
wp post meta update $_right_facing_product_4_001 _manage_stock yes
wp post meta update $_right_facing_product_4_001 _backorders yes
wp post meta update $_right_facing_product_4_001 _price 350.00
wp post meta update $_right_facing_product_4_001 _regular_price 350.00
wp post meta update $_right_facing_product_4_001 _sku SER-001-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_right_facing_product_4_001 --featured_image=true
_right_facing_product_4_002=`wp post create ./post-content.txt --post_title="right-facing 002" --post_type=product_variation --post_status=publish --post_name=right_facing_002 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_002 _visibility visible
wp post meta update $_right_facing_product_4_002 attribute_edb_material 002
wp post meta update $_right_facing_product_4_002 _stock 2
wp post meta update $_right_facing_product_4_002 _stock_status instock
wp post meta update $_right_facing_product_4_002 _manage_stock yes
wp post meta update $_right_facing_product_4_002 _backorders yes
wp post meta update $_right_facing_product_4_002 _price 350.00
wp post meta update $_right_facing_product_4_002 _regular_price 350.00
wp post meta update $_right_facing_product_4_002 _sku SER-002-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_right_facing_product_4_002 --featured_image=true
_right_facing_product_4_003=`wp post create ./post-content.txt --post_title="right-facing 003" --post_type=product_variation --post_status=publish --post_name=right_facing_003 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_003 _visibility visible
wp post meta update $_right_facing_product_4_003 attribute_edb_material 003
wp post meta update $_right_facing_product_4_003 _stock 2
wp post meta update $_right_facing_product_4_003 _stock_status instock
wp post meta update $_right_facing_product_4_003 _manage_stock yes
wp post meta update $_right_facing_product_4_003 _backorders yes
wp post meta update $_right_facing_product_4_003 _price 350.00
wp post meta update $_right_facing_product_4_003 _regular_price 350.00
wp post meta update $_right_facing_product_4_003 _sku SER-003-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_right_facing_product_4_003 --featured_image=true
_right_facing_product_4_004=`wp post create ./post-content.txt --post_title="right-facing 004" --post_type=product_variation --post_status=publish --post_name=right_facing_004 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_004 _visibility visible
wp post meta update $_right_facing_product_4_004 attribute_edb_material 004
wp post meta update $_right_facing_product_4_004 _stock 2
wp post meta update $_right_facing_product_4_004 _stock_status instock
wp post meta update $_right_facing_product_4_004 _manage_stock yes
wp post meta update $_right_facing_product_4_004 _backorders yes
wp post meta update $_right_facing_product_4_004 _price 350.00
wp post meta update $_right_facing_product_4_004 _regular_price 350.00
wp post meta update $_right_facing_product_4_004 _sku SER-004-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_right_facing_product_4_004 --featured_image=true
_right_facing_product_4_005=`wp post create ./post-content.txt --post_title="right-facing 005" --post_type=product_variation --post_status=publish --post_name=right_facing_005 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_005 _visibility visible
wp post meta update $_right_facing_product_4_005 attribute_edb_material 005
wp post meta update $_right_facing_product_4_005 _stock 2
wp post meta update $_right_facing_product_4_005 _stock_status instock
wp post meta update $_right_facing_product_4_005 _manage_stock yes
wp post meta update $_right_facing_product_4_005 _backorders yes
wp post meta update $_right_facing_product_4_005 _price 350.00
wp post meta update $_right_facing_product_4_005 _regular_price 350.00
wp post meta update $_right_facing_product_4_005 _sku SER-005-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_right_facing_product_4_005 --featured_image=true
_right_facing_product_4_006=`wp post create ./post-content.txt --post_title="right-facing 006" --post_type=product_variation --post_status=publish --post_name=right_facing_006 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_006 _visibility visible
wp post meta update $_right_facing_product_4_006 attribute_edb_material 006
wp post meta update $_right_facing_product_4_006 _stock 2
wp post meta update $_right_facing_product_4_006 _stock_status instock
wp post meta update $_right_facing_product_4_006 _manage_stock yes
wp post meta update $_right_facing_product_4_006 _backorders yes
wp post meta update $_right_facing_product_4_006 _price 350.00
wp post meta update $_right_facing_product_4_006 _regular_price 350.00
wp post meta update $_right_facing_product_4_006 _sku SER-006-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_right_facing_product_4_006 --featured_image=true
_right_facing_product_4_007=`wp post create ./post-content.txt --post_title="right-facing 007" --post_type=product_variation --post_status=publish --post_name=right_facing_007 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_007 _visibility visible
wp post meta update $_right_facing_product_4_007 attribute_edb_material 007
wp post meta update $_right_facing_product_4_007 _stock 2
wp post meta update $_right_facing_product_4_007 _stock_status instock
wp post meta update $_right_facing_product_4_007 _manage_stock yes
wp post meta update $_right_facing_product_4_007 _backorders yes
wp post meta update $_right_facing_product_4_007 _price 350.00
wp post meta update $_right_facing_product_4_007 _regular_price 350.00
wp post meta update $_right_facing_product_4_007 _sku SER-007-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_007.jpg --post_id=$_right_facing_product_4_007 --featured_image=true
_right_facing_product_4_008=`wp post create ./post-content.txt --post_title="right-facing 008" --post_type=product_variation --post_status=publish --post_name=right_facing_008 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_008 _visibility visible
wp post meta update $_right_facing_product_4_008 attribute_edb_material 008
wp post meta update $_right_facing_product_4_008 _stock 2
wp post meta update $_right_facing_product_4_008 _stock_status instock
wp post meta update $_right_facing_product_4_008 _manage_stock yes
wp post meta update $_right_facing_product_4_008 _backorders yes
wp post meta update $_right_facing_product_4_008 _price 350.00
wp post meta update $_right_facing_product_4_008 _regular_price 350.00
wp post meta update $_right_facing_product_4_008 _sku SER-008-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_008.jpg --post_id=$_right_facing_product_4_008 --featured_image=true
_right_facing_product_4_009=`wp post create ./post-content.txt --post_title="right-facing 009" --post_type=product_variation --post_status=publish --post_name=right_facing_009 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_009 _visibility visible
wp post meta update $_right_facing_product_4_009 attribute_edb_material 009
wp post meta update $_right_facing_product_4_009 _stock 2
wp post meta update $_right_facing_product_4_009 _stock_status instock
wp post meta update $_right_facing_product_4_009 _manage_stock yes
wp post meta update $_right_facing_product_4_009 _backorders yes
wp post meta update $_right_facing_product_4_009 _price 350.00
wp post meta update $_right_facing_product_4_009 _regular_price 350.00
wp post meta update $_right_facing_product_4_009 _sku SER-009-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_009.jpg --post_id=$_right_facing_product_4_009 --featured_image=true
_right_facing_product_4_010=`wp post create ./post-content.txt --post_title="right-facing 010" --post_type=product_variation --post_status=publish --post_name=right_facing_010 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_010 _visibility visible
wp post meta update $_right_facing_product_4_010 attribute_edb_material 010
wp post meta update $_right_facing_product_4_010 _stock 2
wp post meta update $_right_facing_product_4_010 _stock_status instock
wp post meta update $_right_facing_product_4_010 _manage_stock yes
wp post meta update $_right_facing_product_4_010 _backorders yes
wp post meta update $_right_facing_product_4_010 _price 350.00
wp post meta update $_right_facing_product_4_010 _regular_price 350.00
wp post meta update $_right_facing_product_4_010 _sku SER-010-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_010.jpg --post_id=$_right_facing_product_4_010 --featured_image=true
_right_facing_product_4_011=`wp post create ./post-content.txt --post_title="right-facing 011" --post_type=product_variation --post_status=publish --post_name=right_facing_011 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_011 _visibility visible
wp post meta update $_right_facing_product_4_011 attribute_edb_material 011
wp post meta update $_right_facing_product_4_011 _stock 2
wp post meta update $_right_facing_product_4_011 _stock_status instock
wp post meta update $_right_facing_product_4_011 _manage_stock yes
wp post meta update $_right_facing_product_4_011 _backorders yes
wp post meta update $_right_facing_product_4_011 _price 350.00
wp post meta update $_right_facing_product_4_011 _regular_price 350.00
wp post meta update $_right_facing_product_4_011 _sku SER-011-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_011.jpg --post_id=$_right_facing_product_4_011 --featured_image=true
_right_facing_product_4_012=`wp post create ./post-content.txt --post_title="right-facing 012" --post_type=product_variation --post_status=publish --post_name=right_facing_012 --post_parent="$_right_facing_product_4"  --porcelain`
wp post meta update $_right_facing_product_4_012 _visibility visible
wp post meta update $_right_facing_product_4_012 attribute_edb_material 012
wp post meta update $_right_facing_product_4_012 _stock 2
wp post meta update $_right_facing_product_4_012 _stock_status instock
wp post meta update $_right_facing_product_4_012 _manage_stock yes
wp post meta update $_right_facing_product_4_012 _backorders yes
wp post meta update $_right_facing_product_4_012 _price 350.00
wp post meta update $_right_facing_product_4_012 _regular_price 350.00
wp post meta update $_right_facing_product_4_012 _sku SER-012-4
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_012.jpg --post_id=$_right_facing_product_4_012 --featured_image=true
_coffee_tables_product_5=`wp post create ./post-content.txt --post_title="coffee-table" --post_type=product --post_status=publish --post_name=coffee_table --porcelain`
wp post meta update $_coffee_tables_product_5 _visibility visible
wp post meta update $_coffee_tables_product_5 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_coffee_tables_product_5 product_shipping_class furniture
wp post term set $_coffee_tables_product_5 product_cat coffee-tables
wp post term set $_coffee_tables_product_5 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_coffee_tables_product_5 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_coffee_tables_product_5 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_coffee_tables_product_5 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_coffee_tables_product_5 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_coffee_tables_product_5 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_coffee_tables_product_5 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_coffee_tables_product_5 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_coffee_tables_product_5 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_coffee_tables_product_5 
_coffee_tables_product_5_001=`wp post create ./post-content.txt --post_title="coffee-tables 001" --post_type=product_variation --post_status=publish --post_name=coffee_table_001 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_001 _visibility visible
wp post meta update $_coffee_tables_product_5_001 attribute_edb_material 001
wp post meta update $_coffee_tables_product_5_001 _stock 2
wp post meta update $_coffee_tables_product_5_001 _stock_status instock
wp post meta update $_coffee_tables_product_5_001 _manage_stock yes
wp post meta update $_coffee_tables_product_5_001 _backorders yes
wp post meta update $_coffee_tables_product_5_001 _price 350.00
wp post meta update $_coffee_tables_product_5_001 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_001 _sku COF-001-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_coffee_tables_product_5_001 --featured_image=true
_coffee_tables_product_5_002=`wp post create ./post-content.txt --post_title="coffee-tables 002" --post_type=product_variation --post_status=publish --post_name=coffee_table_002 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_002 _visibility visible
wp post meta update $_coffee_tables_product_5_002 attribute_edb_material 002
wp post meta update $_coffee_tables_product_5_002 _stock 2
wp post meta update $_coffee_tables_product_5_002 _stock_status instock
wp post meta update $_coffee_tables_product_5_002 _manage_stock yes
wp post meta update $_coffee_tables_product_5_002 _backorders yes
wp post meta update $_coffee_tables_product_5_002 _price 350.00
wp post meta update $_coffee_tables_product_5_002 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_002 _sku COF-002-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_coffee_tables_product_5_002 --featured_image=true
_coffee_tables_product_5_003=`wp post create ./post-content.txt --post_title="coffee-tables 003" --post_type=product_variation --post_status=publish --post_name=coffee_table_003 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_003 _visibility visible
wp post meta update $_coffee_tables_product_5_003 attribute_edb_material 003
wp post meta update $_coffee_tables_product_5_003 _stock 2
wp post meta update $_coffee_tables_product_5_003 _stock_status instock
wp post meta update $_coffee_tables_product_5_003 _manage_stock yes
wp post meta update $_coffee_tables_product_5_003 _backorders yes
wp post meta update $_coffee_tables_product_5_003 _price 350.00
wp post meta update $_coffee_tables_product_5_003 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_003 _sku COF-003-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_coffee_tables_product_5_003 --featured_image=true
_coffee_tables_product_5_004=`wp post create ./post-content.txt --post_title="coffee-tables 004" --post_type=product_variation --post_status=publish --post_name=coffee_table_004 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_004 _visibility visible
wp post meta update $_coffee_tables_product_5_004 attribute_edb_material 004
wp post meta update $_coffee_tables_product_5_004 _stock 2
wp post meta update $_coffee_tables_product_5_004 _stock_status instock
wp post meta update $_coffee_tables_product_5_004 _manage_stock yes
wp post meta update $_coffee_tables_product_5_004 _backorders yes
wp post meta update $_coffee_tables_product_5_004 _price 350.00
wp post meta update $_coffee_tables_product_5_004 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_004 _sku COF-004-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_coffee_tables_product_5_004 --featured_image=true
_coffee_tables_product_5_005=`wp post create ./post-content.txt --post_title="coffee-tables 005" --post_type=product_variation --post_status=publish --post_name=coffee_table_005 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_005 _visibility visible
wp post meta update $_coffee_tables_product_5_005 attribute_edb_material 005
wp post meta update $_coffee_tables_product_5_005 _stock 2
wp post meta update $_coffee_tables_product_5_005 _stock_status instock
wp post meta update $_coffee_tables_product_5_005 _manage_stock yes
wp post meta update $_coffee_tables_product_5_005 _backorders yes
wp post meta update $_coffee_tables_product_5_005 _price 350.00
wp post meta update $_coffee_tables_product_5_005 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_005 _sku COF-005-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_coffee_tables_product_5_005 --featured_image=true
_coffee_tables_product_5_006=`wp post create ./post-content.txt --post_title="coffee-tables 006" --post_type=product_variation --post_status=publish --post_name=coffee_table_006 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_006 _visibility visible
wp post meta update $_coffee_tables_product_5_006 attribute_edb_material 006
wp post meta update $_coffee_tables_product_5_006 _stock 2
wp post meta update $_coffee_tables_product_5_006 _stock_status instock
wp post meta update $_coffee_tables_product_5_006 _manage_stock yes
wp post meta update $_coffee_tables_product_5_006 _backorders yes
wp post meta update $_coffee_tables_product_5_006 _price 350.00
wp post meta update $_coffee_tables_product_5_006 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_006 _sku COF-006-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_coffee_tables_product_5_006 --featured_image=true
_coffee_tables_product_5_007=`wp post create ./post-content.txt --post_title="coffee-tables 007" --post_type=product_variation --post_status=publish --post_name=coffee_table_007 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_007 _visibility visible
wp post meta update $_coffee_tables_product_5_007 attribute_edb_material 007
wp post meta update $_coffee_tables_product_5_007 _stock 2
wp post meta update $_coffee_tables_product_5_007 _stock_status instock
wp post meta update $_coffee_tables_product_5_007 _manage_stock yes
wp post meta update $_coffee_tables_product_5_007 _backorders yes
wp post meta update $_coffee_tables_product_5_007 _price 350.00
wp post meta update $_coffee_tables_product_5_007 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_007 _sku COF-007-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_007.jpg --post_id=$_coffee_tables_product_5_007 --featured_image=true
_coffee_tables_product_5_008=`wp post create ./post-content.txt --post_title="coffee-tables 008" --post_type=product_variation --post_status=publish --post_name=coffee_table_008 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_008 _visibility visible
wp post meta update $_coffee_tables_product_5_008 attribute_edb_material 008
wp post meta update $_coffee_tables_product_5_008 _stock 2
wp post meta update $_coffee_tables_product_5_008 _stock_status instock
wp post meta update $_coffee_tables_product_5_008 _manage_stock yes
wp post meta update $_coffee_tables_product_5_008 _backorders yes
wp post meta update $_coffee_tables_product_5_008 _price 350.00
wp post meta update $_coffee_tables_product_5_008 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_008 _sku COF-008-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_008.jpg --post_id=$_coffee_tables_product_5_008 --featured_image=true
_coffee_tables_product_5_009=`wp post create ./post-content.txt --post_title="coffee-tables 009" --post_type=product_variation --post_status=publish --post_name=coffee_table_009 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_009 _visibility visible
wp post meta update $_coffee_tables_product_5_009 attribute_edb_material 009
wp post meta update $_coffee_tables_product_5_009 _stock 2
wp post meta update $_coffee_tables_product_5_009 _stock_status instock
wp post meta update $_coffee_tables_product_5_009 _manage_stock yes
wp post meta update $_coffee_tables_product_5_009 _backorders yes
wp post meta update $_coffee_tables_product_5_009 _price 350.00
wp post meta update $_coffee_tables_product_5_009 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_009 _sku COF-009-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_009.jpg --post_id=$_coffee_tables_product_5_009 --featured_image=true
_coffee_tables_product_5_010=`wp post create ./post-content.txt --post_title="coffee-tables 010" --post_type=product_variation --post_status=publish --post_name=coffee_table_010 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_010 _visibility visible
wp post meta update $_coffee_tables_product_5_010 attribute_edb_material 010
wp post meta update $_coffee_tables_product_5_010 _stock 2
wp post meta update $_coffee_tables_product_5_010 _stock_status instock
wp post meta update $_coffee_tables_product_5_010 _manage_stock yes
wp post meta update $_coffee_tables_product_5_010 _backorders yes
wp post meta update $_coffee_tables_product_5_010 _price 350.00
wp post meta update $_coffee_tables_product_5_010 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_010 _sku COF-010-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_010.jpg --post_id=$_coffee_tables_product_5_010 --featured_image=true
_coffee_tables_product_5_011=`wp post create ./post-content.txt --post_title="coffee-tables 011" --post_type=product_variation --post_status=publish --post_name=coffee_table_011 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_011 _visibility visible
wp post meta update $_coffee_tables_product_5_011 attribute_edb_material 011
wp post meta update $_coffee_tables_product_5_011 _stock 2
wp post meta update $_coffee_tables_product_5_011 _stock_status instock
wp post meta update $_coffee_tables_product_5_011 _manage_stock yes
wp post meta update $_coffee_tables_product_5_011 _backorders yes
wp post meta update $_coffee_tables_product_5_011 _price 350.00
wp post meta update $_coffee_tables_product_5_011 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_011 _sku COF-011-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_011.jpg --post_id=$_coffee_tables_product_5_011 --featured_image=true
_coffee_tables_product_5_012=`wp post create ./post-content.txt --post_title="coffee-tables 012" --post_type=product_variation --post_status=publish --post_name=coffee_table_012 --post_parent="$_coffee_tables_product_5"  --porcelain`
wp post meta update $_coffee_tables_product_5_012 _visibility visible
wp post meta update $_coffee_tables_product_5_012 attribute_edb_material 012
wp post meta update $_coffee_tables_product_5_012 _stock 2
wp post meta update $_coffee_tables_product_5_012 _stock_status instock
wp post meta update $_coffee_tables_product_5_012 _manage_stock yes
wp post meta update $_coffee_tables_product_5_012 _backorders yes
wp post meta update $_coffee_tables_product_5_012 _price 350.00
wp post meta update $_coffee_tables_product_5_012 _regular_price 350.00
wp post meta update $_coffee_tables_product_5_012 _sku COF-012-5
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_012.jpg --post_id=$_coffee_tables_product_5_012 --featured_image=true
_armchairs_product_6=`wp post create ./post-content.txt --post_title="armchair" --post_type=product --post_status=publish --post_name=armchair --porcelain`
wp post meta update $_armchairs_product_6 _visibility visible
wp post meta update $_armchairs_product_6 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_armchairs_product_6 product_shipping_class furniture
wp post term set $_armchairs_product_6 product_cat armchairs
wp post term set $_armchairs_product_6 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_armchairs_product_6 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_armchairs_product_6 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_armchairs_product_6 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_armchairs_product_6 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_armchairs_product_6 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_armchairs_product_6 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_armchairs_product_6 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_armchairs_product_6 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_armchairs_product_6 
_armchairs_product_6_001=`wp post create ./post-content.txt --post_title="armchairs 001" --post_type=product_variation --post_status=publish --post_name=armchair_001 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_001 _visibility visible
wp post meta update $_armchairs_product_6_001 attribute_edb_material 001
wp post meta update $_armchairs_product_6_001 _stock 2
wp post meta update $_armchairs_product_6_001 _stock_status instock
wp post meta update $_armchairs_product_6_001 _manage_stock yes
wp post meta update $_armchairs_product_6_001 _backorders yes
wp post meta update $_armchairs_product_6_001 _price 350.00
wp post meta update $_armchairs_product_6_001 _regular_price 350.00
wp post meta update $_armchairs_product_6_001 _sku ARM-001-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_armchairs_product_6_001 --featured_image=true
_armchairs_product_6_002=`wp post create ./post-content.txt --post_title="armchairs 002" --post_type=product_variation --post_status=publish --post_name=armchair_002 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_002 _visibility visible
wp post meta update $_armchairs_product_6_002 attribute_edb_material 002
wp post meta update $_armchairs_product_6_002 _stock 2
wp post meta update $_armchairs_product_6_002 _stock_status instock
wp post meta update $_armchairs_product_6_002 _manage_stock yes
wp post meta update $_armchairs_product_6_002 _backorders yes
wp post meta update $_armchairs_product_6_002 _price 350.00
wp post meta update $_armchairs_product_6_002 _regular_price 350.00
wp post meta update $_armchairs_product_6_002 _sku ARM-002-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_armchairs_product_6_002 --featured_image=true
_armchairs_product_6_003=`wp post create ./post-content.txt --post_title="armchairs 003" --post_type=product_variation --post_status=publish --post_name=armchair_003 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_003 _visibility visible
wp post meta update $_armchairs_product_6_003 attribute_edb_material 003
wp post meta update $_armchairs_product_6_003 _stock 2
wp post meta update $_armchairs_product_6_003 _stock_status instock
wp post meta update $_armchairs_product_6_003 _manage_stock yes
wp post meta update $_armchairs_product_6_003 _backorders yes
wp post meta update $_armchairs_product_6_003 _price 350.00
wp post meta update $_armchairs_product_6_003 _regular_price 350.00
wp post meta update $_armchairs_product_6_003 _sku ARM-003-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_armchairs_product_6_003 --featured_image=true
_armchairs_product_6_004=`wp post create ./post-content.txt --post_title="armchairs 004" --post_type=product_variation --post_status=publish --post_name=armchair_004 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_004 _visibility visible
wp post meta update $_armchairs_product_6_004 attribute_edb_material 004
wp post meta update $_armchairs_product_6_004 _stock 2
wp post meta update $_armchairs_product_6_004 _stock_status instock
wp post meta update $_armchairs_product_6_004 _manage_stock yes
wp post meta update $_armchairs_product_6_004 _backorders yes
wp post meta update $_armchairs_product_6_004 _price 350.00
wp post meta update $_armchairs_product_6_004 _regular_price 350.00
wp post meta update $_armchairs_product_6_004 _sku ARM-004-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_armchairs_product_6_004 --featured_image=true
_armchairs_product_6_005=`wp post create ./post-content.txt --post_title="armchairs 005" --post_type=product_variation --post_status=publish --post_name=armchair_005 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_005 _visibility visible
wp post meta update $_armchairs_product_6_005 attribute_edb_material 005
wp post meta update $_armchairs_product_6_005 _stock 2
wp post meta update $_armchairs_product_6_005 _stock_status instock
wp post meta update $_armchairs_product_6_005 _manage_stock yes
wp post meta update $_armchairs_product_6_005 _backorders yes
wp post meta update $_armchairs_product_6_005 _price 350.00
wp post meta update $_armchairs_product_6_005 _regular_price 350.00
wp post meta update $_armchairs_product_6_005 _sku ARM-005-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_armchairs_product_6_005 --featured_image=true
_armchairs_product_6_006=`wp post create ./post-content.txt --post_title="armchairs 006" --post_type=product_variation --post_status=publish --post_name=armchair_006 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_006 _visibility visible
wp post meta update $_armchairs_product_6_006 attribute_edb_material 006
wp post meta update $_armchairs_product_6_006 _stock 2
wp post meta update $_armchairs_product_6_006 _stock_status instock
wp post meta update $_armchairs_product_6_006 _manage_stock yes
wp post meta update $_armchairs_product_6_006 _backorders yes
wp post meta update $_armchairs_product_6_006 _price 350.00
wp post meta update $_armchairs_product_6_006 _regular_price 350.00
wp post meta update $_armchairs_product_6_006 _sku ARM-006-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_armchairs_product_6_006 --featured_image=true
_armchairs_product_6_007=`wp post create ./post-content.txt --post_title="armchairs 007" --post_type=product_variation --post_status=publish --post_name=armchair_007 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_007 _visibility visible
wp post meta update $_armchairs_product_6_007 attribute_edb_material 007
wp post meta update $_armchairs_product_6_007 _stock 2
wp post meta update $_armchairs_product_6_007 _stock_status instock
wp post meta update $_armchairs_product_6_007 _manage_stock yes
wp post meta update $_armchairs_product_6_007 _backorders yes
wp post meta update $_armchairs_product_6_007 _price 350.00
wp post meta update $_armchairs_product_6_007 _regular_price 350.00
wp post meta update $_armchairs_product_6_007 _sku ARM-007-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_007.jpg --post_id=$_armchairs_product_6_007 --featured_image=true
_armchairs_product_6_008=`wp post create ./post-content.txt --post_title="armchairs 008" --post_type=product_variation --post_status=publish --post_name=armchair_008 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_008 _visibility visible
wp post meta update $_armchairs_product_6_008 attribute_edb_material 008
wp post meta update $_armchairs_product_6_008 _stock 2
wp post meta update $_armchairs_product_6_008 _stock_status instock
wp post meta update $_armchairs_product_6_008 _manage_stock yes
wp post meta update $_armchairs_product_6_008 _backorders yes
wp post meta update $_armchairs_product_6_008 _price 350.00
wp post meta update $_armchairs_product_6_008 _regular_price 350.00
wp post meta update $_armchairs_product_6_008 _sku ARM-008-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_008.jpg --post_id=$_armchairs_product_6_008 --featured_image=true
_armchairs_product_6_009=`wp post create ./post-content.txt --post_title="armchairs 009" --post_type=product_variation --post_status=publish --post_name=armchair_009 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_009 _visibility visible
wp post meta update $_armchairs_product_6_009 attribute_edb_material 009
wp post meta update $_armchairs_product_6_009 _stock 2
wp post meta update $_armchairs_product_6_009 _stock_status instock
wp post meta update $_armchairs_product_6_009 _manage_stock yes
wp post meta update $_armchairs_product_6_009 _backorders yes
wp post meta update $_armchairs_product_6_009 _price 350.00
wp post meta update $_armchairs_product_6_009 _regular_price 350.00
wp post meta update $_armchairs_product_6_009 _sku ARM-009-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_009.jpg --post_id=$_armchairs_product_6_009 --featured_image=true
_armchairs_product_6_010=`wp post create ./post-content.txt --post_title="armchairs 010" --post_type=product_variation --post_status=publish --post_name=armchair_010 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_010 _visibility visible
wp post meta update $_armchairs_product_6_010 attribute_edb_material 010
wp post meta update $_armchairs_product_6_010 _stock 2
wp post meta update $_armchairs_product_6_010 _stock_status instock
wp post meta update $_armchairs_product_6_010 _manage_stock yes
wp post meta update $_armchairs_product_6_010 _backorders yes
wp post meta update $_armchairs_product_6_010 _price 350.00
wp post meta update $_armchairs_product_6_010 _regular_price 350.00
wp post meta update $_armchairs_product_6_010 _sku ARM-010-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_010.jpg --post_id=$_armchairs_product_6_010 --featured_image=true
_armchairs_product_6_011=`wp post create ./post-content.txt --post_title="armchairs 011" --post_type=product_variation --post_status=publish --post_name=armchair_011 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_011 _visibility visible
wp post meta update $_armchairs_product_6_011 attribute_edb_material 011
wp post meta update $_armchairs_product_6_011 _stock 2
wp post meta update $_armchairs_product_6_011 _stock_status instock
wp post meta update $_armchairs_product_6_011 _manage_stock yes
wp post meta update $_armchairs_product_6_011 _backorders yes
wp post meta update $_armchairs_product_6_011 _price 350.00
wp post meta update $_armchairs_product_6_011 _regular_price 350.00
wp post meta update $_armchairs_product_6_011 _sku ARM-011-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_011.jpg --post_id=$_armchairs_product_6_011 --featured_image=true
_armchairs_product_6_012=`wp post create ./post-content.txt --post_title="armchairs 012" --post_type=product_variation --post_status=publish --post_name=armchair_012 --post_parent="$_armchairs_product_6"  --porcelain`
wp post meta update $_armchairs_product_6_012 _visibility visible
wp post meta update $_armchairs_product_6_012 attribute_edb_material 012
wp post meta update $_armchairs_product_6_012 _stock 2
wp post meta update $_armchairs_product_6_012 _stock_status instock
wp post meta update $_armchairs_product_6_012 _manage_stock yes
wp post meta update $_armchairs_product_6_012 _backorders yes
wp post meta update $_armchairs_product_6_012 _price 350.00
wp post meta update $_armchairs_product_6_012 _regular_price 350.00
wp post meta update $_armchairs_product_6_012 _sku ARM-012-6
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_012.jpg --post_id=$_armchairs_product_6_012 --featured_image=true
_benches_ottomans_product_7=`wp post create ./post-content.txt --post_title="benches-ottoman" --post_type=product --post_status=publish --post_name=benches_ottoman --porcelain`
wp post meta update $_benches_ottomans_product_7 _visibility visible
wp post meta update $_benches_ottomans_product_7 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006|007|008|009|010|011|012","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_benches_ottomans_product_7 product_shipping_class furniture
wp post term set $_benches_ottomans_product_7 product_cat benches-ottomans
wp post term set $_benches_ottomans_product_7 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_benches_ottomans_product_7 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_benches_ottomans_product_7 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_benches_ottomans_product_7 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_benches_ottomans_product_7 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_benches_ottomans_product_7 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_benches_ottomans_product_7 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_benches_ottomans_product_7 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_benches_ottomans_product_7 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_benches_ottomans_product_7 
_benches_ottomans_product_7_001=`wp post create ./post-content.txt --post_title="benches-ottomans 001" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_001 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_001 _visibility visible
wp post meta update $_benches_ottomans_product_7_001 attribute_edb_material 001
wp post meta update $_benches_ottomans_product_7_001 _stock 2
wp post meta update $_benches_ottomans_product_7_001 _stock_status instock
wp post meta update $_benches_ottomans_product_7_001 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_001 _backorders yes
wp post meta update $_benches_ottomans_product_7_001 _price 350.00
wp post meta update $_benches_ottomans_product_7_001 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_001 _sku BEN-001-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_benches_ottomans_product_7_001 --featured_image=true
_benches_ottomans_product_7_002=`wp post create ./post-content.txt --post_title="benches-ottomans 002" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_002 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_002 _visibility visible
wp post meta update $_benches_ottomans_product_7_002 attribute_edb_material 002
wp post meta update $_benches_ottomans_product_7_002 _stock 2
wp post meta update $_benches_ottomans_product_7_002 _stock_status instock
wp post meta update $_benches_ottomans_product_7_002 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_002 _backorders yes
wp post meta update $_benches_ottomans_product_7_002 _price 350.00
wp post meta update $_benches_ottomans_product_7_002 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_002 _sku BEN-002-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_benches_ottomans_product_7_002 --featured_image=true
_benches_ottomans_product_7_003=`wp post create ./post-content.txt --post_title="benches-ottomans 003" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_003 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_003 _visibility visible
wp post meta update $_benches_ottomans_product_7_003 attribute_edb_material 003
wp post meta update $_benches_ottomans_product_7_003 _stock 2
wp post meta update $_benches_ottomans_product_7_003 _stock_status instock
wp post meta update $_benches_ottomans_product_7_003 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_003 _backorders yes
wp post meta update $_benches_ottomans_product_7_003 _price 350.00
wp post meta update $_benches_ottomans_product_7_003 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_003 _sku BEN-003-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_benches_ottomans_product_7_003 --featured_image=true
_benches_ottomans_product_7_004=`wp post create ./post-content.txt --post_title="benches-ottomans 004" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_004 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_004 _visibility visible
wp post meta update $_benches_ottomans_product_7_004 attribute_edb_material 004
wp post meta update $_benches_ottomans_product_7_004 _stock 2
wp post meta update $_benches_ottomans_product_7_004 _stock_status instock
wp post meta update $_benches_ottomans_product_7_004 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_004 _backorders yes
wp post meta update $_benches_ottomans_product_7_004 _price 350.00
wp post meta update $_benches_ottomans_product_7_004 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_004 _sku BEN-004-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_benches_ottomans_product_7_004 --featured_image=true
_benches_ottomans_product_7_005=`wp post create ./post-content.txt --post_title="benches-ottomans 005" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_005 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_005 _visibility visible
wp post meta update $_benches_ottomans_product_7_005 attribute_edb_material 005
wp post meta update $_benches_ottomans_product_7_005 _stock 2
wp post meta update $_benches_ottomans_product_7_005 _stock_status instock
wp post meta update $_benches_ottomans_product_7_005 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_005 _backorders yes
wp post meta update $_benches_ottomans_product_7_005 _price 350.00
wp post meta update $_benches_ottomans_product_7_005 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_005 _sku BEN-005-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_benches_ottomans_product_7_005 --featured_image=true
_benches_ottomans_product_7_006=`wp post create ./post-content.txt --post_title="benches-ottomans 006" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_006 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_006 _visibility visible
wp post meta update $_benches_ottomans_product_7_006 attribute_edb_material 006
wp post meta update $_benches_ottomans_product_7_006 _stock 2
wp post meta update $_benches_ottomans_product_7_006 _stock_status instock
wp post meta update $_benches_ottomans_product_7_006 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_006 _backorders yes
wp post meta update $_benches_ottomans_product_7_006 _price 350.00
wp post meta update $_benches_ottomans_product_7_006 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_006 _sku BEN-006-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_benches_ottomans_product_7_006 --featured_image=true
_benches_ottomans_product_7_007=`wp post create ./post-content.txt --post_title="benches-ottomans 007" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_007 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_007 _visibility visible
wp post meta update $_benches_ottomans_product_7_007 attribute_edb_material 007
wp post meta update $_benches_ottomans_product_7_007 _stock 2
wp post meta update $_benches_ottomans_product_7_007 _stock_status instock
wp post meta update $_benches_ottomans_product_7_007 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_007 _backorders yes
wp post meta update $_benches_ottomans_product_7_007 _price 350.00
wp post meta update $_benches_ottomans_product_7_007 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_007 _sku BEN-007-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_007.jpg --post_id=$_benches_ottomans_product_7_007 --featured_image=true
_benches_ottomans_product_7_008=`wp post create ./post-content.txt --post_title="benches-ottomans 008" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_008 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_008 _visibility visible
wp post meta update $_benches_ottomans_product_7_008 attribute_edb_material 008
wp post meta update $_benches_ottomans_product_7_008 _stock 2
wp post meta update $_benches_ottomans_product_7_008 _stock_status instock
wp post meta update $_benches_ottomans_product_7_008 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_008 _backorders yes
wp post meta update $_benches_ottomans_product_7_008 _price 350.00
wp post meta update $_benches_ottomans_product_7_008 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_008 _sku BEN-008-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_008.jpg --post_id=$_benches_ottomans_product_7_008 --featured_image=true
_benches_ottomans_product_7_009=`wp post create ./post-content.txt --post_title="benches-ottomans 009" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_009 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_009 _visibility visible
wp post meta update $_benches_ottomans_product_7_009 attribute_edb_material 009
wp post meta update $_benches_ottomans_product_7_009 _stock 2
wp post meta update $_benches_ottomans_product_7_009 _stock_status instock
wp post meta update $_benches_ottomans_product_7_009 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_009 _backorders yes
wp post meta update $_benches_ottomans_product_7_009 _price 350.00
wp post meta update $_benches_ottomans_product_7_009 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_009 _sku BEN-009-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_009.jpg --post_id=$_benches_ottomans_product_7_009 --featured_image=true
_benches_ottomans_product_7_010=`wp post create ./post-content.txt --post_title="benches-ottomans 010" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_010 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_010 _visibility visible
wp post meta update $_benches_ottomans_product_7_010 attribute_edb_material 010
wp post meta update $_benches_ottomans_product_7_010 _stock 2
wp post meta update $_benches_ottomans_product_7_010 _stock_status instock
wp post meta update $_benches_ottomans_product_7_010 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_010 _backorders yes
wp post meta update $_benches_ottomans_product_7_010 _price 350.00
wp post meta update $_benches_ottomans_product_7_010 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_010 _sku BEN-010-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_010.jpg --post_id=$_benches_ottomans_product_7_010 --featured_image=true
_benches_ottomans_product_7_011=`wp post create ./post-content.txt --post_title="benches-ottomans 011" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_011 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_011 _visibility visible
wp post meta update $_benches_ottomans_product_7_011 attribute_edb_material 011
wp post meta update $_benches_ottomans_product_7_011 _stock 2
wp post meta update $_benches_ottomans_product_7_011 _stock_status instock
wp post meta update $_benches_ottomans_product_7_011 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_011 _backorders yes
wp post meta update $_benches_ottomans_product_7_011 _price 350.00
wp post meta update $_benches_ottomans_product_7_011 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_011 _sku BEN-011-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_011.jpg --post_id=$_benches_ottomans_product_7_011 --featured_image=true
_benches_ottomans_product_7_012=`wp post create ./post-content.txt --post_title="benches-ottomans 012" --post_type=product_variation --post_status=publish --post_name=benches_ottoman_012 --post_parent="$_benches_ottomans_product_7"  --porcelain`
wp post meta update $_benches_ottomans_product_7_012 _visibility visible
wp post meta update $_benches_ottomans_product_7_012 attribute_edb_material 012
wp post meta update $_benches_ottomans_product_7_012 _stock 2
wp post meta update $_benches_ottomans_product_7_012 _stock_status instock
wp post meta update $_benches_ottomans_product_7_012 _manage_stock yes
wp post meta update $_benches_ottomans_product_7_012 _backorders yes
wp post meta update $_benches_ottomans_product_7_012 _price 350.00
wp post meta update $_benches_ottomans_product_7_012 _regular_price 350.00
wp post meta update $_benches_ottomans_product_7_012 _sku BEN-012-7
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_012.jpg --post_id=$_benches_ottomans_product_7_012 --featured_image=true
_headboards_product_8=`wp post create ./post-content.txt --post_title="headboard" --post_type=product --post_status=publish --post_name=headboard --porcelain`
wp post meta update $_headboards_product_8 _visibility visible
wp post meta update $_headboards_product_8 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_headboards_product_8 product_shipping_class furniture
wp post term set $_headboards_product_8 product_cat headboards
wp post term set $_headboards_product_8 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_headboards_product_8 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_headboards_product_8 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_headboards_product_8 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_headboards_product_8 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_headboards_product_8 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_headboards_product_8 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_headboards_product_8 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_headboards_product_8 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_headboards_product_8 
_headboards_product_8_001=`wp post create ./post-content.txt --post_title="headboards 001" --post_type=product_variation --post_status=publish --post_name=headboard_001 --post_parent="$_headboards_product_8"  --porcelain`
wp post meta update $_headboards_product_8_001 _visibility visible
wp post meta update $_headboards_product_8_001 attribute_edb_material 001
wp post meta update $_headboards_product_8_001 _stock 2
wp post meta update $_headboards_product_8_001 _stock_status instock
wp post meta update $_headboards_product_8_001 _manage_stock yes
wp post meta update $_headboards_product_8_001 _backorders yes
wp post meta update $_headboards_product_8_001 _price 350.00
wp post meta update $_headboards_product_8_001 _regular_price 350.00
wp post meta update $_headboards_product_8_001 _sku HEA-001-8
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_headboards_product_8_001 --featured_image=true
_headboards_product_8_002=`wp post create ./post-content.txt --post_title="headboards 002" --post_type=product_variation --post_status=publish --post_name=headboard_002 --post_parent="$_headboards_product_8"  --porcelain`
wp post meta update $_headboards_product_8_002 _visibility visible
wp post meta update $_headboards_product_8_002 attribute_edb_material 002
wp post meta update $_headboards_product_8_002 _stock 2
wp post meta update $_headboards_product_8_002 _stock_status instock
wp post meta update $_headboards_product_8_002 _manage_stock yes
wp post meta update $_headboards_product_8_002 _backorders yes
wp post meta update $_headboards_product_8_002 _price 350.00
wp post meta update $_headboards_product_8_002 _regular_price 350.00
wp post meta update $_headboards_product_8_002 _sku HEA-002-8
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_headboards_product_8_002 --featured_image=true
_headboards_product_8_003=`wp post create ./post-content.txt --post_title="headboards 003" --post_type=product_variation --post_status=publish --post_name=headboard_003 --post_parent="$_headboards_product_8"  --porcelain`
wp post meta update $_headboards_product_8_003 _visibility visible
wp post meta update $_headboards_product_8_003 attribute_edb_material 003
wp post meta update $_headboards_product_8_003 _stock 2
wp post meta update $_headboards_product_8_003 _stock_status instock
wp post meta update $_headboards_product_8_003 _manage_stock yes
wp post meta update $_headboards_product_8_003 _backorders yes
wp post meta update $_headboards_product_8_003 _price 350.00
wp post meta update $_headboards_product_8_003 _regular_price 350.00
wp post meta update $_headboards_product_8_003 _sku HEA-003-8
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_headboards_product_8_003 --featured_image=true
_headboards_product_8_004=`wp post create ./post-content.txt --post_title="headboards 004" --post_type=product_variation --post_status=publish --post_name=headboard_004 --post_parent="$_headboards_product_8"  --porcelain`
wp post meta update $_headboards_product_8_004 _visibility visible
wp post meta update $_headboards_product_8_004 attribute_edb_material 004
wp post meta update $_headboards_product_8_004 _stock 2
wp post meta update $_headboards_product_8_004 _stock_status instock
wp post meta update $_headboards_product_8_004 _manage_stock yes
wp post meta update $_headboards_product_8_004 _backorders yes
wp post meta update $_headboards_product_8_004 _price 350.00
wp post meta update $_headboards_product_8_004 _regular_price 350.00
wp post meta update $_headboards_product_8_004 _sku HEA-004-8
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_headboards_product_8_004 --featured_image=true
_headboards_product_8_005=`wp post create ./post-content.txt --post_title="headboards 005" --post_type=product_variation --post_status=publish --post_name=headboard_005 --post_parent="$_headboards_product_8"  --porcelain`
wp post meta update $_headboards_product_8_005 _visibility visible
wp post meta update $_headboards_product_8_005 attribute_edb_material 005
wp post meta update $_headboards_product_8_005 _stock 2
wp post meta update $_headboards_product_8_005 _stock_status instock
wp post meta update $_headboards_product_8_005 _manage_stock yes
wp post meta update $_headboards_product_8_005 _backorders yes
wp post meta update $_headboards_product_8_005 _price 350.00
wp post meta update $_headboards_product_8_005 _regular_price 350.00
wp post meta update $_headboards_product_8_005 _sku HEA-005-8
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_headboards_product_8_005 --featured_image=true
_headboards_product_8_006=`wp post create ./post-content.txt --post_title="headboards 006" --post_type=product_variation --post_status=publish --post_name=headboard_006 --post_parent="$_headboards_product_8"  --porcelain`
wp post meta update $_headboards_product_8_006 _visibility visible
wp post meta update $_headboards_product_8_006 attribute_edb_material 006
wp post meta update $_headboards_product_8_006 _stock 2
wp post meta update $_headboards_product_8_006 _stock_status instock
wp post meta update $_headboards_product_8_006 _manage_stock yes
wp post meta update $_headboards_product_8_006 _backorders yes
wp post meta update $_headboards_product_8_006 _price 350.00
wp post meta update $_headboards_product_8_006 _regular_price 350.00
wp post meta update $_headboards_product_8_006 _sku HEA-006-8
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_headboards_product_8_006 --featured_image=true
_storage_product_9=`wp post create ./post-content.txt --post_title="storage" --post_type=product --post_status=publish --post_name=storage --porcelain`
wp post meta update $_storage_product_9 _visibility visible
wp post meta update $_storage_product_9 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_storage_product_9 product_shipping_class accessories
wp post term set $_storage_product_9 product_cat storage
wp post term set $_storage_product_9 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_storage_product_9 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_storage_product_9 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_storage_product_9 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_storage_product_9 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_storage_product_9 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_storage_product_9 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_storage_product_9 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_storage_product_9 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_storage_product_9 
_storage_product_9_001=`wp post create ./post-content.txt --post_title="storage 001" --post_type=product_variation --post_status=publish --post_name=storage_001 --post_parent="$_storage_product_9"  --porcelain`
wp post meta update $_storage_product_9_001 _visibility visible
wp post meta update $_storage_product_9_001 attribute_edb_material 001
wp post meta update $_storage_product_9_001 _stock 2
wp post meta update $_storage_product_9_001 _stock_status instock
wp post meta update $_storage_product_9_001 _manage_stock yes
wp post meta update $_storage_product_9_001 _backorders yes
wp post meta update $_storage_product_9_001 _price 15.00
wp post meta update $_storage_product_9_001 _regular_price 15.00
wp post meta update $_storage_product_9_001 _sku STO-001-9
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_storage_product_9_001 --featured_image=true
_storage_product_9_002=`wp post create ./post-content.txt --post_title="storage 002" --post_type=product_variation --post_status=publish --post_name=storage_002 --post_parent="$_storage_product_9"  --porcelain`
wp post meta update $_storage_product_9_002 _visibility visible
wp post meta update $_storage_product_9_002 attribute_edb_material 002
wp post meta update $_storage_product_9_002 _stock 2
wp post meta update $_storage_product_9_002 _stock_status instock
wp post meta update $_storage_product_9_002 _manage_stock yes
wp post meta update $_storage_product_9_002 _backorders yes
wp post meta update $_storage_product_9_002 _price 15.00
wp post meta update $_storage_product_9_002 _regular_price 15.00
wp post meta update $_storage_product_9_002 _sku STO-002-9
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_storage_product_9_002 --featured_image=true
_pillows_product_10=`wp post create ./post-content.txt --post_title="pillow" --post_type=product --post_status=publish --post_name=pillow --porcelain`
wp post meta update $_pillows_product_10 _visibility visible
wp post meta update $_pillows_product_10 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_pillows_product_10 product_shipping_class accessories
wp post term set $_pillows_product_10 product_cat pillows
wp post term set $_pillows_product_10 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_pillows_product_10 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_pillows_product_10 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_pillows_product_10 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_pillows_product_10 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_pillows_product_10 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_pillows_product_10 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_pillows_product_10 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_pillows_product_10 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_pillows_product_10 
_pillows_product_10_001=`wp post create ./post-content.txt --post_title="pillows 001" --post_type=product_variation --post_status=publish --post_name=pillow_001 --post_parent="$_pillows_product_10"  --porcelain`
wp post meta update $_pillows_product_10_001 _visibility visible
wp post meta update $_pillows_product_10_001 attribute_edb_material 001
wp post meta update $_pillows_product_10_001 _stock 2
wp post meta update $_pillows_product_10_001 _stock_status instock
wp post meta update $_pillows_product_10_001 _manage_stock yes
wp post meta update $_pillows_product_10_001 _backorders yes
wp post meta update $_pillows_product_10_001 _price 15.00
wp post meta update $_pillows_product_10_001 _regular_price 15.00
wp post meta update $_pillows_product_10_001 _sku ACP-001-10
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_pillows_product_10_001 --featured_image=true
_pillows_product_10_002=`wp post create ./post-content.txt --post_title="pillows 002" --post_type=product_variation --post_status=publish --post_name=pillow_002 --post_parent="$_pillows_product_10"  --porcelain`
wp post meta update $_pillows_product_10_002 _visibility visible
wp post meta update $_pillows_product_10_002 attribute_edb_material 002
wp post meta update $_pillows_product_10_002 _stock 2
wp post meta update $_pillows_product_10_002 _stock_status instock
wp post meta update $_pillows_product_10_002 _manage_stock yes
wp post meta update $_pillows_product_10_002 _backorders yes
wp post meta update $_pillows_product_10_002 _price 15.00
wp post meta update $_pillows_product_10_002 _regular_price 15.00
wp post meta update $_pillows_product_10_002 _sku ACP-002-10
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_pillows_product_10_002 --featured_image=true
_pillows_product_10_003=`wp post create ./post-content.txt --post_title="pillows 003" --post_type=product_variation --post_status=publish --post_name=pillow_003 --post_parent="$_pillows_product_10"  --porcelain`
wp post meta update $_pillows_product_10_003 _visibility visible
wp post meta update $_pillows_product_10_003 attribute_edb_material 003
wp post meta update $_pillows_product_10_003 _stock 2
wp post meta update $_pillows_product_10_003 _stock_status instock
wp post meta update $_pillows_product_10_003 _manage_stock yes
wp post meta update $_pillows_product_10_003 _backorders yes
wp post meta update $_pillows_product_10_003 _price 15.00
wp post meta update $_pillows_product_10_003 _regular_price 15.00
wp post meta update $_pillows_product_10_003 _sku ACP-003-10
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_pillows_product_10_003 --featured_image=true
_pillows_product_10_004=`wp post create ./post-content.txt --post_title="pillows 004" --post_type=product_variation --post_status=publish --post_name=pillow_004 --post_parent="$_pillows_product_10"  --porcelain`
wp post meta update $_pillows_product_10_004 _visibility visible
wp post meta update $_pillows_product_10_004 attribute_edb_material 004
wp post meta update $_pillows_product_10_004 _stock 2
wp post meta update $_pillows_product_10_004 _stock_status instock
wp post meta update $_pillows_product_10_004 _manage_stock yes
wp post meta update $_pillows_product_10_004 _backorders yes
wp post meta update $_pillows_product_10_004 _price 15.00
wp post meta update $_pillows_product_10_004 _regular_price 15.00
wp post meta update $_pillows_product_10_004 _sku ACP-004-10
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_pillows_product_10_004 --featured_image=true
_pillows_product_10_005=`wp post create ./post-content.txt --post_title="pillows 005" --post_type=product_variation --post_status=publish --post_name=pillow_005 --post_parent="$_pillows_product_10"  --porcelain`
wp post meta update $_pillows_product_10_005 _visibility visible
wp post meta update $_pillows_product_10_005 attribute_edb_material 005
wp post meta update $_pillows_product_10_005 _stock 2
wp post meta update $_pillows_product_10_005 _stock_status instock
wp post meta update $_pillows_product_10_005 _manage_stock yes
wp post meta update $_pillows_product_10_005 _backorders yes
wp post meta update $_pillows_product_10_005 _price 15.00
wp post meta update $_pillows_product_10_005 _regular_price 15.00
wp post meta update $_pillows_product_10_005 _sku ACP-005-10
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_pillows_product_10_005 --featured_image=true
_pillows_product_10_006=`wp post create ./post-content.txt --post_title="pillows 006" --post_type=product_variation --post_status=publish --post_name=pillow_006 --post_parent="$_pillows_product_10"  --porcelain`
wp post meta update $_pillows_product_10_006 _visibility visible
wp post meta update $_pillows_product_10_006 attribute_edb_material 006
wp post meta update $_pillows_product_10_006 _stock 2
wp post meta update $_pillows_product_10_006 _stock_status instock
wp post meta update $_pillows_product_10_006 _manage_stock yes
wp post meta update $_pillows_product_10_006 _backorders yes
wp post meta update $_pillows_product_10_006 _price 15.00
wp post meta update $_pillows_product_10_006 _regular_price 15.00
wp post meta update $_pillows_product_10_006 _sku ACP-006-10
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_pillows_product_10_006 --featured_image=true
_rugs_product_11=`wp post create ./post-content.txt --post_title="rug" --post_type=product --post_status=publish --post_name=rug --porcelain`
wp post meta update $_rugs_product_11 _visibility visible
wp post meta update $_rugs_product_11 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_rugs_product_11 product_shipping_class accessories
wp post term set $_rugs_product_11 product_cat rugs
wp post term set $_rugs_product_11 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_rugs_product_11 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_rugs_product_11 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_rugs_product_11 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_rugs_product_11 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_rugs_product_11 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_rugs_product_11 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_rugs_product_11 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_rugs_product_11 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_rugs_product_11 
_rugs_product_11_001=`wp post create ./post-content.txt --post_title="rugs 001" --post_type=product_variation --post_status=publish --post_name=rug_001 --post_parent="$_rugs_product_11"  --porcelain`
wp post meta update $_rugs_product_11_001 _visibility visible
wp post meta update $_rugs_product_11_001 attribute_edb_material 001
wp post meta update $_rugs_product_11_001 _stock 2
wp post meta update $_rugs_product_11_001 _stock_status instock
wp post meta update $_rugs_product_11_001 _manage_stock yes
wp post meta update $_rugs_product_11_001 _backorders yes
wp post meta update $_rugs_product_11_001 _price 15.00
wp post meta update $_rugs_product_11_001 _regular_price 15.00
wp post meta update $_rugs_product_11_001 _sku ACR-001-11
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_rugs_product_11_001 --featured_image=true
_rugs_product_11_002=`wp post create ./post-content.txt --post_title="rugs 002" --post_type=product_variation --post_status=publish --post_name=rug_002 --post_parent="$_rugs_product_11"  --porcelain`
wp post meta update $_rugs_product_11_002 _visibility visible
wp post meta update $_rugs_product_11_002 attribute_edb_material 002
wp post meta update $_rugs_product_11_002 _stock 2
wp post meta update $_rugs_product_11_002 _stock_status instock
wp post meta update $_rugs_product_11_002 _manage_stock yes
wp post meta update $_rugs_product_11_002 _backorders yes
wp post meta update $_rugs_product_11_002 _price 15.00
wp post meta update $_rugs_product_11_002 _regular_price 15.00
wp post meta update $_rugs_product_11_002 _sku ACR-002-11
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_rugs_product_11_002 --featured_image=true
_rugs_product_11_003=`wp post create ./post-content.txt --post_title="rugs 003" --post_type=product_variation --post_status=publish --post_name=rug_003 --post_parent="$_rugs_product_11"  --porcelain`
wp post meta update $_rugs_product_11_003 _visibility visible
wp post meta update $_rugs_product_11_003 attribute_edb_material 003
wp post meta update $_rugs_product_11_003 _stock 2
wp post meta update $_rugs_product_11_003 _stock_status instock
wp post meta update $_rugs_product_11_003 _manage_stock yes
wp post meta update $_rugs_product_11_003 _backorders yes
wp post meta update $_rugs_product_11_003 _price 15.00
wp post meta update $_rugs_product_11_003 _regular_price 15.00
wp post meta update $_rugs_product_11_003 _sku ACR-003-11
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_rugs_product_11_003 --featured_image=true
_rugs_product_11_004=`wp post create ./post-content.txt --post_title="rugs 004" --post_type=product_variation --post_status=publish --post_name=rug_004 --post_parent="$_rugs_product_11"  --porcelain`
wp post meta update $_rugs_product_11_004 _visibility visible
wp post meta update $_rugs_product_11_004 attribute_edb_material 004
wp post meta update $_rugs_product_11_004 _stock 2
wp post meta update $_rugs_product_11_004 _stock_status instock
wp post meta update $_rugs_product_11_004 _manage_stock yes
wp post meta update $_rugs_product_11_004 _backorders yes
wp post meta update $_rugs_product_11_004 _price 15.00
wp post meta update $_rugs_product_11_004 _regular_price 15.00
wp post meta update $_rugs_product_11_004 _sku ACR-004-11
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_rugs_product_11_004 --featured_image=true
_rugs_product_11_005=`wp post create ./post-content.txt --post_title="rugs 005" --post_type=product_variation --post_status=publish --post_name=rug_005 --post_parent="$_rugs_product_11"  --porcelain`
wp post meta update $_rugs_product_11_005 _visibility visible
wp post meta update $_rugs_product_11_005 attribute_edb_material 005
wp post meta update $_rugs_product_11_005 _stock 2
wp post meta update $_rugs_product_11_005 _stock_status instock
wp post meta update $_rugs_product_11_005 _manage_stock yes
wp post meta update $_rugs_product_11_005 _backorders yes
wp post meta update $_rugs_product_11_005 _price 15.00
wp post meta update $_rugs_product_11_005 _regular_price 15.00
wp post meta update $_rugs_product_11_005 _sku ACR-005-11
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_rugs_product_11_005 --featured_image=true
_rugs_product_11_006=`wp post create ./post-content.txt --post_title="rugs 006" --post_type=product_variation --post_status=publish --post_name=rug_006 --post_parent="$_rugs_product_11"  --porcelain`
wp post meta update $_rugs_product_11_006 _visibility visible
wp post meta update $_rugs_product_11_006 attribute_edb_material 006
wp post meta update $_rugs_product_11_006 _stock 2
wp post meta update $_rugs_product_11_006 _stock_status instock
wp post meta update $_rugs_product_11_006 _manage_stock yes
wp post meta update $_rugs_product_11_006 _backorders yes
wp post meta update $_rugs_product_11_006 _price 15.00
wp post meta update $_rugs_product_11_006 _regular_price 15.00
wp post meta update $_rugs_product_11_006 _sku ACR-006-11
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_rugs_product_11_006 --featured_image=true
_other_product_12=`wp post create ./post-content.txt --post_title="other" --post_type=product --post_status=publish --post_name=other --porcelain`
wp post meta update $_other_product_12 _visibility visible
wp post meta update $_other_product_12 _product_attributes '{"edb_material":{"name":"edb_material","value":"001|002|003|004|005|006","is_visible":1,"is_variation":1,"taxonomy":1}}' --format=json
wp post term set $_other_product_12 product_shipping_class accessories
wp post term set $_other_product_12 product_cat other
wp post term set $_other_product_12 product_type variable
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$_other_product_12 --featured_image=true
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg --post_id=$_other_product_12 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg --post_id=$_other_product_12 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg --post_id=$_other_product_12 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg --post_id=$_other_product_12 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg --post_id=$_other_product_12 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg --post_id=$_other_product_12 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg --post_id=$_other_product_12 
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg --post_id=$_other_product_12 
_other_product_12_001=`wp post create ./post-content.txt --post_title="other 001" --post_type=product_variation --post_status=publish --post_name=other_001 --post_parent="$_other_product_12"  --porcelain`
wp post meta update $_other_product_12_001 _visibility visible
wp post meta update $_other_product_12_001 attribute_edb_material 001
wp post meta update $_other_product_12_001 _stock 2
wp post meta update $_other_product_12_001 _stock_status instock
wp post meta update $_other_product_12_001 _manage_stock yes
wp post meta update $_other_product_12_001 _backorders yes
wp post meta update $_other_product_12_001 _price 15.00
wp post meta update $_other_product_12_001 _regular_price 15.00
wp post meta update $_other_product_12_001 _sku ACO-001-12
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg --post_id=$_other_product_12_001 --featured_image=true
_other_product_12_002=`wp post create ./post-content.txt --post_title="other 002" --post_type=product_variation --post_status=publish --post_name=other_002 --post_parent="$_other_product_12"  --porcelain`
wp post meta update $_other_product_12_002 _visibility visible
wp post meta update $_other_product_12_002 attribute_edb_material 002
wp post meta update $_other_product_12_002 _stock 2
wp post meta update $_other_product_12_002 _stock_status instock
wp post meta update $_other_product_12_002 _manage_stock yes
wp post meta update $_other_product_12_002 _backorders yes
wp post meta update $_other_product_12_002 _price 15.00
wp post meta update $_other_product_12_002 _regular_price 15.00
wp post meta update $_other_product_12_002 _sku ACO-002-12
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg --post_id=$_other_product_12_002 --featured_image=true
_other_product_12_003=`wp post create ./post-content.txt --post_title="other 003" --post_type=product_variation --post_status=publish --post_name=other_003 --post_parent="$_other_product_12"  --porcelain`
wp post meta update $_other_product_12_003 _visibility visible
wp post meta update $_other_product_12_003 attribute_edb_material 003
wp post meta update $_other_product_12_003 _stock 2
wp post meta update $_other_product_12_003 _stock_status instock
wp post meta update $_other_product_12_003 _manage_stock yes
wp post meta update $_other_product_12_003 _backorders yes
wp post meta update $_other_product_12_003 _price 15.00
wp post meta update $_other_product_12_003 _regular_price 15.00
wp post meta update $_other_product_12_003 _sku ACO-003-12
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg --post_id=$_other_product_12_003 --featured_image=true
_other_product_12_004=`wp post create ./post-content.txt --post_title="other 004" --post_type=product_variation --post_status=publish --post_name=other_004 --post_parent="$_other_product_12"  --porcelain`
wp post meta update $_other_product_12_004 _visibility visible
wp post meta update $_other_product_12_004 attribute_edb_material 004
wp post meta update $_other_product_12_004 _stock 2
wp post meta update $_other_product_12_004 _stock_status instock
wp post meta update $_other_product_12_004 _manage_stock yes
wp post meta update $_other_product_12_004 _backorders yes
wp post meta update $_other_product_12_004 _price 15.00
wp post meta update $_other_product_12_004 _regular_price 15.00
wp post meta update $_other_product_12_004 _sku ACO-004-12
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg --post_id=$_other_product_12_004 --featured_image=true
_other_product_12_005=`wp post create ./post-content.txt --post_title="other 005" --post_type=product_variation --post_status=publish --post_name=other_005 --post_parent="$_other_product_12"  --porcelain`
wp post meta update $_other_product_12_005 _visibility visible
wp post meta update $_other_product_12_005 attribute_edb_material 005
wp post meta update $_other_product_12_005 _stock 2
wp post meta update $_other_product_12_005 _stock_status instock
wp post meta update $_other_product_12_005 _manage_stock yes
wp post meta update $_other_product_12_005 _backorders yes
wp post meta update $_other_product_12_005 _price 15.00
wp post meta update $_other_product_12_005 _regular_price 15.00
wp post meta update $_other_product_12_005 _sku ACO-005-12
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg --post_id=$_other_product_12_005 --featured_image=true
_other_product_12_006=`wp post create ./post-content.txt --post_title="other 006" --post_type=product_variation --post_status=publish --post_name=other_006 --post_parent="$_other_product_12"  --porcelain`
wp post meta update $_other_product_12_006 _visibility visible
wp post meta update $_other_product_12_006 attribute_edb_material 006
wp post meta update $_other_product_12_006 _stock 2
wp post meta update $_other_product_12_006 _stock_status instock
wp post meta update $_other_product_12_006 _manage_stock yes
wp post meta update $_other_product_12_006 _backorders yes
wp post meta update $_other_product_12_006 _price 15.00
wp post meta update $_other_product_12_006 _regular_price 15.00
wp post meta update $_other_product_12_006 _sku ACO-006-12
wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg --post_id=$_other_product_12_006 --featured_image=true