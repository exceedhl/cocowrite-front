define [
  'views/base/view',
  'hbs!views/templates/user-profile'
], (View, template) ->

  class UserProfileView extends View
    containerMethod: 'html'
    template: template
  
    getTemplateData: ->
      @model.attributes
