class SearchController < ApplicationController
  def search
    @search = params[:search]
    @results = ThinkingSphinx.search(params[:search])  
    
    respond_to do |format|
      format.html
      format.js
    end
    
  end
end