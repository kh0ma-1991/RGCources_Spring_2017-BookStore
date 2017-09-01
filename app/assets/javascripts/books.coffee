$ ->
  $('.product-gallery .img-link').on 'click', (e)->
    e.preventDefault()
    small_img = $(this).children('img').attr('src')
    big_img = $('.product-gallery .img-responsive').attr('src')
    $(this).children('img').attr('src', big_img)
    $('.product-gallery .img-responsive').attr('src', small_img)
    return