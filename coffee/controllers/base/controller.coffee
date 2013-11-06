define [
  'chaplin',
  'models/user',
  'views/user-profile-view',
], (Chaplin, User, UserProfileView) ->
  'use strict'

  class Controller extends Chaplin.Controller
    showUserProfile: (container)->
      user = new User()
      user.fetch().done =>
        @userProfileView = new UserProfileView container: container, model: user

