define [
  'chaplin',
  'views/base/view',
  'views/document-view'
  'hbs!views/templates/project-docitem'
  ], (Chaplin, View, DocumentView, template) ->

  class ProjectDocItemView extends View
  
    template: template
  
    className: 'doc'
  
    events:
      'click': 'selectDoc'
  
    selectDoc: (event) ->
      if @model.get('type') is 'dir'
        @publishEvent('dir:selected', this.model)
      else
        @$el.addClass('current')
        new DocumentView document: @model, container: '#doc'