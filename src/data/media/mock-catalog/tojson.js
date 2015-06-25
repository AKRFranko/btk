var argv, addToCat, basename, bindTerms, buildRecipe, cat_tree, createPost, createTerm, enableVariations, enableVisibility, fs, getCatVar, getPaths, importMedia, materials, output, readTree, recipe, setMaterial, setMockdata, setSKU, variant_cats, pad, getSKU, indexes, adler32, goo, cat_idx, genMediaVar;

adler32 = require('adler32');
fs = require('fs');

basename = require('path').basename;
cat_idx = 0;
cat_tree = {
    "sofas": ['2-seater', '3-seater'],
    "sofa-beds": [],
    "sectionals": ['left-facing', 'right-facing'],
    "coffee-tables": [],
    "armchairs": [],
    "benches-ottomans": [],
    "headboards": [],
    "storage": [],
    "accessories": ['pillows', 'rugs', 'other']
};

sku_tree = {
    "sofas": "SOF",
    "sofa-beds": "SOB",
    "sectionals": "SEC",
    "coffee-tables": "COF",
    "armchairs": "ARM",
    "benches-ottomans": "BEN",
    "headboards": "HEA",
    "storage": "STO",
    "accessories": "ACC",
    "pillows": "PIL",
    "rugs": "RUG",
    "other": "OTH",
    "2-seater": "2ST",
    "3-seater": "3ST",
    "left-facing": "LFT",
    "right-facing": "RGT"
}



materials = ["aluminium", "argon", "concrete", "emerald", "noise", "orange", "purple", "sky", "steel", "teal", "wine", "yolk"];

variant_cats = ["sofas", "sectionals", "sofa-beds"];

recipe = {
    "term": {
        "create": {}
    },
    "post": {
        "create": {},
        "meta": {
            "update": []
        },
        "term": {
            "set": []
        }
    },
    "media": {
        "import": {}
    },
    "eval": []
};

pad = function(n, width, z) {
    z = z || '0';
    n = n + '';
    return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

indexes = {}

getSKU = function(data, variant) {
    sub = data.sub ? sku_tree[data.sub] : 'ZZZ';
    sku = [sku_tree[data.cat], sub].join('-')
        // pnm = indexes[sku]  ?  (++indexes[sku]) : (indexes[sku] = 1);
        // full = sku + pad( pnm , 3);
    pnm = adler32.sum(new Buffer(data.name + (variant ? ' ' + variant : '')))
    full = sku + '-' + pnm.toString(32);
    return full.toUpperCase();
}

getPaths = function(cat, base) {
    var category_paths, hasSub, sub, _i, _len, _ref;
    if (base == null) {
        base = process.argv[process.argv.length - 1];
    }
    hasSub = cat_tree[cat].length > 0;
    category_paths = [];
    if (hasSub) {
        _ref = cat_tree[cat];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            sub = _ref[_i];
            category_paths.push({
                path: base + "/" + cat + "/" + sub,
                cat: cat,
                sub: sub
            });
        }
    } else {
        category_paths.push({
            path: base + "/" + cat,
            cat: cat,
            sub: null
        });
    }
    return category_paths.reduce(function(paths, path) {
        var names;
        names = fs.readdirSync(path.path);
        names = names.filter(function(f) {
            return !/^\./.test(f)
        });
        return paths.concat(names.map(function(name) {
            return {
                path: path.path + "/" + name,
                cat: path.cat,
                sub: path.sub
            };
        }));
    }, []);
};

genMediaVar = function(post_varname) {
    var index = genMediaVar.index ? genMediaVar.index : 0;
    genMediaVar.index = index + 1;
    return post_varname + "_media_" + index;
}

readTree = function() {
    var product_paths, products;
    product_paths = Object.keys(cat_tree).reduce(function(all, c) {
        return all.concat(getPaths(c));
    }, []);
    products = product_paths.map(function(path) {
        var product, descpath;
        product = path;
        product.name = basename(path.path).split('-').join(' ');
        product.slug = basename(path.path);
        product.varname = ("$prod_" + product.cat + (product.sub ? "_" + product.sub : "") + "_" + (basename(path.path))).replace(/\-/g, '_');
        product.hasVariants = !!~variant_cats.indexOf(path.cat);
        descpath = path.path + "/description.txt";
        pricepath = path.path + "/price.txt";
        try {
            fs.realpathSync(descpath);
        } catch (E) {
            descpath = null
        }
        try {
            fs.realpathSync(pricepath);
        } catch (E) {
            pricepath = null
        }
        if (descpath) {
            product.description = descpath;
        }
        if (pricepath) {
            product.price = fs.readFileSync(pricepath, 'utf8').trim().replace('$', '').replace(/[,\s]/g, '');
        } else {
            product.price = Math.floor(Math.random() * 300 + 5) + '.00';
        }
        if (product.hasVariants) {
            product.variants = materials;
        }
        return product;
    });
    return products;
};

getCatVar = function(cat, sub) {
    var strname;
    strname = sub ? cat + "_" + sub : "" + cat;
    return ("$cat_" + strname).replace(/\-/g, '_');
};

createTerm = function(term, parent) {
    var slugname, varname;
    if (parent == null) {
        parent = null;
    }
    slugname = parent ? parent + "-" + term : "" + term;
    varname = getCatVar((parent ? parent : term), (parent ? term : null));
    term = {
        args: {
            taxonomy: "product_cat",
            term: term
        },
        opts: {
            slug: slugname
        }
    };
    if (parent) {
        term.opts.parent = getCatVar(parent);
    }
    cat_idx++;
    recipe.eval.push({
        "args": {
            "php": "update_woocommerce_term_meta( " + varname + ", 'order', '" + cat_idx + "' );"
        }
    });
    return recipe.term.create[varname] = term;
};

enableVariations = function(post_varname) {
    recipe.post.meta.update.push({
        args: {
            id: "" + post_varname,
            key: "_product_attributes",
            value: JSON.stringify({
                edb_material: {
                    name: "edb_material",
                    value: materials.join('|'),
                    is_visible: 1,
                    is_variation: 1,
                    taxonomy: 1
                }
            })
        },
        opts: {
            format: 'json'
        }
    });
    return recipe.post.term.set.push({
        args: {
            id: "" + post_varname,
            "taxonomy": "product_type",
            "term": "variable"
        }
    });
};

enableFeaturedImage = function(post_varname, imageid) {
    recipe.post.meta.update.push({
        args: {
            id: "" + post_varname,
            key: "_product_image_gallery",
            value: "" + imageid
        }
    })
}


enableVisibility = function(post_varname) {
    return recipe.post.meta.update.push({
        args: {
            id: "" + post_varname,
            key: "_visibility",
            value: "visible"
        }
    });
};

setMaterial = function(post_varname, material) {
    return recipe.post.meta.update.push({
        args: {
            id: "" + post_varname,
            key: "attribute_edb_material",
            value: material
        }
    });
};

addToCat = function(post_varname, cat) {
    return recipe.post.term.set.push({
        args: {
            id: "" + post_varname,
            taxonomy: "product_cat",
            term: cat
        }
    });
};

setMockdata = function(post_varname) {
    recipe.post.meta.update.push({
        args: {
            id: "" + post_varname,
            key: "_stock_status",
            value: 'instock'
        }
    });
    recipe.post.meta.update.push({
        args: {
            id: "" + post_varname,
            key: "_stock",
            value: 10
        }
    });

};

setProductData = function(post_varname, key, value) {
    return recipe.post.meta.update.push({
        args: {
            id: "" + post_varname,
            key: key,
            value: value
        }
    })
};

setSKU = function(post_varname, data, variant) {
    var cat, slug;
    cat = data.sub ? data.cat + "_" + data.sub : "" + data.cat;
    slug = post_varname.replace(/\$/, '');
    return setProductData(post_varname, '_sku', getSKU(data, variant));
};

bindTerms = function(post_varname, variants) {
    var value;
    if (variants.length > 1) {
        value = "array('" + (variants.join("','")) + "')";
    } else {
        value = "'" + variants[0] + "'";
    }
    return recipe["eval"].push({
        args: {
            php: "wp_set_object_terms( " + post_varname + ", " + value + ", 'edb_material');"
        }
    });
};
var readFolderImages = function(folder) {
    var files = fs.readdirSync(folder).filter(function(f) {
        return /(jpg|png|gif|jpeg)/.test(f)
    })
    return files.map(function(f) {
        return folder + "/" + f
    })
}

importMedia = function(data) {
    var all, angles, featured, scenes, tech, mats, image_varnames, mat_varnames;
    image_varnames = [];
    mat_varnames = [];
    angles = readFolderImages(data.path + "/images/cutout");
    scenes = readFolderImages(data.path + "/images/ambiance");
    try {
        tech = readFolderImages(data.path + "/images/tech");
    } catch (e) {
        tech = [];
    }
    try {
        mats = readFolderImages(data.path + "/images/materials");
    } catch (e) {
        mats = [];
    }
    // featured = data.path + "/images/cutout/front.jpg";
    // angles = [data.path + "/images/cutout/left.jpg", data.path + "/images/cutout/right.jpg", data.path + "/images/cutout/top.jpg"];
    // scenes = [data.path + "/images/ambiance/01.jpg", data.path + "/images/ambiance/02.jpg", data.path + "/images/ambiance/03.jpg", data.path + "/images/ambiance/04.jpg"];
    // tech = [data.path + "/images/tech/01.jpg", data.path + "/images/tech/02.jpg"];
    try {
        var features = readFolderImages(data.path + "/images/listing");
        featured = names.shift()
    } catch (E) {
        featured = angles.shift();
    }
    all = [angles, scenes].reduce(function(a, b) {
        if (!a) {
            return b;
        } else {
            return a.concat(b);
        }
    });
    var feat_varname = genMediaVar(data.varname);
    image_varnames.push(feat_varname);
    recipe.media["import"][feat_varname] = {
        args: {
            file: featured
        },
        opts: {
            post_id: data.varname,
            featured_image: true
        }
    };

    all.map(function(path) {
        var sub_varname = genMediaVar(data.varname);
        image_varnames.push(sub_varname);
        recipe.media["import"][sub_varname] = {
            args: {
                file: path
            },
            opts: {
                post_id: data.varname
            }
        };
    });
    if (data.hasVariants) {
        var mat_names = [].concat(materials);
        mats.map(function(path) {
            var sub_varname = genMediaVar(data.varname);
            var mat_name = mat_names.shift();

            recipe.media["import"][sub_varname] = {
                args: {
                    file: path
                },
                opts: {
                    post_id: sub_varname,
                    featured_image: true
                }
            };
            recipe["eval"].push({
                args: {
                    "php": "update_post_meta( " + data.varname + ", '_product_variation_image_" + mat_name + "', '" + sub_varname + "' );"
                }
            });
        });
    }

    image_varnames.map(function(image_varname) {
        recipe['eval'].push({
            "args": {
                "php": "update_post_meta( " + data.varname + ", '_product_image_gallery', '" + image_varname + "' );"
            }
        });
    });

    if (tech.length) {
        var tech_varname = genMediaVar(data.varname);
        recipe.media["import"][tech_varname] = {
            args: {
                file: tech[0]
            }
        }
        recipe['eval'].push({
            "args": {
                "php": "update_post_meta( " + data.varname + ", '_product_technical_drawing', '" + tech_varname + "' );"
            }
        });
    }



};

createPost = function(data) {
    enableVisibility(data.varname);
    importMedia(data);
    if (data.sub) {
        addToCat(data.varname, data.sub);
    } else {
        addToCat(data.varname, data.cat);
    }
    recipe.post.create[data.varname] = {
        args: {
            file: data.description
        },
        opts: {
            post_title: data.name,
            post_type: 'product',
            post_status: 'publish',
            post_excerpt: 'Artisanal quality of life Lufthansa, Winkreative hand-crafted eclectic Toto Singapore Fast Lane impeccable flat white.',
            post_name: data.slug
        }
    };
    if (data.hasVariants) {
        enableVariations(data.varname);
        bindTerms(data.varname, materials);
        return data.variants.forEach(function(variant) {
            enableVisibility(data.varname + "_" + variant);
            setMaterial(data.varname + "_" + variant, variant);
            setMockdata(data.varname + "_" + variant);
            setProductData(data.varname + "_" + variant, '_price', data.price);
            setProductData(data.varname + "_" + variant, '_regular_price', data.price);
            setSKU(data.varname + "_" + variant, data, variant);
            bindTerms(data.varname + "_" + variant, [variant]);
            return recipe.post.create[data.varname + "_" + variant] = {
                opts: {
                    post_title: data.name + " - " + variant,
                    post_type: "product_variation",
                    post_status: "publish",
                    post_parent: "" + data.varname,
                    post_name: data.slug + "-" + variant
                }
            };
        });
    } else {
        setMockdata(data.varname);
        setProductData(data.varname, '_price', data.price);
        setProductData(data.varname, '_regular_price', data.price);
        return setSKU(data.varname, data);
    }
};

buildRecipe = function() {
    var tree;
    Object.keys(cat_tree).forEach(function(cat) {
        var sub, subcats, _i, _len, _results;
        subcats = cat_tree[cat];
        createTerm(cat);
        if (subcats.length > 0) {
            _results = [];
            for (_i = 0, _len = subcats.length; _i < _len; _i++) {
                sub = subcats[_i];
                _results.push(createTerm(sub, cat));
            }
            return _results;
        }
    });
    tree = readTree();
    tree.forEach(function(product) {
        return createPost(product);
    });
    recipe.option = {
        update: [{
            args: {
                key: 'woocommerce_default_country',
                value: 'CA'
            }
        }, {
            args: {
                key: 'woocommerce_allowed_countries',
                value: 'CA'
            }
        }, {
            args: {
                key: 'woocommerce_specific_allowed_countries',
                value: 'CA'
            }
        }, {
            args: {
                key: 'woocommerce_currency',
                value: 'CAD'
            }
        }]
    };
    return recipe;
};

output = JSON.stringify(buildRecipe());

//console.log(output);
console.log('updated catalog-create.json!');

fs.writeFileSync('catalog-create.json', output.replace(/\\/g, '\\\\\\'));

// ---
// generated by coffee-script 1.9.0