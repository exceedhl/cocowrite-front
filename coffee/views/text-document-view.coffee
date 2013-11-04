define [
  'views/base/view'
  ], (View) ->

  class RawDocumentView extends View

    tagName: 'pre'
    template: "{{content}}"

    getTemplateData: ->
      @model.attributes
