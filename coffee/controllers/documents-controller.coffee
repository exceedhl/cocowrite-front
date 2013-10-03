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

  class DocumentsController extends Chaplin.Controller
    
    show: ->
      console.log 'in dc s'
      @view = new ProjectView
        container: 'body'
