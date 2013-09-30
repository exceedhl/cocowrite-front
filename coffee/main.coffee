requirejs.config
  baseUrl: './js/'
  paths:
    jquery: '../bower_components/jquery/jquery',
    underscore: '../bower_components/lodash/dist/lodash',
    backbone: '../bower_components/backbone/backbone',
    handlebars: '../bower_components/handlebars/handlebars',
    text: '../bower_components/requirejs-text/text',
    chaplin: '../bower_components/chaplin/chaplin',
    hbs: '../bower_components/requirejs-hbs/hbs'
  hbs:
    templateExtension: ".html"
  shim:
    underscore:
      exports: '_'  
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    handlebars:
      exports: 'Handlebars'

require ['application', 'routes'], (Application, routes)->
  new Application routes: routes, controllerSuffix: '-controller'

