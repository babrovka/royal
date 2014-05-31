# endless подгрузка продукции
$ ->
  $(window).scroll ->
    link = $('.pagination .next_page').attr('href')
    if link && $(window).scrollTop() > $(document).height() - $(window).height() - 200
      $('.pagination').text('загрузка списка продукции...')
      $.getScript(link)

