# TODO: Make a production option, that builds everything, minifies and puts in dist directory
# TODO: put task for concating all css for production
# TODO: look into automatically creating sprite maps
# TODO: add test framework
module.exports = (grunt) ->
        grunt.initConfig
                pkg: '<json:package.json>'
                copy:
                        html:
                                files: [
                                        expand: true
                                        cwd: 'src/html/'
                                        src: ['**.html']
                                        dest: 'app/'
                                ]
                        partials:
                                files: [
                                        expand: true
                                        cwd: 'src/html/partials/'
                                        src: ['**.html']
                                        dest: 'app/partials/'
                                ]
                        img:
                                files: [
                                        expand: true
                                        cwd: 'src/img/'
                                        src: ['**']
                                        dest: 'app/img/'
                                ]
                shell:
                        server:
                                command: 'scripts/web-server.js'
                                options:
                                        stdout: true
                sass:
                        main:
                                files:
                                        'app/css/app.css' : 'src/css/app.scss'
                concat:
                        services:
                                src: [
                                        'src/js/services.coffee'
                                        'src/js/services/*.coffee'
                                ]
                                dest: '/tmp/services.coffee'
                        controllers:
                                src: [
                                        'src/js/controllers.coffee'
                                        'src/js/controllers/*.coffee'
                                ]
                                dest: '/tmp/controllers.coffee'
                        directives:
                                src: [
                                        'src/js/directives.coffee'
                                        'src/js/directives/*.coffee'
                                ]
                                dest: '/tmp/directives.coffee'
                        filters:
                                src: [
                                        'src/js/filters.coffee'
                                        'src/js/filters/*.coffee'
                                ]
                                dest: '/tmp/filters.coffee'
                coffee:
                        compile:
                                files: [
                                        'app/js/app.js': 'src/js/app.coffee'
                                        'app/js/services.js': '/tmp/services.coffee'
                                        'app/js/controllers.js': '/tmp/controllers.coffee'
                                        'app/js/directives.js': '/tmp/directives.coffee'
                                        'app/js/filters.js': '/tmp/filters.coffee'
                                ]
                watch:
                        files: [
                                'src/js/*.coffee'
                                'src/js/services/*.coffee'
                                'src/js/controllers/*.coffee'
                                'src/js/directives/*.coffee'
                                'src/js/filters/*.coffee'
                                'src/css/app.scss'
                                'src/html/**'
                        ]
                        tasks: 'default'

        grunt.loadNpmTasks 'grunt-contrib-coffee'
        grunt.loadNpmTasks 'grunt-contrib-watch'
        grunt.loadNpmTasks 'grunt-contrib-concat'
        grunt.loadNpmTasks('grunt-contrib-sass');
        grunt.loadNpmTasks('grunt-shell');
        grunt.loadNpmTasks('grunt-contrib-copy');

        grunt.registerTask 'default', ['sass', 'concat', 'coffee', 'copy']
        grunt.registerTask 'server', ['default', 'shell:server']