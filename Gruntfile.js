module.exports = function(grunt) {
    grunt.initConfig({
	pkg: grunt.file.readJSON('package.json'),
	
	exec: {
	    clean: {
		command: 'rm -rf build',
		stdout: true,
		stderr: true
	    },
	    bundler: {
		command: 'bundle install'
	    },
	    npm: {
		command: 'npm install'
	    },
	    bower: {
		command: 'bower install'
	    }
	},
	
	coffee: {
	    glob_to_multiple: {
		expand: true,
		flatten: false,
		cwd: 'coffee',
		src: ['**/*.coffee'],
		dest: 'build/js',
		ext: '.js'
	    }
	},
	
	copy: {
	    main: {
		files: [
		    {src: ['bower_components/**/*.js'], dest: 'build/'},
		    {expand: true, cwd: 'coffee/', src: ['views/templates/**/*'], dest: 'build/js/'},
		    {expand: true, cwd: 'static/', src: ['**'], dest: 'build/'}
		]
	    }
	},
	
	compass: {
	    dist: {
		options: {
		    config: 'config.rb'
		}
	    }
	},
	
	watch: {
	    coffee: {
		files: 'coffee/**/*.coffee',
		tasks: ['coffee']
	    },
	    compass: {
		files: 'sass/**/*',
		tasks: ['compass']
	    },
	    copy: {
		files: ['static/**/*', 'coffee/views/templates/**/*'],
		tasks: ['copy']
	    },
	    bundler: {
		files: 'Gemfile',
		tasks: ['exec:bundler']
	    },
	    npm: {
		files: 'package.json',
		tasks: ['exec:npm']
	    },
	    bower: {
		files: 'bower.json',
		tasks: ['exec:bower']
	    }
	},
	
	'http-server': {
            'dev': {
		root: 'build',
		port: 8000,
		host: "127.0.0.1",
		cache: 0,
		showDir : true,
		autoIndex: true,
		defaultExt: "html",
		runInBAckground: false
            }
        }
    });
    
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-http-server');
    grunt.loadNpmTasks('grunt-exec');
    
    grunt.registerTask('default', ['exec:clean', 'compass', 'coffee', 'copy']);
};
