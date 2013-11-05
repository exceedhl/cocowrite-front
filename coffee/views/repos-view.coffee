define [
  'chaplin',
  'jquery',
  'models/project',
  'views/base/view',
  'hbs!views/templates/repo-template',
  'views/spinner-view'
], (Chaplin, $, Project, View, repoTemplate, SpinnerView) ->
  
  class MessageView extends View
    className: 'box gap-bottom'
  
    initialize: (options) ->
      super
      @template = options.message
      @type = options.type
  
    render: ->
      super      
      @$el.addClass(@type)
  
  class RepoView extends View
    tagName: 'li'
    template: repoTemplate
  
    getTemplateData: ->
      @model.attributes

    events: 
      'click button': 'createProject'
  
    showMessage: (message, type) ->
      new MessageView
        message: message
        type: type
        container: $('.repo-list > .spinner')
      
    createProject: (event) ->
      @disableSubmit true
      spinner = new SpinnerView container: @$('.spinner'), type: 'refresh'
      project = new Project 'repo': @model.get('html_url')
      project.save()
        .done (res) =>
          @showMessage "Your project has been created successfully! <a style='text-decoration: underline; color: #27ae60' href='{{url 'documents#index' '" + res.uuid + "'}}'>Go to take a look</a>.", 'success'
          @publishEvent('project:created', project)
        .fail (res) =>
          console.log res
          @showMessage res.responseJSON.error, 'error'
        .always (res) =>
          spinner.dispose()
          @disableSubmit false
  
    disableSubmit: (disabled = true) -> 
      button = @$('button')
      if disabled
        button.attr('disabled', 'true')
      else
        button.removeAttr('disabled')
  
  class ReposView extends Chaplin.CollectionView
    autoRender: true
    tagName: 'ul'
    itemView: RepoView
  
        

