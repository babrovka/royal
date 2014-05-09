# работа с фильтром по брендам в списке продуктов
# при клике на чекбокс сразу же отправляем форму на сервер
$ ->
  # обрабатываем клики по картинке-бренду
  # при клике на картинке эмулируем клики по чекбоксу
  $('.js-brands-filter-form label div').on('click', (e) ->
    e.preventDefault()
    $(@).closest('label').find('input').click()
  )

  # сабмитим форму при ее изменении, например: переключение чекбокса
  $('.js-brands-filter-form').on('change', (e) ->
    e.preventDefault()
    $(@).closest('form').submit()
  )