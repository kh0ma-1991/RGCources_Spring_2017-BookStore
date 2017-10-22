# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#address_use_billing').on 'change', (e) ->
    e.preventDefault
    $('[name^="order[shipping_address]"').closest('div').fadeToggle( "slow", "linear" )