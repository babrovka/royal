window.test ||= {}
window.test =
  left_menu_check: ->
    @.debug($('.js-left-menu a').hasClass('hovered') == false)
    @.debug($('.js-left-menu a').first().trigger('hover').hasClass('hovered') == true)

    $('.js-left-menu a').trigger('hover').hasClass('hovered')


  debug: (condition) ->
    if condition
      console.log 'true'
    else
      console.log 'false'

$ ->
  # класс .selected есть у пунктов меню, на странице которых мы сейчас находимся
  # открываем их (активируем)
  # попутно выставляем класс opened для ссылок, подсветить активные пункт
  # и выставить стрелочки в нужном направлении
  $('.js-left-menu').find('a.selected').addClass('opened').next('.js-left-menu-node').show()
  $('.js-left-menu').find('li.selected').addClass('opened')

  # выставляем класс для «по-настоящему» активному пункту меню
  # чтобы при повторном открытии ноды с этим пунктом меню, он подсвечивался основным цветом.
  console.log $('.js-left-menu a.selected').last().addClass('current-active')

  # просматриваем все ссылки под которыми пустые подменю
  $('.js-left-menu-node').filter(':empty').prev('a').addClass('empty')

  # в $elem находится тэг 'a', по которому произошел клик
  $('.js-left-menu a').on('click', (e) ->
    e.preventDefault()
    $elem = $(e.target)
    unless $elem.next('.js-left-menu-node').is(':empty') || $elem.next('.js-left-menu-node').length == 0
      # скрываем все открытые пункты меню
      # обходим ноду текущей ссылки,чтобы включить показать/скрыть при повторном клике на текущей ноде меню
      $elem.closest('.js-left-menu-node').find('.opened').not($elem).removeClass('opened').next('.js-left-menu-node').slideUp(140)

      # открываем нужный пункт меню
      $elem.next('.js-left-menu-node').slideToggle(140)
      $elem.toggleClass('opened').parent('li').toggleClass('opened')
    else
      window.location = e.target.href
  )


