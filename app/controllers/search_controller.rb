class SearchController < ApplicationController

  def search
    @query = params[:search]
    
    @search = Sunspot.search(Product) do
      fulltext params[:search]
    end
    @results = @search.results
    
    

    respond_to do |format|
      format.html
      format.js
    end

  end

end
