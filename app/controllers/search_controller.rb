class SearchController < ApplicationController

  def search
    @query = params[:search]
    
    @results = ThinkingSphinx.search @query
    
    

    respond_to do |format|
      format.html
      format.js
    end

  end

end
