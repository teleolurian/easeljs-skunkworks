BASECHARS = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

module.exports = class Color
  colors: [@red, @green, @blue]
  constructor: (@red, @green, @blue) ->
  darken: (percent) -> @lighten(percent * -1)
  hex: (num) -> @radix(num, 16, 2)
  hexcolor: -> '#' + @hex(@red) + @hex(@green) + @hex(@blue)

  lighten: (percent) ->
    for c in ['red','green','blue']
      this[c] = Math.floor(this[c] + 255 * (percent / 100)) % 255


  radix: (num, radix, minlength = 0) ->
    result = ''
    while num > 0
      result = (BASECHARS[num % radix] ? '?') + result
      num = Math.floor num / radix
    while result.length < minlength
      result = '0' + result
    result
