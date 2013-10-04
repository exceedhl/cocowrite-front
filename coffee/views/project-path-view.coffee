define [
  'views/base/view',
  'hbs!views/templates/project-path'
  ], (View, template) ->
  
  class ProjectPathView extends View
  
    template: template
  
    events:
      'click a': 'selectPath'
  
    initialize: ->
      super
      @model.on('change:paths', @render, @)
  
    getTemplateData: ->
      @model.get('paths')

    selectPath: (event) ->
      @model.jumpToPath @$(event.currentTarget).data('id')

