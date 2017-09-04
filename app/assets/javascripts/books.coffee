$ ->
  $('.product-gallery .img-link').on 'click', (e)->
    e.preventDefault()
    small_img = $(this).children('img').attr('src')
    big_img = $('.product-gallery .img-responsive').attr('src')
    $(this).children('img').attr('src', big_img)
    $('.product-gallery .img-responsive').attr('src', small_img)
    return

  $('#show_description').on 'click', (e) ->
    e.preventDefault()
    $('#short_description').addClass('hidden')
    $('#description').removeClass('hidden')

  $('#hide_description').on 'click', (e) ->
    e.preventDefault()
    $('#description').addClass('hidden')
    $('#short_description').removeClass('hidden')

  $('#quantity_minus').on 'click', (e) ->
    e.preventDefault()
    value_to_set = get_quantity_to_buy()-1
    value_to_set = 0 if value_to_set < 0
    $('#quantity_to_buy').val(value_to_set)

  $('#quantity_plus').on 'click', (e) ->
    e.preventDefault()
    value_to_set = get_quantity_to_buy()+1
    value_to_set = get_quantity() if value_to_set > get_quantity()
    $('#quantity_to_buy').val(value_to_set)

  get_quantity = ->
    parseInt($('#quantity').val())

  get_quantity_to_buy = ->
    parseInt($('#quantity_to_buy').val())