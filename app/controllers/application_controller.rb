class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
    
  def current_cart
  if current_user
    cart = Cart.find_or_create_by_user_id(current_user.id)
  else
    cart = nil
  end
    @cart
  end
end
