define [
  'chaplin'
], (Chaplin) ->
  'use strict'

  class Application extends Chaplin.Application
    title: 'cocowrite'
  
    initialize: ->
      super
