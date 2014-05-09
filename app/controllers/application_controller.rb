# coding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :parthners, :cities, :products_brands, :products_cases

    
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

  private

  def parthners
    @_parthners ||= Partner.all
  end

  def cities
    @_cities ||= City.all
  end

  def products_brands
    @_products_brands ||= Brand.all
  end

  def products_cases
    @_products_cases ||= Case.order('title')
  end

end
