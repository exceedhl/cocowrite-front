define [
  'views/base/collection-view',
  'views/project-docitem-view'
  ], (CollectionView, ProjectDocItemView) ->
  
  class ProjectDocListView extends CollectionView
  
    itemView: ProjectDocItemView
  
    initialize: ->
      super
      @subscribeEvent 'dir:selected', @selectDir
  
    selectDir: (model) ->
      @collection.pushPath(model.get('name'))
      @collection.fetch()
  
