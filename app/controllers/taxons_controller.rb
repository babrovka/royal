class TaxonsController < ApplicationController
  before_filter :selected_brands, :selected_taxonomy, :selected_taxon, :seo_text

  def show
    #brands = params[:brand_ids]
    @taxon = Taxon.find(params[:id])
    @products = Product.where(:taxon_id => @taxon.self_and_descendants.pluck(:id))
    @products = @products.where(:brand_id => params[:brand_ids]) if params[:brand_ids]
    @title = @taxon.seo_title
    @meta_description = @taxon.try(:seo_description) || ''
    @seo_text = @taxon.try(:seo_text) || ''
    render :template => "/products/index" 
  end

  private

  def selected_brands
    @selected_brands ||= Brand.where(id: params[:brand_ids])
  end

  def selected_taxon
    @selected_taxon ||= @taxon ||  Taxon.find(params[:id])
  end

  def selected_taxonomy
    @selected_taxonomy ||= selected_taxon.taxonomy
  end

end
