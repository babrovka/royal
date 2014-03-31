class TaxonomiesController < ApplicationController

  before_filter :selected_brands, :selected_taxonomy

  def show
    taxonomy = Taxonomy.find(params[:id])
    @products = Product.includes(:taxon).where(:taxons => {:taxonomy_id => taxonomy.id})
    render :template => "/products/index"
    seo_text
  end

  private

  def selected_brands
    @selected_brands ||= Brand.where(id: params[:brand_ids])
  end

  def selected_taxonomy
    @selected_taxonomy ||= @taxonomy || Taxonomy.find(params[:id])
  end
end
