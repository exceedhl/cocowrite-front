define [
  'views/base/view',
  'hbs!views/templates/project-toolbar'
  ], (View, template) ->

  class ProjectToolbarView extends View
  
    events:
      'click button': 'chooseFormat'

    template: template

    getTemplateData: ->
      @model

    chooseFormat: (e)->
      target = @$(e.target)
      @$('button').removeClass('active')
      target.addClass('active')
      @publishEvent('format:changed', target.data('format'))
      
