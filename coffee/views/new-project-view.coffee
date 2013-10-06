define [
  'models/project',
  'views/base/view',
  'hbs!views/templates/new-project',
  'views/spinner-view'
], (Project, View, template, SpinnerView) ->
  
  class MessageView extends View
    className: 'box gap-bottom'
  
    initialize: (options) ->
      super
      @template = options.message
      @type = options.type
  
    render: ->
      super      
      @$el.addClass(@type)
    
  
  class NewProjectView extends View
    className: 'new-project'
    template: template
  
    events: 
      'click #create-project': 'createProject'

    messageContainer: ->
      @$("#message")
  
    showMessage: (message, type) ->
      new MessageView
        message: message
        type: type
        container: @messageContainer()
      
    createProject: (event) ->
      @disableSubmit true
      spinner = new SpinnerView container: @messageContainer()
      project = new Project 'repo': @$('#project-github-url').val()
      project.save()
        .done (res) =>
          @showMessage "Your project has been created successfully! <a style='text-decoration: underline; color: #27ae60' href='{{url 'documents#index' '" + res.uuid + "'}}'>Go to take a look</a>.", 'success'
        .fail (res) =>
          @showMessage res.responseJSON.error, 'error'
        .always (res) =>
          spinner.dispose()
          @disableSubmit false
  
    disableSubmit: (disabled = true) -> 
      button = @$('#create-project')
      if disabled
        button.attr('disabled', 'true')
      else
        button.removeAttr('disabled')
        

