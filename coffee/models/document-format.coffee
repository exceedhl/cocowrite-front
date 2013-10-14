define [
  'models/base/model'
  ], (Model) ->

  class DocumentFormat extends Model

    initialize: (options) ->
      @setFormat(options.format)
  
    setFormat: (format) ->
      @set 'format', format.toLowerCase()
  
    isPDF: ->
      @get('format') is 'pdf'
  
    isRaw: ->
      @get('format') is 'raw'
  
    isHTML: ->
      @get('format') is 'html'
