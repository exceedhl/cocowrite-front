define [
  'models/base/model'
], (Model) ->
  'use strict'

  class User extends Model
    url: ->
      @apiRoot + "/github/users/exceedhl"
