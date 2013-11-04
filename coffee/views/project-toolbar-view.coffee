define [
  'views/base/view',
  'hbs!views/templates/project-toolbar'
  ], (View, template) ->

  class ProjectToolbarView extends View
    tagName: 'ul'  
    events:
      'click li': 'chooseFormat'

    template: template

    getTemplateData: ->
      @model

    chooseFormat: (e)->
      target = @$(e.target)
      @$('li').removeClass('active')
      target.addClass('active')
      @publishEvent('format:changed', target.data('format'))
      
