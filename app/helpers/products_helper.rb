module ProductsHelper
  
  def price(product)
    if current_user.role == 'professional'
      price = product.price_professional
    elsif current_user.role == 'dealer1'
      price = product.price_dealer1
    elsif current_user.role == 'dealer2'
      price = product.price_dealer2
    else 
      price = product.price_dealer3
    end
  end
  
  def product_has_price(product)
    if product.price_professional && product.price_dealer1 && product.price_dealer2 && product.price_dealer3
      true
    else
      false
    end
  end
  
  def total_price(item)
    price(item.product) * item.quantity
  end
  
  def total_cart_price(cart)
    cart.line_items.to_a.sum { |item| total_price(item) }
  end
  
  def category_title(category)
    
    
      ProductCategory.find(category).title
      rescue ActiveRecord::RecordNotFound
      nil
    
  end
    
  
  def bronte_link
    class_name = params[:brand_id] == "1" || params[:brand_id] == nil ? 'image-link br active' : 'image-link br'
    link_to "Bronte", products_path(:brand_id => "1"), :class => class_name, remote: true
  end
  
  def belter_link
    class_name = params[:brand_id] == "2" ? 'image-link be active' : 'image-link be'
    link_to "Belter", products_path(:brand_id => "2"), :class => class_name, remote: true
  end
  
  def thalissi_link
    class_name = params[:brand_id] == "3" ? 'image-link th active' : 'image-link th'
    link_to "Thalissi", products_path(:brand_id => "3"), :class => class_name, remote: true
  end
  
  def product_seo_path(product)
    if product.taxon
      # почему то slug пустой у таксона
      #product_path(product.taxon.slug, product)
      product_path('no_category', product)
    else
      product_path('no_category', product)
    end
  end
    
  
  
end
