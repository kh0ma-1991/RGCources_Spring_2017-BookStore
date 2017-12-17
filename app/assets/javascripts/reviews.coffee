$ ->
  $("input[name*=review]").on 'click', (e)->
    for star in [1..this.value]
      $("#review_star_#{star}").html('<i class="fa fa-star rate-star"></i>')
    for emty_star in [5...this.value]
      $("#review_star_#{emty_star}").html('<i class="fa fa-star rate-star rate-empty"></i>')