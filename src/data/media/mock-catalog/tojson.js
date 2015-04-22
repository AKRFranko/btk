var addToCat, basename, bindTerms, buildRecipe, cat_tree, createPost, createTerm, enableVariations, enableVisibility, fs, getCatVar, getPaths, importMedia, materials, output, readTree, recipe, setMaterial, setMockdata, setSKU, variant_cats;

fs = require('fs');

basename = require('path').basename;

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

materials = ["velvet", "concrete", "cream", "coffee", "pumpkin"];

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
    "import": []
  },
  "eval": []
};

getPaths = function(cat, base) {
  var category_paths, hasSub, sub, _i, _len, _ref;
  if (base == null) {
    base = __dirname;
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
    return paths.concat(names.map(function(name) {
      return {
        path: path.path + "/" + name,
        cat: path.cat,
        sub: path.sub
      };
    }));
  }, []);
};

readTree = function() {
  var product_paths, products;
  product_paths = Object.keys(cat_tree).reduce(function(all, c) {
    return all.concat(getPaths(c));
  }, []);
  return products = product_paths.map(function(path) {
    var product;
    product = path;
    product.name = basename(path.path).split('-').join(' ');
    product.slug = basename(path.path);
    product.varname = ("$prod_" + product.cat + (product.sub ? "_" + product.sub : "") + "_" + (basename(path.path))).replace(/\-/g, '_');
    product.hasVariants = !!~variant_cats.indexOf(path.cat);
    product.description = path.path + "/description.txt";
    if (product.hasVariants) {
      product.variants = materials;
    }
    return product;
  });
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
    term.opts.parent = parent;
  }
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
      value: Math.floor(Math.random() * 20 + 5)
    }
  });
  return recipe.post.meta.update.push({
    args: {
      id: "" + post_varname,
      key: "_price",
      value: Math.floor(Math.random() * 300 + 5) + '.00'
    }
  });
};

setSKU = function(post_varname, data) {
  var cat, slug;
  cat = data.sub ? data.cat + "_" + data.sub : "" + data.cat;
  slug = post_varname.replace(/\$/, '');
  return recipe.post.meta.update.push({
    args: {
      id: "" + post_varname,
      key: "_sku",
      value: (cat + "_" + slug).replace(/\-/g, '_')
    }
  });
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

importMedia = function(data) {
  var all, angles, featured, scenes, tech;
  featured = data.path + "/images/angles/front.jpg";
  angles = [data.path + "/images/angles/left.jpg", data.path + "/images/angles/right.jpg", data.path + "/images/angles/top.jpg"];
  scenes = [data.path + "/images/scenes/01.jpg", data.path + "/images/scenes/02.jpg", data.path + "/images/scenes/03.jpg", data.path + "/images/scenes/04.jpg"];
  tech = [data.path + "/images/tech/01.jpg", data.path + "/images/tech/02.jpg"];
  all = [angles, scenes, tech].reduce(function(a, b) {
    if (!a) {
      return b;
    } else {
      return a.concat(b);
    }
  });
  recipe.media["import"].push({
    args: {
      file: featured
    },
    opts: {
      post_id: data.varname,
      featured_image: true
    }
  });
  all.map(function(path) {
    return recipe.media["import"].push({
      args: {
        file: path
      },
      opts: {
        post_id: data.varname
      }
    });
  });
  if (data.hasVariations) {
    return materials.forEach(function(mat) {
      recipe.media["import"].push({
        args: {
          file: data.path + "/images/materials/" + mat + "/front.jpg"
        },
        opts: {
          post_id: data.varname + "_" + mat,
          featured_image: true
        }
      });
      recipe.media["import"].push({
        args: {
          file: data.path + "/images/materials/" + mat + "/left.jpg"
        },
        opts: {
          post_id: data.varname + "_" + mat
        }
      });
      recipe.media["import"].push({
        args: {
          file: data.path + "/images/materials/" + mat + "/right.jpg"
        },
        opts: {
          post_id: data.varname + "_" + mat
        }
      });
      return recipe.media["import"].push({
        args: {
          file: data.path + "/images/materials/" + mat + "/top.jpg"
        },
        opts: {
          post_id: data.varname + "_" + mat
        }
      });
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
      setSKU(data.varname + "_" + variant, data);
      bindTerms(data.varname + "_" + variant, [variant]);
      return recipe.post.create[data.varname + "_" + variant] = {
        opts: {
          post_title: "{data.name} - " + variant,
          post_type: "product_variation",
          post_status: "publish",
          post_parent: "" + data.varname,
          post_name: data.slug + "-" + variant
        }
      };
    });
  } else {
    setMockdata(data.varname);
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
    update: [
      {
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
      }
    ]
  };
  return recipe;
};

output = JSON.stringify(buildRecipe());

console.log(output);

fs.writeFileSync('catalog-create.json', output.replace(/\\/g, '\\\\\\'));

// ---
// generated by coffee-script 1.9.0