$ ->
#  клик по лупе в форме поиска
  $('.search-submit').on('click', (e) ->
    $(e.target).closest('form').submit()
  )