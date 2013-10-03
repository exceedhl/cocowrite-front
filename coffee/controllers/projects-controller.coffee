define [
  'chaplin',
  'views/new-project-view',
  'views/project-view',
  'views/project-meta-view',
  'views/project-doclist-view',
  'views/project-path-view',
  'models/project',
  'models/documents',
  'underscore'
], (Chaplin,
  NewProjectView,
  ProjectView,
  ProjectMetaView,
  ProjectDocListView,
  ProjectPathView,
  Project,
  Documents,
  _) ->

  class ProjectsController extends Chaplin.Controller
  
    initialize: ->
      @subscribeEvent 'dir:selected', @selectDoc
  
    selectDoc: (model) ->
      @documents.pushPath(model.get('name'))
      @documents.fetch()
  
    selectFile: (model) ->
      @redirectTo 'showDocument', {uuid: @project.get('uuid'), filepath: @getFilePath(model.get('name'))}

    getFilePath: (basename) ->
      paths = _.clone @documents.paths.get('paths')
      paths.push(basename)
      paths.join('/')
  
    new: (params) ->
      @view = new NewProjectView
        container: 'body'

    show: (params) ->
      @view = new ProjectView
        container: 'body'

      @project = new Project uuid: params.uuid
      @documents = new Documents project: @project

      new ProjectDocListView
        collection: @documents
        container: '#project .doclist'
      new ProjectPathView
        model: @documents.paths
        container: '#project .path'
      new ProjectMetaView model: @project, container: '#project .meta'

      @project.fetch()
        .done (res) => @documents.fetch()
    
            
