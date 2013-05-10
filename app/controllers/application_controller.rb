class ApplicationController < ActionController::Base
  protect_from_forgery
    
  def current_cart
    Cart.find_by_user_id(current_user.id)
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create(:user_id => current_user.id)
    cart
  end
end
