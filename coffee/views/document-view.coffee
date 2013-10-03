define [
  'views/base/view'
  ], (View) ->

  class DocumentView extends View

    template: "{{content}}"

    initialize: (options) ->
      @document = options.document

    getTemplateData: ->
      content: "hello, world"
