randomColor = ->
  color = Math.floor(Math.random() * 0x1000000) # integer between 0x0 and 0xFFFFFF
  color = color.toString(16) # convert to hex
  color = ("000000" + color).slice(-6) # pad with leading zeros
  color = "#" + color # prepend #
  return color


invertColor = (hexTripletColor) ->
  color = hexTripletColor
  color = color.substring(1) # remove #
  color = parseInt(color, 16) # convert to integer
  color = 0xFFFFFF ^ color # invert three bytes
  color = color.toString(16) # convert to hex
  color = ("000000" + color).slice(-6) # pad with leading zeros
  color = "#" + color # prepend #
  return color

fillTextToCanvas = (canvas, text = 'Hello world', indent = 0, string = 1, previous_string_height = null, font = 'serif') ->
  rectColor = randomColor()
  backgroundColor = invertColor(rectColor)

  canvasJQ = $(canvas)
  return unless canvasJQ.length
  canvasJQ.css('background', backgroundColor)
  canvas = canvasJQ.get(0)
  canvas_width = canvas.width
  canvas_height = canvas.height
  ctx = canvas.getContext('2d')

  # Create gradient
  grd = ctx.createRadialGradient(75,canvas_height/5*Math.random(4),canvas_height/Math.random(25),50,60,canvas_width/5+Math.random(5));
  grd.addColorStop(0,rectColor);
  grd.addColorStop(1,randomColor());

  # Fill with gradient
  ctx.fillStyle = grd;
  ctx.strokeRect(0,0,canvas_width,canvas_height);

  font_size = 2
  trigger = true
  while trigger
    ctx.font = "#{font_size}px #{font}"
    width = ctx.measureText(text).width
    if width >= (canvas_width- (indent*2))
      trigger = false
    else
      font_size++

  trigger = true
  while trigger
    ctx.font = "#{font_size}px #{font}"
    width = ctx.measureText(text).width
    if width <= (canvas_width- (indent*2))
      trigger = false
    else
      font_size--
  previous_string_height = font_size*string unless previous_string_height
  ctx.fillText text, indent, previous_string_height+font_size
  return previous_string_height+font_size+(indent*2)

$.generateBookCover = (canvas,authors,title) ->
  string1 = fillTextToCanvas(canvas,authors,     5,1)
  string2 = fillTextToCanvas(canvas,title,       5,1,string1)
  string3 = fillTextToCanvas(canvas,'BookStore', 5,1,string2+50)

$(document).ready( ->
  $('canvas').trigger("onload"))
