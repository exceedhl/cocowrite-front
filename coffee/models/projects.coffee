define [
  'models/base/collection',
  'models/project',
  'underscore'
  ], (Collection, Project, _) ->

  class Projects extends Collection
  
    model: Project
  
    url: =>
       @apiRoot + "/users/exceedhl/projects"
  
    parse: (res) ->
      _.pluck(super(res), 'project')
      
  
