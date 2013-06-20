class SearchController < ApplicationController

  def search
    @search = params[:search]

    @results = Product.search do
      fulltext 'CAVIAR'
    end
    
    

    respond_to do |format|
      format.html
      format.js
    end

  end

end


