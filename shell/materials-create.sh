#!/bin/bash
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Coton" --post_status=publish --post_excerpt='{:en}100% cotton {:}{:fr}100% coton  {:}' --porcelain`
wp media import ./data/materials/001/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Linen" --post_status=publish --post_excerpt='{:en}40% viscose 20% linen 20% polyester 20% cotton {:}{:fr}40% viscose  20% lin  20% polyester  20% coton  {:}' --porcelain`
wp media import ./data/materials/002/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Linen" --post_status=publish --post_excerpt='{:en}40% viscose 20% linen 20% polyester 20% cotton {:}{:fr}40% viscose  20% lin  20% polyester  20% coton  {:}' --porcelain`
wp media import ./data/materials/003/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Tweed" --post_status=publish --post_excerpt='{:en}80% viscose 20% linen {:}{:fr}80% viscose  20% lin  {:}' --porcelain`
wp media import ./data/materials/004/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Epingle" --post_status=publish --post_excerpt='{:en}76% cotton 24% acrylic {:}{:fr}76% coton  24% acrylique  {:}' --porcelain`
wp media import ./data/materials/005/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Flannel" --post_status=publish --post_excerpt='{:en}2% SPA 88% polyester 10% viscose {:}{:fr}2% SPA  88% polyester  10% viscose  {:}' --porcelain`
wp media import ./data/materials/006/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Canevas" --post_status=publish --post_excerpt='{:en}70% cotton 30% linen {:}{:fr}70% coton  30% lin  {:}' --porcelain`
wp media import ./data/materials/007/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Canevas" --post_status=publish --post_excerpt='{:en}70% cotton 30% linen {:}{:fr}70% coton  30% lin  {:}' --porcelain`
wp media import ./data/materials/008/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Velvet" --post_status=publish --post_excerpt='{:en}89% cotton 11% polyester {:}{:fr}89% coton  11% polyester  {:}' --porcelain`
wp media import ./data/materials/009/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Canevas" --post_status=publish --post_excerpt='{:en}70% cotton 30% linen {:}{:fr}70% coton  30% lin  {:}' --porcelain`
wp media import ./data/materials/010/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Tissage" --post_status=publish --post_excerpt='{:en}10% cotton 12% polyester 24% linen 54% viscose {:}{:fr}10% coton  12% polyester  24% lin  54% viscose  {:}' --porcelain`
wp media import ./data/materials/011/large.jpg --post_id=$last_post_id
last_post_id=`wp post create --post_type=edb_material_desc --post_title="Velvet" --post_status=publish --post_excerpt='{:en}89% cotton 11% polyester {:}{:fr}89% coton  11% polyester  {:}' --porcelain`
wp media import ./data/materials/012/large.jpg --post_id=$last_post_id