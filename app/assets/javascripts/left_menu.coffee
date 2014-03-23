window.app = {}
window.app =
  active_item: (id) ->
    console.log $("#taxon-#{id}")
    $("#taxon-#{id}").closest('.js-left-menu').prev('h3').trigger('click')
    $("#taxon-#{id}").closest('.left-menu-submenu').prev('h3').trigger('click')

$ ->
  $(".js-left-menu").accordion(
    heightStyle: "content",
    animate: 100,
    collapsible: true,
    active: false,
  )

  # показываем активный пункт меню. Его id хранится в .js-left-menu-active-item
  timer_id = setTimeout( ->
    app.active_item($('.js-left-menu-active-item').data('id'))
    clearTimeout(timer_id)
  , 500)

