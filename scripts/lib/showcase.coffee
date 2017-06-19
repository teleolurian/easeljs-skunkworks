module.exports = class Showcase
  constructor: (@id) ->
    @stage = new createjs.Stage @id
    @objects = []
    @fps = 120

  add: (obj) -> @objects.push obj

  blit: ->
    #@prune()
    for o in @objects
      o.step()
      o.draw()
      @stage.addChild o.entity
    @stage.update()

  prune: ->
    @objects = @objects.filter (o) -> o.prunable()

  eventLoop: (fn = null) ->
    eloop = =>
      fn(this) if typeof fn is 'function'
      @blit()
      setTimeout eloop, Math.max(Math.floor(1000 / @fps), 10)
    eloop()
