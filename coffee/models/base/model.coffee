define [
  'chaplin'
], (Chaplin) ->

  class Model extends Chaplin.Model
    # Mixin a synchronization state machine.
    # _(@prototype).extend Chaplin.SyncMachine

