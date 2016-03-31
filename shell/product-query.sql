SELECT p.*,
GROUP_CONCAT(pm.meta_key ORDER BY pm.meta_key DESC SEPARATOR '||') as meta_keys, 
GROUP_CONCAT(pm.meta_value ORDER BY pm.meta_key DESC SEPARATOR '||') as meta_values,
GROUP_CONCAT(x.taxonomy SEPARATOR '||') as term_taxnonomies, 
GROUP_CONCAT(t.name  SEPARATOR '||') as term_values
FROM wp_posts AS p 
LEFT JOIN wp_postmeta pm on pm.post_id = p.ID
LEFT JOIN wp_term_relationships AS tr ON(tr.object_id = p.ID)
LEFT JOIN wp_term_taxonomy AS x ON(x.term_taxonomy_id = tr.term_taxonomy_id)
LEFT JOIN wp_terms AS t ON(t.term_id = x.term_id)
WHERE p.post_type = 'product' and p.post_status = 'publish'
GROUP BY p.ID
