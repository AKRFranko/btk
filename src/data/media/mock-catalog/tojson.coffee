fs = require 'fs'
basename= require( 'path').basename

cat_tree = 
	"sofas": [ '2-seater', '3-seater']
	"sofa-beds": []
	"sectionals": [ 'left-facing', 'right-facing']
	"coffee-tables": []
	"armchairs": []
	"benches-ottomans": []
	"headboards": []
	"storage": []
	"accessories": ['pillows','rugs','other']

materials = ["velvet","concrete","cream","coffee", "pumpkin"]
variant_cats = [ "sofas", "sectionals", "sofa-beds" ]

recipe = {
	"term": { "create": {} },
	"post": { "create": {}, "meta": { "update": [] }, "term": { "set": [] } },
	"media": {"import":  [] },
	"eval": []
}


# readProducts = ( cat, sub, products )->
# 	if cat then console.log "category: #{cat}"
# 	if sub then console.log "sub-category: #{sub}"
# 	if products then console.log "products:", products 
# 	console.log "____"
# 	return products
	
# readCategory = ( cat, sub )->	
# 	subnames = cat_tree[cat]
# 	base_path = "#{__dirname}/#{cat}" + ( if 'string' is typeof sub then "/#{sub}" else "" )
# 	product_paths = []
# 	if subnames.length > 0 and !sub
# 		subnames.forEach ( sub )->
# 			product_paths = product_paths.concat readCategory( cat, sub )
# 	else
# 		console.log "base_path", base_path
# 		products = fs.readdirSync base_path
# 		products.forEach ( name )-> 
# 			product_paths.push "#{base_path}/#{name}"
# 	return product_paths
	
getPaths = ( cat, base=__dirname )->
	hasSub = cat_tree[cat].length > 0
	category_paths = []
	if hasSub
		for sub in cat_tree[cat]
			category_paths.push { path: "#{base}/#{cat}/#{sub}", cat: cat, sub: sub }
	else
		category_paths.push { path: "#{base}/#{cat}", cat: cat, sub: null }
	return category_paths.reduce ( paths, path )->
		names = fs.readdirSync( path.path )
		paths.concat names.map ( name )-> return { path: "#{path.path}/#{name}", cat: path.cat, sub: path.sub }
	, []
	
# hasVariations = ~variant_cats.indexOf( cat )
# 	hasSubcategories = cat_tree[cat].length > 0
readTree = ( )->
	product_paths = Object.keys( cat_tree ).reduce ( all, c )-> 
		all.concat getPaths c
	, []
	products = product_paths.map ( path )->
		product = path
		product.name = basename( path.path).split('-').join(' ')
		product.slug = basename( path.path)
		product.varname = "$prod_#{product.cat}#{if product.sub then "_#{product.sub}" else ""}_#{basename path.path}".replace(/\-/g,'_')
		product.hasVariants =  !!~variant_cats.indexOf( path.cat )
		product.description = "#{path.path}/description.txt"
		if product.hasVariants then product.variants = materials
		return product

getCatVar = ( cat, sub )->
	strname = if sub then "#{cat}_#{sub}" else "#{cat}"
	return "$cat_#{strname}".replace(/\-/g,'_')

createTerm = ( term, parent=null)->
	slugname = if parent then "#{parent}-#{term}" else "#{term}"
	varname = getCatVar (if parent then parent else term), (if parent then term else null )
	term=
		args: 
			taxonomy: "product_cat"
			term: term
		opts:
			slug: slugname
			# description: "This category is for #{term} products."
	if parent then term.opts.parent = parent
	recipe.term.create[varname]=term

enableVariations = ( post_varname )->
	recipe.post.meta.update.push
		args:
			id: "#{post_varname}"
			key: "_product_attributes"
			value: JSON.stringify
				edb_material:
					name: "edb_material"
					value: materials.join('|')
					is_visible: 1
					is_variation: 1
					taxonomy: 1
		opts: format: 'json'	
	recipe.post.term.set.push
		args: id: "#{post_varname}", "taxonomy": "product_type", "term": "variable"

enableVisibility = ( post_varname )->
	recipe.post.meta.update.push
		args: id: "#{post_varname}", key: "_visibility", value: "visible"
	
setMaterial = ( post_varname, material )->
	recipe.post.meta.update.push
		args: id: "#{post_varname}", key: "attribute_edb_material", value: material 

addToCat = ( post_varname, cat )->
	recipe.post.term.set.push
		args:  id: "#{post_varname}", taxonomy: "product_cat", term: cat


setMockdata = ( post_varname )->
	recipe.post.meta.update.push
		args: id: "#{post_varname}", key: "_stock_status", value: 'instock' 
	recipe.post.meta.update.push
		args: id: "#{post_varname}", key: "_stock", value: Math.floor( Math.random() * 20 + 5 )
	recipe.post.meta.update.push
		args: id: "#{post_varname}", key: "_price", value: Math.floor( Math.random() * 300 + 5 ) + '.00'

setSKU = ( post_varname, data )->
	cat  = if data.sub then  "#{data.cat}_#{data.sub}" else "#{data.cat}"
	slug =  post_varname.replace(/\$/,'')
	recipe.post.meta.update.push
		args: id: "#{post_varname}", key: "_sku", value: "#{cat}_#{slug}".replace(/\-/g, '_')
	
bindTerms = ( post_varname, variants )->			
	if variants.length > 1
		value = "array('#{variants.join("','")}')"
	else
		value = "'#{variants[0]}'"
	recipe.eval.push
		args: php: "wp_set_object_terms( #{post_varname}, #{value}, 'edb_material');" 

importMedia = ( data )->
	featured = "#{data.path}/images/angles/front.jpg"
	angles = [
		"#{data.path}/images/angles/left.jpg"
		"#{data.path}/images/angles/right.jpg"
		"#{data.path}/images/angles/top.jpg"
	]
	scenes = [
		"#{data.path}/images/scenes/01.jpg"
		"#{data.path}/images/scenes/02.jpg"
		"#{data.path}/images/scenes/03.jpg"
		"#{data.path}/images/scenes/04.jpg"
	]
	tech = [
		"#{data.path}/images/tech/01.jpg"
		"#{data.path}/images/tech/02.jpg"
	]
	all = [angles, scenes, tech ].reduce ( a, b )->
		if !a then b else a.concat b
	recipe.media.import.push
		args: file: featured
		opts: post_id: data.varname, featured_image: true
	all.map ( path )->
		recipe.media.import.push
			args: file: path
			opts: post_id: data.varname
	if data.hasVariations
		materials.forEach ( mat )->
			recipe.media.import.push
				args: file: "#{data.path}/images/materials/#{mat}/front.jpg"
				opts: post_id: "#{data.varname}_#{mat}", featured_image: true
			recipe.media.import.push
				args: file: "#{data.path}/images/materials/#{mat}/left.jpg"
				opts: post_id: "#{data.varname}_#{mat}"
			recipe.media.import.push
				args: file: "#{data.path}/images/materials/#{mat}/right.jpg"
				opts: post_id: "#{data.varname}_#{mat}"
			recipe.media.import.push
				args: file: "#{data.path}/images/materials/#{mat}/top.jpg"
				opts: post_id: "#{data.varname}_#{mat}"


createPost = ( data )->
	enableVisibility( data.varname )
	importMedia( data )
	if data.sub
		addToCat data.varname, data.sub
	else
		addToCat data.varname, data.cat
	recipe.post.create[data.varname]=
		args:
			file: data.description
		opts:
			post_title: data.name
			post_type: 'product'
			post_status: 'publish'
			post_excerpt: 'Artisanal quality of life Lufthansa, Winkreative hand-crafted eclectic Toto Singapore Fast Lane impeccable flat white.'
			post_name: data.slug
	if data.hasVariants

		enableVariations( data.varname )
		
		bindTerms data.varname, materials
		data.variants.forEach ( variant )->
			enableVisibility( "#{data.varname}_#{variant}" )
			setMaterial  "#{data.varname}_#{variant}", variant
			setMockdata  "#{data.varname}_#{variant}"
			setSKU "#{data.varname}_#{variant}", data
			bindTerms "#{data.varname}_#{variant}", [ variant ]
			recipe.post.create["#{data.varname}_#{variant}"]=
				opts:
					post_title: "{data.name} - #{variant}"
					post_type: "product_variation"
					post_status:"publish"
					post_parent: "#{data.varname}"
					post_name: "#{data.slug}-#{variant}"
	else
		setMockdata  data.varname
		setSKU data.varname, data

buildRecipe = ()->
	Object.keys( cat_tree ).forEach ( cat )->
		subcats = cat_tree[cat]
		createTerm cat
		if subcats.length > 0
			for sub in subcats
				createTerm sub, cat
	tree = readTree()
	tree.forEach ( product )->
		createPost product 
	recipe.option=
		update: [
			{ args: key: 'woocommerce_default_country', value: 'CA' }
			{ args: key: 'woocommerce_allowed_countries', value: 'CA' }
			{ args: key: 'woocommerce_specific_allowed_countries', value: 'CA' }			
			{ args: key: 'woocommerce_currency', value: 'CAD' }			
		]
	recipe


output = JSON.stringify buildRecipe() 
console.log output
fs.writeFileSync 'catalog-create.json', output.replace(/\\/g, '\\\\\\')
