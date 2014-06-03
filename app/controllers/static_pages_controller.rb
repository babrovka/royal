# coding: utf-8

class StaticPagesController < ApplicationController
  def home
    @articles = Article.order("date DESC").limit(3)
    @events = Event.order("created_at DESC").limit(3)
    @products = Product.latest.limit(3)
    seo = SeoData.find_by_page('Главная страница')
    @title = seo.try(:title) || ''
    @meta_description = seo.try(:description) || ''
    @seo_text = seo.try(:seo_text) || ''
  end
  
  def about
  end
  
  def contacts
    @question = Question.new
  end
  
  def partners
  end
end
