#!/bin/env php
<?php


$materials = json_decode(file_get_contents('./data/materials/data.json'), true);
// var_dump($materials);

$script = array("#!/bin/bash");
foreach( $materials as $material ){
  $en = '';
  $fr = '';
  foreach($material['composition'] as $bi){
    $en.=$bi['en']." ";
    $fr.=$bi['fr']."  ";
  }
  $comp = "{:en}$en{:}{:fr}$fr{:}";
  $script[]='last_post_id=`wp post create --post_type=edb_material_desc --post_title="'.$material['name'].'" --post_status=publish --post_excerpt='.escapeshellarg( $comp ).' --porcelain`';
  $script[]='wp media import ./data/materials/'.$material['edb_material'].'/large.jpg --post_id=$last_post_id';  
}

$shell_script = implode("\n", $script );
file_put_contents('./shell/materials-create.sh', $shell_script );
// $numbers = array(1,2,y3,4,5,6,7,8,9,10,11,12,51,52,53,54,55,56,57,58,59,60,61,62,63);
 
// $materials=array();
 
 
// foreach( $numbers as $n ){
//   $materials[] = str_pad( $n, 3, '0', STR_PAD_LEFT )."\n";
// }
// $recipe=array();
// foreach( $materials as $material ){
//   $material=trim($material);
//   $json = array( 'edb_material'=> $material, 'name'=> "{:en}$material{:}{:fr}$material{:}", 'color'=> "{:en}$material{:}{:fr}$material{:}", 'composition'=> array(
//     array('en'=>'','fr'=>''),
//     array('en'=>'','fr'=>''),
//     array('en'=>'','fr'=>''),
//     array('en'=>'','fr'=>''),
//     array('en'=>'','fr'=>''),
//     array('en'=>'','fr'=>''),
//     array('en'=>'','fr'=>''),
//     array('en'=>'','fr'=>'')
//     ) );
//     $recipe[$material]  = $json;
//   // mkdir("./data/materials/$material", 0777, true );
//   // 
// }
// file_put_contents( "./data/materials/data.json", json_encode($recipe, JSON_PRETTY_PRINT ) );
?>