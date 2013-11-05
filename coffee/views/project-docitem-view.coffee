define [
  'views/base/view',
  'hbs!views/templates/project-docitem'
  ], (View, template) ->

  class ProjectDocItemView extends View
  
    template: template
  
    className: 'doc'
  
    events:
      'click': 'selectDoc'
  
    selectDoc: (event) ->
      if @model.get('type') is 'dir'
        @publishEvent('dir:selected', this.model)
      else
        @$el.siblings().removeClass('current')
        @$el.addClass('current')
        @publishEvent('file:selected', this.model)
