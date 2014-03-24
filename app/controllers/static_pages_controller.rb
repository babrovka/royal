# coding: utf-8

class StaticPagesController < ApplicationController
  def home
    @articles = Article.order("created_at DESC").limit(3)
    @events = Event.order("created_at DESC").limit(3)
    @products = Product.latest.limit(3)
    seo = SeoData.find_by_page('Главная страница')
    @title = seo.title
    @meta_description = seo.description
    @seo_text = seo.seo_text
  end
  
  def about
  end
  
  def contacts
    @question = Question.new
  end
  
  def partners
  end
end
