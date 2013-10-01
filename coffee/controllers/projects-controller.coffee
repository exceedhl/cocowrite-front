define [
  'chaplin',
  'views/new-project-view',
  'views/project-view',
  'views/project-meta-view',
  'views/project-doclist-view',
  'models/project',
  'models/documents'
], (Chaplin, NewProjectView, ProjectView, ProjectMetaView, ProjectDocListView, Project, Documents) ->

  class ProjectsController extends Chaplin.Controller
  
    initialize: ->
      @subscribeEvent 'doc:selected', @selectDoc
  
    selectDoc: (model) ->
      @documents.downPath(model.get('name'))
      @documents.fetch()

    new: (params) ->
      @view = new NewProjectView
        container: 'body'

    show: (params) ->
      @view = new ProjectView
        container: 'body'
      project = new Project uuid: params.uuid
      @documents = new Documents project: project
      project.fetch()
        .done (res) =>
          new ProjectMetaView model: project, container: '#project .meta'
          @documents.fetch()
            .done (res) =>
              new ProjectDocListView
                collection: @documents
                container: '#project .docItems'
    
            
