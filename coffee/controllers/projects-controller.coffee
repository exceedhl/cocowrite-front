define [
  'chaplin',
  'views/new-project-view'
], (Chaplin,
  NewProjectView) ->

  class ProjectsController extends Chaplin.Controller
  
    new: (params) ->
      @view = new NewProjectView
        container: 'body'

    
            
