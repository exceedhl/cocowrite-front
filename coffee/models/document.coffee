define [
  'models/base/model'
], (Model) ->
  'use strict'

  class Document extends Model
  
    initialize: (options) ->
      @path = options.path
      @project = options.project
    
    url: =>
      "https://api.github.com/repos/" + @project.get('full_name') + "/contents/" + @path

