define [
  'views/base/view',
  'hbs!views/templates/spinner'
  ], (View, template) ->

  class SpinnerView extends View
    autoRender: true
    containerMethod: 'html'
    className: 'spinner'
    template: template
