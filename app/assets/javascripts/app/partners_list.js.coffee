$ ->
  # включаем select2
  $('.js-partners-city-select').select2(
    width: 'element'
  )

  # при выборе города в селекте, сразу прыгаем на него в списке ниже
  $('.js-partners-city-select').on('change', (e) ->
    city_id = $(e.target).val()
#    document.getElementById(city_id).scrollIntoView(true)
    $('html, body').animate(
      scrollTop: $("##{city_id}").offset().top
    , 200)
  )