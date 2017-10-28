# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#address_use_billing').on 'change', (e) ->
    e.preventDefault
    $('[name^="order[shipping_address]"')
                .closest('.form-group')
                .fadeToggle( "slow", "linear" )

  $('[data-toggle="tooltip"]').tooltip();

  $('#number').mask('9999 9999 9999 9999', {autoclear: false})
  $('#cvv').mask('9999', {autoclear: false})
  $('#expiry').mask('99 / 2099', {autoclear: false})