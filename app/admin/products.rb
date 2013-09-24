ActiveAdmin.register Product do
  menu :parent => I18n.t('catalog')
  config.batch_actions = false
  filter :latest
  filter :brand_id, :collection => proc { Brand.all }, :as => :check_boxes
  filter :procedures_id, :collection => proc { Brand.all }, :as => :check_boxes

  
  index do
    column :title
    column :latest
    column :brand_id do |column|
      Brand.find(column.brand_id).title
    end
    column :created_at
    default_actions
  end


   form :partial => "form"
   
   show do |product|

     attributes_table do
       row :title
       row :latest
       row :packing
       row :text do |row|
         Redcarpet.new(row.text, :hard_wrap).to_html.html_safe
       end
       row :ingredients do |row|
         Redcarpet.new(row.ingredients, :hard_wrap).to_html.html_safe
       end
       row :brand_id
     end

     panel t('procedures') do 
       table_for product.procedures do 
         column :title do |column|
           link_to column.title, admin_procedure_path(column)
         end
       end
     end
     
     panel t('cases') do 
       table_for product.cases do 
         column :title do |column|
           link_to column.title, admin_case_path(column)
         end
       end
     end

     panel t('images') do 
       table_for product.product_images do 
         column :image do |column|
           if column.image?
           image_tag column.image.url(:catalog)
         end
         end
       end
     end

    end
  

    
    controller do


      def create
        @product = Product.new(params[:product])
        if @product.save
          if params[:product][:product_images_attributes].blank?
            redirect_to admin_product_path(@product)
          else
            render :action => "product_images/crop", :layout => 'active_admin' 
          end
        else
          render :action => 'new'
        end
      end

      def update
        @product = Product.find(params[:id])
        if @product.update_attributes(params[:product])
          if params[:product][:product_images_attributes].blank?
            redirect_to admin_product_path(@product)
          else
            @product_image = ProductImage.find(@product.product_images.first)
            render :action => "product_images/crop", :layout => 'active_admin' 
          end
        else
          render :action => 'edit'
        end
      end

    end
   
   
   
end