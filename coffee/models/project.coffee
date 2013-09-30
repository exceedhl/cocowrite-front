define [
  'models/base/model'
], (Model) ->
  'use strict'

  class Project extends Model
        
    urlRoot: ->
      "http://localhost:9000/projects"
