# работа с фильтром событий по городам
# доступно по адресу /events
# при выборе города сразу же отправляем на сервер запрос и через ajax перерисовываем календарь
$ ->
  form_name = '.js-events-calendar-select-city-form'

  # каждый город лежит в своем radiobutton.
  # по умолчанаю включаем все кнопки
  $("#{form_name} label").addClass('active')

  # обрабатываем клики по кнопкам городов
  # выставляем классы для подсветки активных пунктов
  $("#{form_name} input").on('change', (e) ->
    $current = $(e.target)
    $current.closest(form_name).find('label').removeClass('active')
    $current.closest('label').addClass('active')
  )

  # фиксируем выбор города в форме
  # после выбора отправляем форму на сервер
  # т.к.стоит remote: true, то форма автоматически отправится через ajax
  $(form_name).on('change', (e) ->
    e.preventDefault()
    $(form_name).submit()
  )