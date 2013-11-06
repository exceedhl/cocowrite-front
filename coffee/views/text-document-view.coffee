define [
  'views/base/view'
  ], (View) ->

  class TextDocumentView extends View

    tagName: 'pre'
    className: 'pre'
    template: "{{content}}"

    getTemplateData: ->
      @model.attributes
