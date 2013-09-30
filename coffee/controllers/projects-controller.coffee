define [
  'chaplin',
  'views/new-project-view'
], (Chaplin, NewProjectView) ->

  class ProjectController extends Chaplin.Controller
    new: (params) ->
      @view = new NewProjectView
        container: 'body'

    show: (params) ->
      