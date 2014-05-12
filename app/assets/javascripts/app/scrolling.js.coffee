$ ->
  # первоначальные состояния элементов
  $window = $(window)
  $left_menu = $('.js-left-menu-container')
  $left_menu.addClass('visible-animate')
  $scroll_top_btn = $('.js-scroll-top-btn')

  $scroll_top_btn.hide()

  height_to_change_render = ->
    if $left_menu.length
      $left_menu.height() + $left_menu.offset().top - 20


  # показываем кнопку
  enable_scroll_top_btn = () =>
    if $scroll_top_btn.length
      $scroll_top_btn.fadeIn(200).one('click', (e) => scroll_to_top(e))
      $('body').addClass('scrolled')
      $('.js-products-list-change-render').addClass('span12').removeClass('span8')
    @

  disable_scroll_top_btn = () ->
    if $scroll_top_btn.length
      $scroll_top_btn.fadeOut(200)
      $('body').removeClass('scrolled')
      $('.js-products-list-change-render').addClass('span8').removeClass('span12')
    @


  # скроллим вверх страницы
  # скролл плавный, вначале мы резко взлетаем вверх
  # после чего по анимации докручиваем до конца
  scroll_to_top = (e) =>
    e.preventDefault()
    enable_left_menu()
    window.scrollTo(0, 400)
    $('html, body').animate({ scrollTop: 0 }, 200)
    false


  # переключаем режим просмотра левого меню
  # при скроллинге вниз, для красоты мы скрываем левое меню
  # а при скроллинге наверх, вновь показываем его
  hide_left_menu = ->
    $left_menu.addClass('invisible-animate').removeClass('visible-animate')

  enable_left_menu = ->
    $left_menu.addClass('visible-animate').removeClass('invisible-animate')


  # вводим переменную, чтобы улучшить производительность
  # и активировать методы только один раз
  is_scrolled = false

  # обработка скроллинга окна
  # привязываемся к высоте левого меню
  # чтобы всегда начать просмотр списка продуктов сначала
  # это самый простой способ не допустить пропуска каких-то продуктов в мертвой зоне
  window.onscroll =  (e) =>
    if $window.scrollTop() > height_to_change_render()
      unless is_scrolled
        enable_scroll_top_btn()
        hide_left_menu()
      is_scrolled = true
    else
      if is_scrolled
        disable_scroll_top_btn()
        enable_left_menu()
      is_scrolled = false

