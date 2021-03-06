Color = require './color'

module.exports = class VisibleObject
  _beginDraw: -> @entity.graphics.beginFill(@color.hexcolor())
  _createEntity: -> @entity = new createjs.Shape()
  _deg2rad: (num) -> num * Math.PI / 180.0
  _step: ->
    return if @velocity is 0
    xvel = @velocity * Math.cos @_deg2rad @direction
    yvel = -1 * @velocity * Math.sin @_deg2rad @direction
    @moveBy xvel, yvel

  constructor: ->
    @_createEntity()
    @direction    = 0 # in degrees
    @velocity     = 0 # in pixels
    @color        = new Color(128,128,128)
    @moveTo 0, 0

  coords: ->
    x:          @entity.x
    y:          @entity.y
    direction:  @direction
    velocity:   @velocity
    color:      @color.hexcolor()


  draw: -> # override me
    @_beginDraw().drawCircle(0,0,4)

  moveBy: (x, y) ->
    @entity.x += x
    @entity.y += y

  moveTo: (x, y) ->
    @entity.x = x
    @entity.y = y

  prunable: -> false

  step: -> # move in the direction you're going
    @_step()

