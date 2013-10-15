define [
  'chaplin',
  'config'
], (Chaplin, config) ->

  class Model extends Chaplin.Model
    # Mixin a synchronization state machine.
    # _(@prototype).extend Chaplin.SyncMachine

    apiRoot: config.apiRoot
