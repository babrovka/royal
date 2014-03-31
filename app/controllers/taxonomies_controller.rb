class TaxonomiesController < ApplicationController

  before_filter :selected_brands, :selected_taxonomy

  def show
    taxonomy = Taxonomy.find(params[:id])
    @products = Product.includes(:taxon).where(:taxons => {:taxonomy_id => taxonomy.id})
    @title = taxonomy.try(:seo_title) || ''
    @meta_description = taxonomy.try(:seo_description) || ''
    @seo_text = taxonomy.try(:seo_text) || ''
    render :template => "/products/index"
  end

  private

  def selected_brands
    @selected_brands ||= Brand.where(id: params[:brand_ids])
  end

  def selected_taxonomy
    @selected_taxonomy ||= @taxonomy || Taxonomy.find(params[:id])
  end
end
