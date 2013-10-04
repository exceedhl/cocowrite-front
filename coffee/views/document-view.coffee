define [
  'views/base/view'
  ], (View) ->

  class DocumentView extends View

    tagName: 'pre'
    template: "{{content}}"

    getTemplateData: ->
      @model.attributes
