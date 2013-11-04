define [
  'views/text-document-view',
  'views/pdf-document-view'
  ], (TextDocumentView, PDFDocumentView) ->

  create: (model, container, documentFormat) ->
    cls = switch
      when documentFormat.isText() then TextDocumentView
      when documentFormat.isPDF() then PDFDocumentView
    new cls model: model, container: container
