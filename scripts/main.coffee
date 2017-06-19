global.requireLib = (path) -> require(__dirname + "/public/#{path}")

TK =
  Showcase:       requireLib 'lib/showcase'
  VisibleObject:  requireLib 'lib/visible_object'


class Snowflake extends TK.VisibleObject
  constructor: ->
    super()
    @direction = 270
    @color.blue = 200
    @velocity = 1
    @moveTo Math.floor(Math.random() * 800), 1

  flutter: ->
    @direction += (Math.random() * 20) - 10
    @direction = Math.max(180, Math.min(360, @direction))

  step: ->
    @flutter()
    super()

showcase = new TK.Showcase 'workspace'

showcase.add(new Snowflake())
showcase.eventLoop (sc) ->
  sc.add(new Snowflake())
