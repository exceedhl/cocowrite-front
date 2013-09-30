define [
  'views/base/view',
  'hbs!views/templates/project'
  ], (View, template) ->

  class ProjectView extends View
    template: template
