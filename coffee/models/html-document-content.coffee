define [
  'models/text-document-content'
  ], (TextDocumentContent) ->

  class HtmlDocumentContent extends TextDocumentContent

    html: ->
      markdown.toHTML(@get('content'))
