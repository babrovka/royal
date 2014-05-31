class TaxonomiesController < ApplicationController

  before_filter :selected_brands, :selected_taxonomy

  def show
    taxon_ids = Taxon.where(taxonomy_id: selected_taxonomy.id).map(&:id)
    @products = Product.includes(:taxons).where(taxons: { id: taxon_ids })
    @title = selected_taxonomy.try(:seo_title) || ''
    @meta_description = selected_taxonomy.try(:seo_description) || ''
    @seo_text = selected_taxonomy.try(:seo_text) || ''
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
