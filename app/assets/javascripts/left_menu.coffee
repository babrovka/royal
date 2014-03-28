$ ->
  # класс .selected есть у пунктов меню, на странице которых мы сейчас находимся
  # открываем их (активируем)
  $('.js-left-menu').find('.selected').find('.js-left-menu-node').show()
  $('.js-left-menu').find('.selected').addClass('opened')

  # просматриваем все ссылки под которыми пустые подменю
  $('.js-left-menu-node').filter(':empty').prev('a').addClass('empty')

  # в $elem находится тэг 'a', по которому произошел клик
  $('.js-left-menu a').on('click', (e) ->
    e.preventDefault()
    $elem = $(e.target)
    unless $elem.next('.js-left-menu-node').is(':empty') || $elem.next('.js-left-menu-node').length == 0
      # скрываем все открытые пункты меню
      # обходим ноду текущей ссылки,чтобы включить показать/скрыть при повторном клике на текущей ноде меню
      $elem.closest('.js-left-menu-node').find('.opened').not($elem).removeClass('opened').next('.js-left-menu-node').slideUp(70)

      # открываем нужный пункт меню
      $elem.next('.js-left-menu-node').slideToggle(70)
      $elem.toggleClass('opened').parent('li').toggleClass('opened')
    else
      window.location = e.target.href
  )