define [
  'chaplin',
  'views/new-project-view',
  'views/project-view',
  'views/project-meta-view',
  'views/project-doclist-view',
  'views/project-path-view',
  'views/document-view',
  'models/project',
  'models/documents',
  'models/document-content',
  'models/document',
  'underscore'
], (Chaplin,
  NewProjectView,
  ProjectView,
  ProjectMetaView,
  ProjectDocListView,
  ProjectPathView,
  DocumentView,
  Project,
  Documents,
  DocumentContent,
  Document,
  _) ->

  class DocumentsController extends Chaplin.Controller

    beforeAction: (params, route) ->
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
  
    initialize: ->
      @subscribeEvent 'file:selected', @_showFile

    _showFile: (model, filepath = null) =>
      @documentView.dispose() if @documentView?
      @documentContent = new DocumentContent document: model, project: @project
      @documentContent.fetch({dataType: 'html', headers: {'Accept' :'application/vnd.github.VERSION.raw'}})
        .done =>
          @documentView = new DocumentView model: @documentContent, container: '#doc'
      filepath = unless filepath? then @_getFilePath(model.get('name')) else filepath
      @_changeURL 'showDocument', {uuid: @project.get('uuid'), filepath: filepath}
  
    _changeURL: (route, params) ->
      Chaplin.mediator.execute 'router:changeURL', Chaplin.helpers.reverse(route, params)

    _getFilePath: (name) ->
      paths = _.clone(@documents.paths.get('paths'))
      paths.push(name)
      encodeURIComponent(paths.join('/'))
    
    show: (params) ->
      document = new Document path: params['filepath'], project: @project
      document.fetch().done => @_showFile(document, params['filepath'])

    index: (params) ->
