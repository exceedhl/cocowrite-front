define [
  'views/text-document-view',
  'views/pdf-document-view',
  'views/html-document-view'
  ], (TextDocumentView, PDFDocumentView, HtmlDocumentView) ->

  create: (model, container, documentFormat) ->
    cls = switch
      when documentFormat.isText() then TextDocumentView
      when documentFormat.isPDF() then PDFDocumentView
      when documentFormat.isHTML() then HtmlDocumentView
    new cls model: model, container: container
