define [
  'chaplin',
  'models/base/model'
  'models/document',
  'underscore'
  ], (Chaplin, Model, Document, _) ->

  class Paths extends Model
    
    initialize: ->
      @set paths: []
  
    push: (path) ->
      @get('paths').push(path)
      @trigger 'change:paths'
  
    jumpToPath: (index) ->
      @set 'paths': (_.first @get('paths'), (index + 1))

    getCombinedPath: ->
      @get('paths').join('/')
    
  class Documents extends Chaplin.Collection
  
    model: Document
  
    url: =>
      "https://api.github.com/repos/" + @project.get('full_name') + "/contents/" + @paths.getCombinedPath()
  
    initialize: (options) ->
      @project = options.project
      @paths = new Paths
      @paths.on 'change:paths', @selectPath, @
  
    pushPath: (name) ->
      @paths.push name
      
    selectPath: =>
      @fetch()
