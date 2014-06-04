module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffeelint: {
      files: ["src/*.coffee", "test/*.coffee"],
      options: {
        max_line_length: {
          level: "ignore"
        }
      }
    },
    coffee: {
      glob_to_multiple: {
        expand: true,
        flatten: true,
        cwd: 'src/',
        src: ['*.coffee'],
        dest: 'dist/',
        ext: '.js'
      }
    },
    clean: {
      build: ['dist'],
      test: ['test/.tmp']
    },
    mochaTest: {
      unit: {
        options: {
          reporter: 'spec',
          require: 'coffee-script/register',
          colors: true
        },
        src: ['test/unit/*-spec.coffee']
      },
      feature: {
        options: {
          reporter: 'spec',
          require: 'coffee-script/register',
          colors: true
        },
        src: ['test/feature/*-spec.coffee']
      }
    },
    mkdir: {
      test: {
        options: {
          mode: 0777,
          create: ['test/.tmp', 'dist/bin']
        },
      },
      build: {
        options: {
          mode: 0777,
          create: ['dist/bin']
        }
      }
    },
    copy: {
      test: {
        files: [{
          expand: true,
          cwd: 'test/fixtures',
          src: ['package.json'],
          dest: 'test/.tmp'
        }]
      }
    },
    'file-creator': {
      bin: {
        'dist/bin/nver': function(fs, fd, done) {
          fs.writeSync(fd, '#!/usr/bin/env node\n');
          fs.writeSync(fd, 'require("../nver-cli")');
          done();
        }
      }
    },
    chmod: {
      options: {
        mode: '755'
      },
      bin: {
        src: ['dist/bin/nver']
      }
    }
  });

  grunt.loadNpmTasks('grunt-coffeelint');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-mocha-test');
  grunt.loadNpmTasks('grunt-mkdir');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-file-creator');
  grunt.loadNpmTasks('grunt-chmod');

  // build
  grunt.registerTask('build', ['coffeelint', 'clean', 'coffee', 'file-creator', 'chmod:bin']);
  // test
  grunt.registerTask('test:before', ['build', 'clean:test', 'copy:test']);
  grunt.registerTask('test:after', ['clean:test']);
  grunt.registerTask('test:unit', ['test:before', 'mochaTest:unit', 'test:after']);
  grunt.registerTask('test:feature', ['test:before', 'mochaTest:feature', 'test:after']);
  grunt.registerTask('test', ['test:unit', 'test:feature']);
  // default
  grunt.registerTask('default', ['test', 'build']);
};