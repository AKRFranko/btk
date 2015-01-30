module.exports = function(grunt) {
  
  try{
    var configFile = grunt.file.readJSON('config.json');
  }catch( E ){
    console.error( 'Maybe you need to copy sample config?\n\n\t`cp config.sample.json config.json`\n');
    process.exit( 1 );
  }

  // Load/merge default config and local config vars.
  var config = require('merge')( 
    {
      "project_dir": __dirname,
      "log_dir": __dirname+'/logs',
      "build_dir":   "./build",
      "npm":           grunt.file.readJSON('package.json'),
      "bower":         grunt.file.readJSON('bower.json'),
      "composer":   grunt.file.readJSON('composer.json')
    }, 
    configFile
  );
  

  require('load-grunt-tasks')( grunt );
  
 
  grunt.initConfig({

     // Project configuration.
    cfg: config,

    // see: https://www.npmjs.com/package/grunt-bower-concat
    bower_concat: { 
       theme: {
            dest: '<%= cfg.project_dir %>/src/themes/btk/js/_bower.js',
            cssDest: '<%= cfg.project_dir %>/src/themes/btk/css/_bower.css'
       },
       plugin: {
            dest: '<%= cfg.project_dir %>/src/plugins/btk/admin/js/_bower.js',
            cssDest: '<%= cfg.project_dir %>/src/plugins/btk/admin/css/_bower.css'
       }
    },

    // see: https://www.npmjs.com/package/grunt-contrib-less
    less: {
        theme: {
            files: {
                '<%= cfg.project_dir %>/src/themes/btk/style.css': '<%= cfg.project_dir %>/src/themes/btk/less/btk.less'
            },
            tasks: [ 'autoprefixer:theme']
        },
        plugin: {
            files: {
                '<%= cfg.project_dir %>/src/themes/btk/admin/css/style.css': '<%= cfg.project_dir %>/src/themes/btk/admin/less/btk.less'
            }
        }
    },
    // see: https://github.com/nDmitry/grunt-autoprefixer
    autoprefixer: {
         theme: {
             src: '<%= cfg.project_dir %>/src/themes/btk/style.css'
        }
    },

    // see: https://www.npmjs.com/package/grunt-contrib-concat
    concat: {
        options: {
            separator: "\n",
        },
        theme: {
            options: {
                separator: ";",
            },
            src: [
                '<%= cfg.project_dir %>/src/themes/btk/**/*.js',
                // Exclude these...
                '!<%= cfg.project_dir %>/src/themes/btk/js/_bower.js',
                '!<%= cfg.project_dir %>/src/themes/btk/js/_btk.js'
            ],
            dest: '<%= cfg.project_dir %>/src/themes/btk/js/_btk.js'
        },
        plugin: {
            options: {
                separator: ";",
            },
            src: [
                '<%= cfg.project_dir %>/src/plugins/btk/**/*.js',
                // Exclude these...
                '!<%= cfg.project_dir %>/src/plugins/btk/admin/js/_bower.js',
                '!<%= cfg.project_dir %>/src/plugins/btk/admin/js/_btk.js'
            ],
            dest: '<%= cfg.project_dir %>/src/plugins/btk/admin/js/_btk.js'
        }
    },

    // see: https://github.com/gruntjs/grunt-contrib-clean
    clean: {
        theme: [  '<%= cfg.build_dir %>/themes/btk' ],
        plugin: [  '<%= cfg.build_dir %>/plugins/btk' ]
    },

    // see: https://www.npmjs.com/package/grunt-contrib-copy
    copy: {
        theme: {
            files: [{
                expand: true, 
                cwd: '<%= cfg.project_dir %>/src/themes',
                src:   [ '**' ],
                dest: '<%= cfg.build_dir %>/themes/'
            }]
        },
        plugin: {
            files: [{
                expand: true, 
                cwd: '<%= cfg.project_dir %>/src/plugins',
                src:   [ '**' ],
                dest: '<%= cfg.build_dir %>/plugins/'
            }]
        }
    },

    // see: https://www.npmjs.com/package/grunt-contrib-watch
    watch: {
        theme_js: {
            options: { livereload: true },
            files: [
                '<%= cfg.project_dir %>/src/themes/btk/**/*.js',
                // exclude or hell-loop
                '!<%= cfg.project_dir %>/src/themes/btk/js/_btk.js'
            ],
            tasks: ['concat:theme', 'copy:theme']
        },
        theme_less: {
            options: { livereload: true },
            files: '<%= cfg.project_dir %>/src/themes/btk/**/*.less',
            tasks: ['less:theme', 'copy:theme']
        },
        theme_php: {
            options: { livereload: false },
            files: '<%= cfg.project_dir %>/src/themes/btk/**/*.php',
            tasks: ['copy:theme']
        },
        plugin_js: {
            options: { livereload: true },
            files: [
                '<%= cfg.project_dir %>/src/plugins/btk/**/*.js',
                // exclude or hell-loop
                '!<%= cfg.project_dir %>/src/plugins/btk/admin/js/_btk.js'
            ],
            tasks: ['concat:plugin', 'copy:plugin']
        },
        plugin_less: {
            options: { livereload: true },
            files: '<%= cfg.project_dir %>/src/plugins/btk/**/*.less',
            tasks: ['less:plugin', 'copy:plugin']
        },
        plugin_php: {
            options: { livereload: false },
            files: '<%= cfg.project_dir %>/src/plugins/btk/**/*.php',
            tasks: ['copy:plugin']
        },
    }

    /*,
    // see: https://github.com/gruntjs/grunt-contrib-compress
    compress: {
        theme: {
            options: {
                mode: 'tgz'
            },
            files: [
                { src: [ ] }
            ]
        }
    }*/

  });
    


  grunt.registerTask('build', [ 'clean', 'bower_concat' , 'less', 'concat', 'copy' ] );
  grunt.registerTask('build_theme', [ 'clean:theme', 'bower_concat:theme' , 'less:theme', 'concat:theme', 'copy:theme' ] );
  grunt.registerTask('build_plugin', [ 'clean:plugin',  'bower_concat:plugin' , 'less:plugin', 'concat:plugin', 'copy:plugin' ] );

  grunt.registerTask('work', [   'build', 'watch' ] );

  // Default task(s).
  grunt.registerTask('default', ['build']);

};
