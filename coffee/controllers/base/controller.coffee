define [
  'chaplin',
  'models/user',
  'views/user-profile-view',
], (Chaplin, User, UserProfileView) ->
  'use strict'

  class Controller extends Chaplin.Controller
    beforeAction: ->
      user = new User()
      user.fetch().done =>
        @userProfileView = new UserProfileView container: '.profile', model: user

