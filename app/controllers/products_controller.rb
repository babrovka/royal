# coding: utf-8

class ProductsController < ApplicationController
  def index
    @cart = current_cart
    seo = SeoData.find_by_page('Продукция главная')
    @title = seo.title
    @meta_description = seo.description
    @seo_text = seo.seo_text

    if params[:brand_id]
      @products = Product.where(:brand_id => params[:brand_id])
    else
      @products= Product.where(:brand_id => 1)
    end
    
    respond_to do |format|
      format.html 
      format.js
    end
    
  end
  
  def show
    @product = Product.find(params[:id])
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
  end
  
  def select
    @products = Product.find( :all, :include => :taxons, :conditions => ["taxons.id in (select id from taxons where id in (?))", params[:taxon_ids]])
    
    respond_to do |format|
        format.html { render :template => "products/index" }
    end
  end
    
end
