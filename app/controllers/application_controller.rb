class ApplicationController < ActionController::Base
  protect_from_forgery
  
   private
    
  def current_cart
    cart = Cart.find_by_user_id(current_user.id)
  if cart.nil?
    cart = Cart.create(:user_id => current_user.id)
  end
    cart
  end
end
