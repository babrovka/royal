# coding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :partners, :cities, :products_brands, :products_cases, :cities_with_partners

    
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

  def cities_with_partners
    @_cities_with_parners ||= cities.includes(:partners)
  end

  def partners
    @_partners ||= Partner.all
  end

  def cities
    @_cities ||= City.order('title ASC')
  end

  def products_brands
    @_products_brands ||= Brand.all
  end

  def products_cases
    @_products_cases ||= Case.order('title')
  end

end
