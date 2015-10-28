/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    // Metadata.
    pkg: grunt.file.readJSON('package.json'),
    banner: '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
      ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n',
    jade: {
      compile: {
        options: {
          pretty: true
        },
        files: {
          'public/index.html': ['views/index.jade']
        }
      }
    },
    jshint: {
      options: {
        curly: true,
        eqeqeq: true,
        immed: true,
        latedef: true,
        newcap: true,
        noarg: true,
        sub: true,
        undef: true,
        unused: true,
        boss: true,
        eqnull: true,
        browser: true,
        globals: {
          jQuery: true
        }
      },
      gruntfile: {
        src: 'Gruntfile.js'
      },
      lib_test: {
        src: ['lib/**/*.js', 'test/**/*.js']
      }
    },
    qunit: {
      files: ['test/**/*.html']
    },
    watch: {
      scripts: {
        files: 'javascripts/*.coffee',
        tasks: ['coffee'],
      },
      css: {
        files: 'stylesheets/*.scss',
        tasks: ['sass'],
      },
      jade: {
        files: 'views/*.jade',
        tasks: ['jade']
      },
      gruntfile: {
        files: '<%= jshint.gruntfile.src %>',
        tasks: ['jshint:gruntfile']
      },
      lib_test: {
        files: '<%= jshint.lib_test.src %>',
        tasks: ['jshint:lib_test', 'qunit']
      }
    },
    sass: {
      dist: {
        files: {
          'public/stylesheets/index.css': 'stylesheets/index.scss',
          'public/stylesheets/stylish-portfolio.css': 'stylesheets/stylish-portfolio.scss'
        }
      }
    },
    coffee: {
      compile: {
        files: {
          'public/javascripts/index.js': 'javascripts/index.coffee'
        }
      }
    },
    connect: {
      server: {
        options: {
          port: 3000,
          base: 'public'
        }
      }
    }
  });

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-jade');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-connect');

  // Default task.
  grunt.registerTask('default', ['jade', 'sass', 'coffee', 'connect', 'watch']);

};
