class StaticPagesController < ApplicationController
  def home
    @articles = Article.order("created_at DESC").limit(3)
    @events = Event.order("created_at DESC").limit(3)
    @products = Product.latest.limit(3)
  end
  
  def about
  end
  
  def contacts
    @question = Question.new
  end
  
  def partners
  end
end
