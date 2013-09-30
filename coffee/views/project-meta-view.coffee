define [
  'views/base/view',
  'hbs!views/templates/project-meta'
], (View, template) ->

  class ProjectMetaView extends View
    template: template
  
    getTemplateData: ->
      @model.attributes