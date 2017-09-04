fillTextToCanvas = (canvas, text, position = 'top', textColor = '#000') ->
  return unless text
  backgroundColor = '#ABE1FB'
  font = 'serif'
  indent = 10
  canvasJQ = $(canvas)
  return unless canvasJQ.length
  canvasJQ.css('background', backgroundColor)
  canvas = canvasJQ.get(0)
  canvas_width = canvas.width
  canvas_height = canvas.height
  ctx = canvas.getContext('2d')

  font_size = 2
  width
  trigger = true
  while trigger
    ctx.font = "#{font_size}px #{font}"
    width = ctx.measureText(text).width
    if width >= canvas_width-indent
      trigger = false
    else
      font_size++

  trigger = true
  while trigger
    ctx.font = "#{font_size}px #{font}"
    width = ctx.measureText(text).width
    if width <= canvas_width-indent
      trigger = false
    else
      font_size--

  ctx.fillStyle = textColor;
  x = canvas_width/2 - width/2
  y = 20+font_size/2 if position == 'top'
  y = canvas_height/2 if position == 'middle'
  y = canvas_height - indent if position == 'bottom'
  ctx.fillText text, x, y
  return

$.generateBookCover = (canvas,authors,title) ->
  fillTextToCanvas(canvas, authors)
  fillTextToCanvas(canvas, title,      'middle', '#ffffff')
  fillTextToCanvas(canvas,'BookStore', 'bottom','#4E608F')

$(document).ready( ->
  $('canvas').trigger("onplay"))
