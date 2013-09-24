ActiveAdmin.register ProductImage do
  belongs_to :product
  navigation_menu :product
  
  member_action :crop do
    @product = Product.find(params[:id])
    @product_image = ProductImage.find(@product.product_images.first.id)
  end
  
  controller do
    
    def update
      @product_image = ProductImage.find(params[:id])
      @product = Product.find(@product_image.product_id)
      @product_image.update_attributes(params[:product_image])
      redirect_to admin_product_path(@product)
    end
      

    def destroy
      @product_image = ProductImage.find(params[:id])
      @product_image.destroy
      
      respond_to do |format|
        format.js
      end
    end
    
  end
end
