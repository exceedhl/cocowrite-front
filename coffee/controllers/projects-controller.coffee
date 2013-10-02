define [
  'chaplin',
  'views/new-project-view',
  'views/project-view',
  'views/project-meta-view',
  'views/project-doclist-view',
  'views/project-path-view',
  'models/project',
  'models/documents'
], (Chaplin,
  NewProjectView,
  ProjectView,
  ProjectMetaView,
  ProjectDocListView,
  ProjectPathView,
  Project,
  Documents) ->

  class ProjectsController extends Chaplin.Controller
  
    initialize: ->
      @subscribeEvent 'dir:selected', @selectDoc
  
    selectDoc: (model) ->
      @documents.pushPath(model.get('name'))
      @documents.fetch()
  
    selectPath: =>
      @documents.fetch()

    new: (params) ->
      @view = new NewProjectView
        container: 'body'

    show: (params) ->
      @view = new ProjectView
        container: 'body'
      project = new Project uuid: params.uuid
      @documents = new Documents project: project
      @documents.paths.on 'change:paths', @selectPath, @
      project.fetch()
        .done (res) =>
          new ProjectMetaView model: project, container: '#project .meta'
          @documents.fetch()
            .done (res) =>
              new ProjectDocListView
                collection: @documents
                container: '#project .doclist'
              new ProjectPathView
                model: @documents.paths
                container: '#project .path'
    
            
