class ProductsController < ApplicationController
  def index
    @cart = current_cart
      
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
  end
end
