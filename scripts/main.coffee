TK =
  Showcase: -> require 'lib/showcase'

stage = new createjs.Stage 'workspace'
circle = new createjs.Shape()
circle.graphics.beginFill('black').drawCircle(0,0,4)
circle.x = 50
circle.y = 50
stage.addChild(circle)
stage.update()
