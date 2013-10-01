define [
  'handlebars'
  'chaplin'
  'lib/utils'
], (Handlebars, Chaplin, utils) ->
  'use strict'

  # Application-specific Handlebars helpers
  # ---------------------------------------

  # Get Chaplin-declared named routes. {{#url "like" "105"}}{{/url}}
  Handlebars.registerHelper 'url', (routeName, params..., options) ->
    Chaplin.helpers.reverse routeName, params
  
  Handlebars.registerHelper 'project_path_icon_class', (docType) ->
    if docType is 'file'
      'icon-file-text-alt'
    else 
      'icon-folder-close-alt'

  null
