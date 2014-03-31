# coding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  
    
  def current_cart
  if current_user
    cart = Cart.find_or_create_by_user_id(current_user.id)
  else
    cart = nil
  end
    @cart = cart
  end
  
    
    def seo_text
      seo = SeoData.find_by_page('Главная страница')
      @seo_text = seo.try(:seo_text) || ''
    end
  
end
