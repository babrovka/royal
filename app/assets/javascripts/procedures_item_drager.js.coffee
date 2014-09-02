# структура элементов
###
input
  .js-dragger-container
    .js-dragger
    ol
      .js-dragger-visible data-id
      <other elements>
###
$ ->
  drag_container = '.js-dragger-container'
  drag_visible = '.js-dragger-visible'
  position_input = '.js-dragger-input'
  remove_input = '.js-dragger-destroy'

  drag_html = '<span class="js-dragger drag-btn"><span class="fa fa-arrows"></span>переместить</span>'
  up_html = '<span class="js-dragger-up move-btn"><span class="fa fa-caret-up"></span>выше</span>'
  down_html = '<span class="js-dragger-down move-btn"><span class="fa fa-caret-down"></span>ниже</span>'
  remove_html = '<span class="js-dragger-remove remove-btn"><span class="fa fa-times"></span>удалить</span>'


  # вставляем элементы управления в каждый перемещаемый див
  $remove_btn = $(remove_html).prependTo(drag_container)
  $down_btn = $(down_html).prependTo(drag_container)
  $up_btn = $(up_html).prependTo(drag_container)
  $drag_btn = $(drag_html).prependTo(drag_container)


  # возвращает элементы, которые требуют скрытия (или показа)
  # когда перемещаем объекты, некоторые контроллы скрываем для удобства восприятия
  # на входе dom элемент или класс передвигаемого объекта
  elements_to_hide = (target) ->
    $(target).closest(drag_container).parent().find("> #{drag_container} > ol").children().not(drag_visible)


  # возвращает коллекцию id объектов
  # коллекцию уже отсортированных id
  # на входе контейнер, внутри которого происходила сортировка или кнопка «вверх» и другие
  write_sorted_ids = (container) ->
    $elems = $(container).closest('.ui-sortable').find("> #{drag_container} > ol > #{position_input} input")
    ids = []
    $.each($elems, (i, elem)->
      ids.push($(elem).data('id'))
      console.log $(elem).val(i)
    )

    ids


  # скрываем все элементы одной категории (кроме заголовков)
  $($drag_btn).on('mousedown', (e) ->
    elements_to_hide(e.target).velocity('fadeOut', { duration: 300 })
  )
  # вновь показываем все элементы
  $(document).on('mouseup', (e) ->
    elements_to_hide('.js-dragger').velocity('fadeIn', { duration: 0, delay: 200 })
  )

  # активатор сортировки
  $(drag_container).parent().sortable(
    handle: $drag_btn
    items: "> #{drag_container}"
    delay: 500
    opacity: 0.5
    revert: false


    update: (e, ui) =>
      # пока через ajax не отправляем на сервер
      # исполнение этого метода не нужно
      write_sorted_ids(e.target)

  )

  # возращает список элементов, подвластных сортировке
  # на входе кнопка «вверх» или «вниз»
  # относительно которой и высчитываются элементы к сортировке
  elems_to_sort = (from) ->
    $current = $(from)
    $container = $current.closest('.ui-sortable')
    $elems_to_sort = $container.find('> fieldset')

  # клик по кнопке «двигай вверх»
  $up_btn.on('click', (e) ->
    $current = $(e.target)
    $current_move_block = $current.closest('fieldset')
    $elems_to_sort = elems_to_sort($current)
    current_pos = $elems_to_sort.index($current_move_block)
    to_move_pos = current_pos-1
    if to_move_pos > -1
      $current_move_block.insertBefore($elems_to_sort[to_move_pos]).effect('highlight')
      write_position_to_inputs($current)
    else
      $current_move_block.effect('highlight')
  )

  # клик по кнопке «двигай вниз»
  $down_btn.on('click', (e) ->
    $current = $(e.target)
    $current_move_block = $current.closest('fieldset')
    $elems_to_sort = elems_to_sort($current)
    current_pos = $elems_to_sort.index($current_move_block)
    to_move_pos = current_pos+1
    if to_move_pos < $elems_to_sort.length
      $current_move_block.insertAfter($elems_to_sort[to_move_pos]).effect('highlight')
      write_position_to_inputs($current)
    else
      $current_move_block.effect('highlight')
  )


  # коллекция инпутов, куда можно записать позиции отсортированных элементов
  # на входе кнопка «вверх» или другой элемент сортируемого блока
  sortable_elems_inputs = (from) ->
    $fieldsets = elems_to_sort(from)
    $fieldsets.find("> ol > #{position_input} input")

  # записываем новые позиции в инпуты
  # после того, как инпуты отсортированны в dom
  # просто проходимся по ним и записываем число от 0 до N
  write_position_to_inputs = (from) ->
    console.log from
    $inputs = sortable_elems_inputs(from)
    $.each($inputs, (i, input) ->
      $(input).val(i)
    )
#    для проверки работы записи в инпуты
#    $.each $inputs, (i, elem) ->
#      console.log $(elem).val()


  # клик по кнопке «удалить»
  $remove_btn.on('click', (e) ->
    $container = $(e.target).closest('fieldset')
    $container.find("#{remove_input} input").val(true)
    $container.velocity(
      backgroundColor: '#b24926',
      duration: 300,
      complete: ->
        $container.velocity('fadeOut', duration: 300 )
    )
  )