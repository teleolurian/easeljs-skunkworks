module.exports = class Showcase
  constructor: (@id) ->
    @stage = new createjs.Stage @id
    @objects = []
    @fps = 60

  add: (obj) ->
    @objects.push obj

  blit: ->
    @prune()
    for o in @objects
      o.step?()
      o.draw?()
      @stage.addChild o.entity

  prune: ->
    @objects = @objects.filter (o) -> o.should_be_pruned

  loop: ->
    @blit()
    setTimeout @loop, Math.floor(1000 / @fps)
