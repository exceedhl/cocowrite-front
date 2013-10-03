define [
  'views/base/view',
  'hbs!views/templates/project-meta'
], (View, template) ->

  class ProjectMetaView extends View
    template: template
  
    initialize: ->
      @model.on 'change', @render, @
  
    getTemplateData: ->
      @model.attributes