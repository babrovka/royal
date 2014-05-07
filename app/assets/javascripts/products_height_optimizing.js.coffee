window.app ||= {}
window.app.product ||= {}

window.app.product =
  container: '.js-product-box'
  shorting_area: '.js-product-box-shorting-area'
  exceeding_area: '.js-product-box-description'
  to_shorted_area: 'img'

$ ->
  P = window.app.product
  $products = $(P.container)
  console.log $products.length
  $.each($products, (product) ->
    $product = $(@)
    $exceeding = $product.find(P.exceeding_area)
    $to_shorted_area = $product.find(P.to_shorted_area)
    if $exceeding.height() > $to_shorted_area.height()
      console.log 'need to shorting'
  )
