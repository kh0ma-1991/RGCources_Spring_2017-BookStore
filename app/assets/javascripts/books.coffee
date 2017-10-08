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
    value_to_set = get_quantity()-1
    value_to_set = 0 if value_to_set < 0
    $('#quantity').val(value_to_set).trigger('change')

  $('#quantity_plus').on 'click', (e) ->
    e.preventDefault()
    value_to_set = get_quantity()+1
    value_to_set = get_avaiable_quantity() if value_to_set > get_avaiable_quantity()
    $('#quantity').val(value_to_set).trigger('change')

  get_avaiable_quantity = ->
    parseInt($('#available-quantity').val())

  get_quantity = ->
    parseInt($('#quantity').val())

  $('#quantity').on 'change', (e) ->
    $('input[type=submit]').prop('disabled', true) if get_quantity() <= 0
    $('input[type=submit]').prop('disabled', false) if get_quantity() > 0