define [
  'views/base/collection-view',
  'views/project-docitem-view'
  ], (CollectionView, ProjectDocItemView) ->
  
  class ProjectDocListView extends CollectionView
  
    itemView: ProjectDocItemView
  
    animationDuration: 0
  
    initialize: ->
      super
      @subscribeEvent 'dir:selected', @selectDoc
  
    selectDoc: (model) ->
      @collection.pushPath(model.get('name'))
      @collection.fetch()
  
