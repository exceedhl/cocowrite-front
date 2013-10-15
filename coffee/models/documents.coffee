define [
  'chaplin',
  'models/base/model',
  'models/base/collection',
  'models/document',
  'underscore'
  ], (Chaplin, Model, Collection, Document, _) ->

  class Paths extends Model
    
    initialize: ->
      lastPaths = localStorage.getItem('lastPaths')
      @set paths: if lastPaths? and lastPaths isnt '' then lastPaths.split('/') else []
      @on 'change:paths', @storeLastPaths, @

    storeLastPaths: =>
      localStorage.setItem 'lastPaths', @get('paths').join('/')
  
    push: (path) ->
      @get('paths').push(path)
      @trigger 'change:paths'
  
    jumpToPath: (index) ->
      @set 'paths': (_.first @get('paths'), (index + 1))

    getCombinedPath: ->
      @get('paths').join('/')
    
  class Documents extends Collection
  
    model: Document
  
    url: =>
       @apiRoot + "/github/repos/" + @project.get('full_name') + "/contents/" + @paths.getCombinedPath()
  
    initialize: (options) ->
      @project = options.project
      @paths = new Paths
      @paths.on 'change:paths', @selectPath, @
  
    pushPath: (name) ->
      @paths.push name
      
    selectPath: =>
      @fetch()
