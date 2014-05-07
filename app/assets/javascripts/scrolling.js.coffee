$ ->
  # первоначальные состояния элементов
  $('.js-scroll-top-btn').hide()
  $window = $(window)

  # показываем кнопку
  enable_scroll_top_btn = () =>
    console.log 'enable scroll'
    $('.js-scroll-top-btn').fadeIn(200).one('click', (e) => scroll_to_top(e))
    $('body').addClass('scrolled')
    $('#products-catalog .span8').first().addClass('span12').removeClass('span8')

  disable_scroll_top_btn = () ->
    $('.js-scroll-top-btn').fadeOut(200)
    $('body').removeClass('scrolled')
    $('#products-catalog .span12').first().addClass('span8').removeClass('span12')

  scroll_to_top = (e) =>
    e.preventDefault()


  # вводим переменную, чтобы улучшить производительность
  # и активировать методы только один раз
  is_scrolled = false

  window.onscroll =  (e) =>
    if $window.scrollTop() > $window.height()
      enable_scroll_top_btn() unless is_scrolled
      is_scrolled = true
    else
      disable_scroll_top_btn() if is_scrolled
      is_scrolled = false

