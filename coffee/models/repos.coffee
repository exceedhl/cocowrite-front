define [
  'models/repo',
  'models/base/collection'
  ], (Repo, Collection) ->

  class Repos extends Collection
    model: Repo
  
    url: =>
      @apiRoot + "/github/users/exceedhl/repos?type=all"

