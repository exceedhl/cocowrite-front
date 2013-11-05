define [
  'views/base/view',
  'hbs!views/templates/spinner',
  'jquery'
  ], (View, template, $) ->

  class SpinnerView extends View
    containerMethod: 'html'
    className: 'spinner'
    template: template
  
    initialize: (options) ->
      @type = options.type
      @text = options.text || ''
      @originalContent = $(@container).html()

    getTemplateData: ->
      {type: @type, text: @text}

    dispose: ->
      $(@container).html(@originalContent)
      super
