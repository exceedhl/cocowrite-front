define [
  'chaplin',
  'views/base/view',
  'views/base/collection-view'
  ], (Chaplin, View, CollectionView) ->
  
  class ProjectItemView extends View
    className: "group-item"
    template: '{{name}}'
  
    events:
      'click': 'selectProject'

    selectProject: ->
      Chaplin.helpers.redirectTo 'showProject', {uuid: @model.get('uuid')}
  
    getTemplateData: ->
      @model.attributes
  
  class ProjectListView extends CollectionView
  
    itemView: ProjectItemView
  
    initialize: ->
      @subscribeEvent 'project:created', @_refreshProjects
    
    _refreshProjects: (project)->
      @collection.push(project)
      @render()
