$ ->
  # класс .selected есть у пунктов меню, на странице которых мы сейчас находимся
  # открываем их (активируем)
  # попутно выставляем класс opened для ссылок, подсветить активные пункт
  # и выставить стрелочки в нужном направлении
  $('.js-left-menu').find('a.selected').addClass('opened').next('.js-left-menu-node').show()
  $('.js-left-menu').find('li.selected').addClass('opened')

  # выставляем класс для «по-настоящему» активному пункту меню
  # чтобы при повторном открытии ноды с этим пунктом меню, он подсвечивался основным цветом.
  $('.js-left-menu a.selected').last().addClass('current-active')

  # просматриваем все ссылки под которыми пустые подменю
  $('.js-left-menu-node').filter(':empty').prev('a').addClass('empty')

  # в $elem находится тэг 'a', по которому произошел клик
  $('.js-left-menu a').on('click', (e) ->
    e.preventDefault()
    $elem = $(e.target)
    unless $elem.next('.js-left-menu-node').is(':empty') || $elem.next('.js-left-menu-node').length == 0
      # скрываем все открытые пункты меню
      # обходим ноду текущей ссылки,чтобы включить показать/скрыть при повторном клике на текущей ноде меню
      $elem.closest('.js-left-menu-node').find('.opened').not($elem).removeClass('opened').next('.js-left-menu-node').slideUp(100)

      # открываем нужный пункт меню
      $elem.next('.js-left-menu-node').slideToggle(100)
      $elem.toggleClass('opened').parent('li').toggleClass('opened')
    else
      # если кликаем по тексту, который внутри ссылки обернут в span
      # то переходим по ссылке-родителя данного текста
      window.location = $(e.target).closest('a').attr('href')
  )

  # клик по тексту рутового уровня меню.
  #
  # вешаем такое не красивое событие на клик текста в самом верхнем уровне меню
  # по дизайну, верхний уровень всегда только открывает подпункты
  # поэтому экранируем клики по span внутри ссылок
  #  $('.js-left-menu:first-child > li > a > span').on('click', (e) ->
  #    e.preventDefault()
  #    e.stopPropagation()
  #    $(this).closest('a').click()
  #  )

  # выставляем особый стиль при наведении и скрытии курсора
  $('.js-left-menu a').hover( ->
    $(@).addClass('hovered')
  , ->
    $(@).removeClass('hovered')
  )

