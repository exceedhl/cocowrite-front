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
  
    filterer: (item, index) ->
      if item.get('name').match(/\.md$/) or item.get('type') is 'dir'
        true
      else
        false
  
