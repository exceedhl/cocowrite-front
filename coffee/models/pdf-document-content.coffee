define [
  'models/base/model'
  ], (Model) ->

  class PDFDocumentContent extends Model

    initialize: (options) ->
      super
      @document = options.document
      @project = options.project
      
    url: ->
      "http://localhost:9000/projects/" + @project.get('uuid') + "/documents/" + @document.get('sha') + "/pdf"
  
    PDFUrl: ->
      @get('links')[0]['href']
  
    
