define [
  'models/base/model'
  ], (Model) ->

  class TextDocumentContent extends Model

    initialize: (options) ->
      super
      @document = options.document
      @project = options.project
  
    fetch: ->
      super({dataType: 'html', headers: {'Accept' :'application/vnd.github.VERSION.raw'}})
      
    url: ->
      @apiRoot + "/github/repos/" + @project.get('full_name') + "/git/blobs/" + @document.get('sha')
  
    parse: (res)->
      @set 'content', res
  
