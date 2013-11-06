define [
  'views/base/view',
  'jquery'
  ], (View, $) ->

  class HtmlDocumentView extends View
    className: 'html'
    render: ->
      @$el.html(@model.html())
