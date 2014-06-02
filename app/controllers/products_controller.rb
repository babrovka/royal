# coding: utf-8

class ProductsController < ApplicationController

  before_filter :selected_brands, :selected_taxon, :selected_taxonomy

  def index
    @cart = current_cart
    seo = SeoData.find_by_page('Продукция главная')
    @title = seo.try(:title) || ''
    @meta_description = seo.try(:description) || ''
    @seo_text = seo.try(:seo_text) || ''

    @products = Product.order('title ASC')
    @products = @products.where(:brand_id => params[:brand_ids]) if params[:brand_ids]
  end
  
  def show
    @product ||= Product.find(params[:id])
    @articles = Article.order("created_at DESC").limit(3)
    @procedures = @product.procedures
    @recommended = Product.latest.limit(3)
    if @product.seo_title
      @title = @product.seo_title
    else
      @title = @product.title
    end
    @meta_description = @product.seo_description
    @seo_text = @product.seo_text

    # переменные для breadcrumbs на странице продукта
    @selected_taxon ||= @product.taxons.first
    @selected_taxonomy ||= @selected_taxon.try(:taxonomy)
  end
  
  def select
    @products = Product.find( :all, :include => :taxons, :conditions => ["taxons.id in (select id from taxons where id in (?))", params[:taxon_ids]])
    
    respond_to do |format|
        format.html { render :template => "products/index" }
    end
  end


  private

  def selected_brands
    @selected_brands ||= Brand.where(id: params[:brand_ids])
  end

  # если есть продукт, то берем таксон, который относится непосредственно к нему
  def selected_taxon
    @selected_taxon ||= @product.try(:taxon)
  end

  def selected_taxonomy
    @selected_taxonomy ||= selected_taxon.try(:taxonomy)
  end
    
end
