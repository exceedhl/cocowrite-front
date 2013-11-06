define [
  'models/text-document-content',
  'models/pdf-document-content',
  'models/html-document-content'
  ], (TextDocumentContent, PDFDocumentContent, HtmlDocumentContent)->

  create: (document, project, documentFormat) ->
    cls = switch 
      when documentFormat.isText() then TextDocumentContent
      when documentFormat.isPDF() then PDFDocumentContent
      when documentFormat.isHTML() then HtmlDocumentContent
    new cls document: document, project: project
