class TaxonsController < ApplicationController
  before_filter :get_brands

  def show
    #brands = params[:brand_ids]
    @taxon = Taxon.find(params[:id])
    @products = @taxon.products
    @products = @products.where(:brand_id => params[:brand_ids]) if params[:brand_ids]
    @title = @taxon.seo_title
    @meta_description = @taxon.seo_description
    @seo_text = @taxon.seo_text
    render :template => "/products/index" 
  end

  private

  def get_brands
    @selected_brands ||= Brand.where(id: params[:brand_ids])
  end
end
