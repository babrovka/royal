module ProductsHelper
  
  def price(product)
    if current_user.role == 'professional'
      product.price_professional
    elsif current_user.role == 'dealer1'
      product.price_dealer1
    elsif current_user.role == 'dealer2'
      product.price_dealer2
    else 
      product.price_dealer3
    end
  end
  
  def total_price(item)
    price(item.product) * item.quantity
  end
  
  def total_cart_price(cart)
    cart.line_items.to_a.sum { |item| total_price(item) }
  end
  
end
