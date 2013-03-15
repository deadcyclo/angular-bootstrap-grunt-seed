angular-bootstrap-grunt-seed
============================

This project is an application skeleton for a typical [AngularJS](http://angularjs.org) app using [CoffeeScript](http://coffeescript.org) rather than traditional JavaScript and [SCSS](http://sass-lang.com) for building CSS. You can use it to quickly bootstrap your angular webapp projects and dev environments for these projects.

The seed contains [AngularJS](http://angularjs.org) libraries, build scripts using [GruntJS](http://gruntjs.com), [Bootstrap css](http://twitter.github.com/bootstrap/) and [Angular-UI Bootstrap widgets](http://angular-ui.github.com/bootstrap/).

The seed app doesn't do very much. It just shows how to wire things together, and gives a skeleton for creating a new app.

# Dependencies #

* Node/npm (`sudo apt-get install npm nodejs`)
* sass (`sudo apt-get install ruby-sass`)

If you use node/npm from your distributions repository, I highly recommend upgrading to the latest version. ([This website](http://slopjong.de/2012/10/31/how-to-install-the-latest-nodejs-in-ubuntu/) has nice instructions on getting the latest version on Ubuntu using PPA.)

# Install #

1. Clone the git repository `git clone https://github.com/deadcyclo/angular-bootstrap-grunt-seed`
2. `cd angular-bootstrap-grunt-seed`
3. run `npm install`
4. If you are planning on putting your project under git version control, you probably want to remove the .gitignore files from the app/ folder and all of its sub folders. 

# Running the app in during development #

You can pick one of the these options:

* Serve this repository with your webserver
* run `grunt server`. Then navigate your browser to http://localhost:8000/app/index.html to see the app running in your browser.

# Usage #

## CSS ##

Put your .scss or .sass files in `src/css`. They will be built to css and put in `app/css/`

## Templates ##

`src/html/index.html` is the applications master template. During build, it will be copied to `app/`. Put any other master templates in `src/html/`. They will also be copied during build. Put partials in `src/html/partials/`. During build, partials will be copied to `app/partials`. OBS! Sub folders probably don't work at the moment.

## Images ##

Any images dropped in `src/img/` will be copied to `app/img/` during build.

## Angular application ##

The main application bootstrap is located in `src/js/app.coffeee`. During build, it will be built into `app/js/app.js`.

Add controllers to the application, by adding new .coffee files to `src/js/controllers/`. During build, all files in `src/js/controllers/` are concatenated together with `src/js/controllers.coffee` before being built to a single Angular module. This allows us to nicely split are projects into multiple small files, while maintaining the scope needed for Angular to understand the controllers. **OBS! This means you cannot simply manually build controllers using the coffee command.** Instead you would have to concatenate the files manually. Something like `coffee -cj controllers.coffee controllers/alert_ctrl.coffee my_crtl_1.coffee my_crtl_2.coffee`

Directives, filters and services are created in the exact same way as controllers, but using the directives, filters and services folders and master files.

# Grunt tasks #

Command | Description
--- | ---
`grunt` | Default task. Builds the project, based on the src folder and puts the result in the app folder.
`grunt watch` | Daemon that watches for changes in the src folder, and runs the default task.
`grunt server` | Runs a dev server for you based on the project. Server is accessible through http://localhost:8000

# Directory layout #

    /                      -> project root
	  README.md            -> this file
	  package.json         -> package description (what happens when you run node install)
	  Gruntfile.coffee     -> buildfile
	  scripts
	    web-server.js        -> dev web server
	  app                  -> skeleton directory, will contain app during dev
	    css                  -> skeleton directory, will contain CSS files built with SASS during dev
		img                  -> skeleton directory, will contain images dropped into img directory during dev
		js                   -> skeleton directory, will contain js-files produced from coffee script during dev
		partials             -> skeleton directory, will contain template partials dropped into partials during dev
		lib                  -> library directory
		  angular              -> contains the AngularJS library
		  angular-ui-bootstrap -> contains the Angular UI Bootstrap library
		  bootstrap            -> contains the Bootstrap library CSS
	  src                  -> develop your application here
	    css                  -> put your scss/sass files here
		  app.scss             -> demo app scss file
        html                 -> put your project template files here
		  index.html           -> demo app master template
		  partials             -> put your project template partials here
		    partial1.html        -> demo app partial template 1
			partial2.html        -> demo app partial template 2
       js                    -> coffee script files that make the angular app go here
	     app.coffee            -> app master file/bootstrap
		 controllers.coffee    -> app controllers master file
		 directives.coffee     -> app directives master file
		 filters.coffee        -> app filters master file
		 services.coffee       -> app services master file
		   controllers           -> drop your controllers here
		     alert_crtl.coffee     -> demo controller, Bootstrap UI alert
			 my_ctrl_1.coffee      -> demo controller 1
			 my_ctrl_2.coffee      -> demo controller 2
		  directives             -> drop your directives here
		    version.coffee         -> demo directive
	      filters                -> drop your filters here
		    interpolate.coffee     -> demo filter
		  services               -> drop your services here
		    my_class.coffee        -> demo service
			version.coffee         -> demo service
	   img	                 -> drop your images here

# TODO #

* Make a production option, that builds everything, minifies and puts in dist directory
* put task for concatenating all CSS for production
* look into automatically creating sprite maps
* select and add test framework
* Create a grunt task that clears up the project
* Possible to include angular-ui and combine with angular-ui/bootstrap?
* Get sub folders working in html, html/partials and img
