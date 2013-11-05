define [
  'views/base/view',
  'hbs!views/templates/new-project'
], (View, template) ->
  
  class NewProjectView extends View
    template: template

