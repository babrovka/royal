$ ->
  # первоначальные состояния элементов
  $('.js-scroll-top-btn').hide()
  $window = $(window)

  # показываем кнопку
  enable_scroll_top_btn = () =>
    $('.js-scroll-top-btn').fadeIn(200).one('click', (e) => scroll_to_top(e))
    $('body').addClass('scrolled')
#    $('#products-catalog .span8').first().
    $('.js-products-list-change-render').addClass('span12').removeClass('span8')
    @

  disable_scroll_top_btn = () ->
    $('.js-scroll-top-btn').fadeOut(200)
    $('body').removeClass('scrolled')
    $('.js-products-list-change-render').addClass('span8').removeClass('span12')
    @

  scroll_to_top = (e) =>
    e.preventDefault()
#    вначале без анимации пролестать до 100 пикселов
#    а потом плавно пролистать до 0
    $("html, body").animate({ scrollTop: 0 }, 200)
    false


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

