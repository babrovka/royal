class StaticPagesController < ApplicationController
  def home
    @articles = Article.order("created_at DESC").limit(3)
    @events = Event.order("created_at DESC").limit(3)
    @products = Product.order("created_at DESC").limit(3)
  end
  
  def about
  end
  
  def contacts
    @question = Question.new
  end
end
