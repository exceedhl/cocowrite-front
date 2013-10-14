define [
  'views/base/view'
  ], (View) ->

  class PDFDocumentView extends View

    className: 'pdf'
    
    template: "<iframe src='{{PDFUrl}}'>"

    getTemplateData: ->
      @model
