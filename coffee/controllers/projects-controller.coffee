define [
  'chaplin',
  'views/new-project-view',
  'views/project-view',
  'views/project-meta-view',
  'models/project',
  'underscore'
], (Chaplin, NewProjectView, ProjectView, ProjectMetaView, Project, _) ->

  class ProjectsController extends Chaplin.Controller
    new: (params) ->
      @view = new NewProjectView
        container: 'body'

    show: (params) ->
      @view = new ProjectView
        container: 'body'
      project = new Project uuid: params.uuid
      project.fetch()
        .done (res) ->
          new ProjectMetaView model: project, container: '#project .meta'
            
