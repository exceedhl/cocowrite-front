define [
  'views/base/collection-view',
  'views/project-docitem-view',
  'views/spinner-view'
  ], (CollectionView, ProjectDocItemView, SpinnerView) ->
  
  class ProjectDocListView extends CollectionView
  
    itemView: ProjectDocItemView
  
    initialize: ->
      super
      @subscribeEvent 'dir:selected', @selectDir
  
    selectDir: (model) ->
      @collection.pushPath(model.get('name'))
      @collection.fetch()
  
