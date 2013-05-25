class StaticPagesController < ApplicationController
  def home
  end
  
  def about
  end
  
  def contacts
    @question = Question.new
  end
end
