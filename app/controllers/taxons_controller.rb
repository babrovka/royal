class TaxonsController < ApplicationController
  def show
    @taxon = Taxon.find(params[:id])
    @products = @taxon.products
    @title = @taxon.seo_title
    @meta_description = @taxon.seo_description
    @seo_text = @taxon.seo_text
    render :template => "/products/index" 
  end
end
