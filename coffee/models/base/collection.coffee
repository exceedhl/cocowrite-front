define [
  'chaplin',
  'config',
  'models/base/model'
], (Chaplin, config, Model) ->

  class Collection extends Chaplin.Collection
    # Mixin a synchronization state machine.
    # _(@prototype).extend Chaplin.SyncMachine

    # Use the project base model per default, not Chaplin.Model.
    model: Model

    apiRoot: config.apiRoot    
