define [
  'chaplin',
  'views/new-project-view',
  'views/project-view',
  'views/project-meta-view',
  'views/project-doclist-view',
  'views/project-path-view',
  'views/document-view-factory',
  'views/project-toolbar-view',
  'views/project-list-view',
  'views/spinner-view',
  'models/project',
  'models/documents',
  'models/document-content-factory',
  'models/document',
  'models/document-format',
  'models/projects',
  'controllers/base/controller'
  'underscore'
], (Chaplin,
  NewProjectView,
  ProjectView,
  ProjectMetaView,
  ProjectDocListView,
  ProjectPathView,
  DocumentViewFactory,
  ProjectToolbarView,
  ProjectListView,
  SpinnerView,
  Project,
  Documents,
  DocumentContentFactory,
  Document,
  DocumentFormat,
  Projects,
  Controller,
  _) ->
  
  class DocumentsController extends Controller

    beforeAction: (params, route) ->
      super
      @view = new ProjectView
        container: 'body'
      @showUserProfile('.profile')
      @project = new Project uuid: params.uuid
      @documents = new Documents project: @project

      new ProjectPathView
        model: @documents.paths
        container: '#project .path'
      new ProjectMetaView model: @project, container: '#project .meta'
  
      @projects = new Projects()
      @projects.fetch().done =>
        @projectListView = new ProjectListView container: '.project-list', collection: @projects

      spinner = new SpinnerView
        container: '#refresh-project'
        type: 'refresh'

      @project.fetch().done (res) =>
        @documents.fetch().done =>
          new ProjectDocListView
            collection: @documents
            container: '#project .doclist'
        .always =>
          spinner.dispose()
  
    initialize: ->
      @subscribeEvent 'file:selected', @_selectFile
      @subscribeEvent 'format:changed', @_changeFormat
  
    _changeFormat: (format) =>
      @documentFormat.setFormat(format)
      @_showFile(@document)
  
    _selectFile: (document) =>
      @document = document
      @_initDocumentFormat 'text'
      @_showFile(@document)

    _showFile: (document, filepath = null) =>
      console.log "showing file: " + document.get('name')
      @_showToolbar()
      @documentView.dispose() if @documentView?
      @documentContent = DocumentContentFactory.create document, @project, @documentFormat
      docLoadSpinner = new SpinnerView container: '#doc', text: "Loading ..."
      @documentContent.fetch().done =>
        docLoadSpinner.dispose()
        @documentView = DocumentViewFactory.create @documentContent, '#doc', @documentFormat
      filepath = unless filepath? then @_getFilePath(document.get('name')) else filepath
      @_changeURL 'showDocument', {uuid: @project.get('uuid'), filepath: filepath, format: @documentFormat.get('format')}
  
    _changeURL: (route, params) ->
      Chaplin.mediator.execute 'router:changeURL', Chaplin.helpers.reverse(route, params)

    _getFilePath: (name) ->
      paths = _.clone(@documents.paths.get('paths'))
      paths.push(name)
      encodeURIComponent(paths.join('/'))
    
    show: (params) ->
      console.log "routed to DC show: " + params['filepath']
      @_initDocumentFormat params['format']
      @document = new Document path: params['filepath'], project: @project
      @document.fetch().done => @_showFile(@document, params['filepath'])
  
    _initDocumentFormat: (format) ->
      @documentFormat ?= new DocumentFormat format: format
  
    _showToolbar: ->
      @toolbarView ?= new ProjectToolbarView model: @documentFormat, container: '#doc-toolbar'

    index: (params) ->

    dispose: ->
      super
      @documents.dispose() if @documents?
