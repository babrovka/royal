class TaxonomiesController < ApplicationController
  def show
    taxonomy = Taxonomy.find(params[:id])
    @products = Product.includes(:taxon).where(:taxons => {:taxonomy_id => taxonomy.id})
    render :template => "/products/index"
  end
end
