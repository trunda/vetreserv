Vetreserv.ApplicationController = Ember.Controller.extend
  isLoading: false
  actions:
    handleClick: ->
      console.log 'něco'
      @set 'isLoading', true