define [
  'chaplin',
  'views/base/view',
  'hbs!views/templates/project-docitem'
  ], (Chaplin, View, template) ->

  class ProjectDocItemView extends View
  
    template: template
  
    className: 'doc'
  
    events:
      'click': 'selectDoc'
  
    selectDoc: (event) ->
      if @model.get('type') is 'dir'
        @publishEvent('doc:selected', this.model)