define [
  'models/base/model'
  ], (Model) ->

  class RawDocumentContent extends Model

    initialize: (options) ->
      super
      @document = options.document
      @project = options.project
      
    url: ->
      "https://api.github.com/repos/" + @project.get('full_name') + "/git/blobs/" + @document.get('sha')
  
    parse: (res)->
      @set 'content', res
  
