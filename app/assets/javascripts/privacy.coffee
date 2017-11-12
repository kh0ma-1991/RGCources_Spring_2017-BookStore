$ ->
  $('#understand_delete_account').on 'change', (event) ->
    event.preventDefault()
    if $(this).is(":checked")
      $('#please_remove_account').removeClass('disabled')
      $('#please_remove_account').addClass('btn-default')
    else
      $('#please_remove_account').addClass('disabled')
      $('#please_remove_account').removeClass('btn-default')