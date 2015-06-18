gmodule.exports = function(grunt) {

    try {
        var configFile = grunt.file.readJSON('config.json');
    } catch (E) {
        console.error('Maybe you need to copy sample config?\n\n\t`cp config.sample.json config.json`\n');
        process.exit(1);
    }

    // Load/merge default config and local config vars.
    var config = require('merge')({
            "project_dir": __dirname,
            "log_dir": __dirname + '/logs',
            "build_dir": "./build",
            "notify": false,
            "npm": grunt.file.readJSON('package.json'),
            "bower": grunt.file.readJSON('bower.json'),
            "composer": grunt.file.readJSON('composer.json')
        },
        configFile
    );


    require('load-grunt-tasks')(grunt);


    grunt.initConfig({

        // Project configuration.
        cfg: config,

        // see: https://www.npmjs.com/package/grunt-bower-concat
        bower_concat: {
            theme: {
                dest: '<%= cfg.project_dir %>/src/themes/btk/js/_bower.js',
                cssDest: '<%= cfg.project_dir %>/src/themes/btk/css/_bower.css',
                // Handle package with no bower.json
                mainFiles: {
                    'css_browser_selector': 'css_browser_selector.js',
                    'jquery.event.move': 'js/jquery.event.move.js'
                }
            }
        },

        // see: https://www.npmjs.com/package/grunt-contrib-less
        less: {
            theme: {
                files: {
                    '<%= cfg.project_dir %>/src/themes/btk/style.css': '<%= cfg.project_dir %>/src/themes/btk/less/btk.less'
                }
                // },
                // tasks: [ 'autoprefixer:theme']
            }
        },


        // see: https://github.com/gruntjs/grunt-contrib-uglify
        uglify: {
            options: {
                screwIE8: true,
                mangle: false,
                sourceMap: false
            },
            theme: {
                files: {
                    '<%= cfg.project_dir %>/src/themes/btk/js/_all.min.js': [
                        '<%= cfg.project_dir %>/src/themes/btk/js/_bower.js', '<%= cfg.project_dir %>/src/themes/btk/js/_btk.js'
                    ]
                }
            }
        },

        // see: https://github.com/nDmitry/grunt-autoprefixer
        autoprefixer: {
            theme: {
                options: {
                    browsers: ['last 2 version', 'ie 9', 'ios 7']
                },
                src: '<%= cfg.project_dir %>/src/themes/btk/style.css'
            }
        },

        // see: https://www.npmjs.com/package/grunt-phplint
        phplint: {
            options: {
                phpCmd: "/usr/bin/php", // Or "c:\EasyPHP-5.3.8.1\PHP.exe"
            },
            theme: ['<%= cfg.project_dir %>/src/themes/btk/*.php']
        },

        // see: https://www.npmjs.com/package/grunt-contrib-concat
        concat: {
            options: {
                banner: '/* DO NOT EDIT, THIS FILE IS GENERATED */\n',
                separator: "\n",
            },
            theme: {
                options: {
                    separator: ";",
                },
                src: [
                    '<%= cfg.project_dir %>/src/themes/btk/**/*.js',
                    // Exclude these... ( note the "!" )
                    '!<%= cfg.project_dir %>/src/themes/btk/js/_all.min.js',
                    '!<%= cfg.project_dir %>/src/themes/btk/js/_bower.js',
                    '!<%= cfg.project_dir %>/src/themes/btk/js/_btk.js'
                ],
                dest: '<%= cfg.project_dir %>/src/themes/btk/js/_btk.js'
            }
        },

        // see: https://github.com/gruntjs/grunt-contrib-clean
        clean: {
            theme: ['<%= cfg.build_dir %>/themes/btk']
        },

        // see: https://www.npmjs.com/package/grunt-contrib-copy
        copy: {
            theme: {
                files: [{
                    expand: true,
                    cwd: '<%= cfg.project_dir %>/src/themes',
                    src: ['**'],
                    dest: '<%= cfg.build_dir %>/themes/'
                }, {
                    expand: true,
                    cwd: '<%= cfg.project_dir %>/src/bower/edb-icons/assets',
                    src: ['**'],
                    dest: '<%= cfg.build_dir %>/themes/btk/icons/'
                }]
            }
        },

        // see: https://www.npmjs.com/package/grunt-contrib-watch
        watch: {
            theme_js: {
                options: {
                    livereload: true
                },
                files: [
                    '<%= cfg.project_dir %>/src/themes/btk/**/*.js',
                    // exclude or hell-loop
                    '!<%= cfg.project_dir %>/src/themes/btk/js/_btk.js'
                ],
                tasks: ['clean:theme', 'concat:theme', 'copy:theme']
            },
            theme_less: {
                options: {
                    livereload: true
                },
                files: '<%= cfg.project_dir %>/src/themes/btk/**/*.less',
                tasks: ['clean:theme', 'less:theme', 'copy:theme']
            },
            theme_php: {
                options: {
                    livereload: true
                },
                files: '<%= cfg.project_dir %>/src/themes/btk/**/*.php',
                tasks: ['clean:theme', 'phplint:theme', 'copy:theme']
            }
        }

        ,
        // see: https://github.com/gruntjs/grunt-contrib-compress
        compress: {
            theme: {
                options: {
                    mode: 'zip',
                    archive: '<%= cfg.project_dir %>/build/themes/btk.zip'
                },
                files: [{
                    src: ['**'],
                    cwd: '<%= cfg.project_dir %>/build/themes/btk',
                    dest: 'btk/',
                    expand: true
                }]
            }
        },
        // see: https://www.npmjs.com/package/grunt-execute
        execute: {
            // nwp_deploy_development: {
            //   options: { args: [ '-j', '<%= cfg.project_dir %>/src/data/edb-development.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml' ] },
            //   src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            // },
            // nwp_themeonly_development: {
            //   options: { args: [ '-j', '<%= cfg.project_dir %>/src/data/edb-themeonly.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml' ] },
            //   src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            // },
            send_done_email: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/send-donemail.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            site_remove: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/site-remove.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            site_install: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/site-install.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            plugins_remove: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/plugins-remove.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            plugins_install: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/plugins-install.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            blog_create: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/blog-create.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            blog_delete: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/blog-delete.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            splash_create: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/splash-create.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            splash_delete: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/splash-delete.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            catalog_create: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/media/mock-catalog/catalog-create.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            catalog_delete: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/catalog-delete.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            theme_update: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/theme-update.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            woo_configure: {
                options: {
                    args: ['-j', '<%= cfg.project_dir %>/src/data/recipes/woo-configure.json', '-y', '<%= cfg.project_dir %>/wp-cli.yml']
                },
                src: ['<%= cfg.project_dir %>/node_modules/nwp/bin/nwp']
            },
            generate_catalog: {
                options: {
                    cwd: '<%= cfg.project_dir %>/src/data/media/mock-catalog/',
                    args: [config['gdrive-catalog']]
                },
                src: ['<%= cfg.project_dir %>/src/data/media/mock-catalog/tojson.js']
            }

        }

    });


    grunt.registerTask('build', ['clean', 'bower_concat', 'less', 'autoprefixer', 'concat', 'uglify', 'phplint', 'copy']);
    //grunt.registerTask('build_theme', [ 'clean:theme', 'bower_concat:theme' , 'less:theme', 'concat:theme',  'uglify:theme', 'copy:theme' ] );


    // grunt.registerTask('release', [ 'build', 'compress', 'execute:nwp_deploy_development' ] );
    // grunt.registerTask('install', [ 'build', 'compress', 'execute:nwp_themeonly_development' ] );

    grunt.registerTask('site:install', ["execute:site_install"])
    grunt.registerTask('site:remove', ["execute:site_remove"])
    grunt.registerTask('site:reset', ["site:remove", "site:install"])
    grunt.registerTask('site:email', ["execute:send_done_email"])

    grunt.registerTask('plugins:install', ["execute:plugins_install"])
    grunt.registerTask('plugins:remove', ["execute:plugins_remove"])
    grunt.registerTask('plugins:reset', ["plugins:remove", "plugins:install"])

    grunt.registerTask('blog:create', ["execute:blog_create"])
    grunt.registerTask('blog:delete', ["execute:blog_delete"])
    grunt.registerTask('blog:reset', ["blog:delete", "blog:create"])

    grunt.registerTask('splash:create', ["execute:splash_create"])
    grunt.registerTask('splash:delete', ["execute:splash_delete"])
    grunt.registerTask('splash:reset', ["splash:delete", "splash:create"])

    grunt.registerTask('catalog:create', ["execute:catalog_create"])
    grunt.registerTask('catalog:delete', ["execute:catalog_delete"])
    grunt.registerTask('catalog:reset', ["catalog:delete", "catalog:create"])


    grunt.registerTask('woo:configure', ["execute:woo_configure"])
    grunt.registerTask('theme:update', ["build", "compress", "execute:theme_update"])

    grunt.registerTask('release', ["execute:generate_catalog", "site:reset", "plugins:install", "splash:create", "blog:create", "woo:configure", "catalog:create", "install"])
    grunt.registerTask('install', ["theme:update", "site:email"])



    grunt.registerTask('work', ['build', 'watch']);

    // Default task(s).
    grunt.registerTask('default', ['build']);

};