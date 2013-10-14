define [
  'models/raw-document-content',
  'models/pdf-document-content'
  ], (RawDocumentContent, PDFDocumentContent)->

  create: (document, project, documentFormat) ->
    cls = switch 
      when documentFormat.isRaw() then RawDocumentContent
      when documentFormat.isPDF() then PDFDocumentContent
    new cls document: document, project: project
