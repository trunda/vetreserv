bootstrapClass = 'glyphicon'
Vetreserv.IconAwareMixin = Ember.Mixin.create
  renderIcon: (buffer) ->
    buffer.push "<i class=\"#{bootstrapClass} #{bootstrapClass}-#{@get('icon')}\"></i>&nbsp;" if @get('icon')
