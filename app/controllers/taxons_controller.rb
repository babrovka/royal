class TaxonsController < ApplicationController
  def show
    @taxon = Taxon.find(params[:id])
    @products = @taxon.products
    render :template => "/products/index" 
  end
end
