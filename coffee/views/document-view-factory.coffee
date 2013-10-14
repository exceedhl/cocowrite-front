define [
  'views/raw-document-view',
  'views/pdf-document-view'
  ], (RawDocumentView, PDFDocumentView) ->

  create: (model, container, documentFormat) ->
    cls = switch
      when documentFormat.isRaw() then RawDocumentView
      when documentFormat.isPDF() then PDFDocumentView
    new cls model: model, container: container
