# coding: utf-8

class ProductsController < ApplicationController

  before_filter :get_brands, :get_taxon

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

    @selected_taxon ||= @product.try(:taxon)
  end
  
  def select
    @products = Product.find( :all, :include => :taxons, :conditions => ["taxons.id in (select id from taxons where id in (?))", params[:taxon_ids]])
    
    respond_to do |format|
        format.html { render :template => "products/index" }
    end
  end


  private

  def get_brands
    @selected_brands ||= Brand.where(id: params[:brand_ids])
  end

  # если есть продукт, то берем таксон, который относится непосредственно к нему
  def get_taxon
    @selected_taxon ||= @product.try(:taxon)
  end
    
end
