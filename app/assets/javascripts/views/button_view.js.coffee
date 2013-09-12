bootstrapClass = 'btn'
Vetreserv.ButtonView = Ember.View.extend Vetreserv.IconAwareMixin, Ember.ViewTargetActionSupport,
  tagName: 'button'
  type: 'default'
  isLoading: false

  classNameBindings: [":#{bootstrapClass}", "typeClass", "sizeClass", "blockClass"]
  attributeBindings: ['disabledAttr:disabled']

  typeClass: (->
    "#{bootstrapClass}-#{@get('type')}"
  ).property('type')

  sizeClass: (->
    if @get('size') then "#{bootstrapClass}-#{@get('size')}" else null
  ).property('size')

  blockClass: (->
    if @get('block') then "#{bootstrapClass}-block" else null
  ).property('block')

  disabledAttr: (->
    @get('isLoading') || @get('disabled')
  ).property('disabled', 'isLoading')

  isLoadingChanged: (->
    @rerender()
  ).observes('isLoading')

  render: (buffer) ->
    @renderIcon(buffer)
    if !@get('isLoading')
      text = @get('text')
    else if !@get('loadingText')
      text = "#{@get('text')} ..."
    else
      text = "#{@get('loadingText')}"
    buffer.push text

  click: ->
    @triggerAction()
    false