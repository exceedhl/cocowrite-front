define [
  'models/project',
  'views/base/view',
  'hbs!views/templates/new-project',
  'views/spinner-view'
], (Project, View, template, SpinnerView) ->
  
  class MessageView extends View
    className: 'box gap-bottom'
    autoRender: true
  
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
    autoRender: true
  
    events: 
      'click #create-project': 'createProject'
  
    createProject: (event) ->
      @disableSubmit true
      spinner = new SpinnerView container: @$("#message")
      project = new Project 'repo': @$('#project-github-url').val()
      that = @
      project.save()
        .done (res) ->
          new MessageView
            message: "Your project has been created successfully! <a style='text-decoration: underline; color: #27ae60' href='{{url 'projects#show' '" + JSON.parse(res).uuid + "'}}'>Go to take a look</a>."
            type: 'success'
            container: '#message'
        .fail (res) ->
          new MessageView
            message: JSON.parse(res.responseText).error
            type: 'error'
            container: '#message'
        .always (res) ->
          spinner.dispose()
          that.disableSubmit(false)
  
    disableSubmit: (disabled = true) -> 
      button = @$('#create-project')
      if disabled
        button.attr('disabled')
      else
        button.removeAttr('disabled')
        

