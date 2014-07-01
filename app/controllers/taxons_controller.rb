class TaxonsController < ApplicationController
  before_filter :selected_brands, :selected_taxonomy, :selected_taxon, :seo_text

  def show
    taxons = selected_taxon.self_and_descendants
    @products = Product.includes(:taxons).where(:taxons => {:id => taxons})
    @products = @products.where(:brand_id => params[:brand_ids]) if params[:brand_ids]
    @products = @products.page(params[:page]).per_page(10)
    @title = selected_taxon.seo_title
    @meta_description = selected_taxon.try(:seo_description) || ''
    @seo_text = selected_taxon.try(:seo_text) || ''
    render :template => "/products/index" 
  end

  private

  def selected_brands
    @selected_brands ||= Brand.where(id: params[:brand_ids])
  end

  def selected_taxon
    @selected_taxon ||= @taxon ||  Taxon.find(params[:id])
    session[:taxon_id] = @selected_taxon.id
    @selected_taxon
  end

  def selected_taxonomy
    @selected_taxonomy ||= selected_taxon.taxonomy
  end

end
