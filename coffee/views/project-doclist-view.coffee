define [
  'views/base/collection-view',
  'views/project-docitem-view'
  ], (CollectionView, ProjectDocItemView) ->
  
  class ProjectDocListView extends CollectionView
    itemView: ProjectDocItemView
  
    animationDuration: 0
  
