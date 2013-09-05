ActiveAdmin.register ProductImage do
  belongs_to :product
  navigation_menu :product
  
  controller do

    def destroy
      @product_image = ProductImage.find(params[:id])
      @product_image.destroy
      
      respond_to do |format|
        format.js
      end
    end
    
  end
end
