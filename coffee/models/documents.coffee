define [
  'chaplin',
  'models/document'
  ], (Chaplin, Document) ->

  class Documents extends Chaplin.Collection
  
    model: Document
  
    url: =>
      "https://api.github.com/repos/" + @project.get('full_name') + "/contents/" + @path
  
    initialize: (options) ->
      @project = options.project
      @path = options.path || ''
  
    downPath: (name) ->
      @path = if (@path is '') then name else @path + '/' + name 
      