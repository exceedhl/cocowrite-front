define [
  'models/base/model'
], (Model) ->
  'use strict'

  class Project extends Model
        
    url: =>
      @apiRoot + "/users/exceedhl/projects/"
  
    methodUrl: (method) ->
      urls = 
        'read': @readUrl
        'create': @url
      urls[method]  
  
    readUrl: =>
      @url() + @get('uuid')
    
    sync: (method, model, options) ->
      if model.methodUrl
        options = options || {}
        options.url = model.methodUrl(method.toLowerCase())()
      Backbone.sync(method, model, options);
