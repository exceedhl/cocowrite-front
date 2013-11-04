define [
  'models/text-document-content',
  'models/pdf-document-content'
  ], (TextDocumentContent, PDFDocumentContent)->

  create: (document, project, documentFormat) ->
    cls = switch 
      when documentFormat.isText() then TextDocumentContent
      when documentFormat.isPDF() then PDFDocumentContent
    new cls document: document, project: project
