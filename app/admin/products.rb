ActiveAdmin.register Product do
  menu :parent => I18n.t('catalog')
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  index do
    column :title
    column :latest
    column :brand_id do |column|
      Brand.find(column.brand_id).title
    end
    default_actions
  end

   form do |f|  
     f.inputs do
       f.input :title
       f.input :latest
       f.input :short_description, :input_html => { :rows => 2  }
       f.input :packing
       f.input :text, :input_html => { :rows => 8  }
       f.input :ingredients, :input_html => { :rows => 8  }
       f.input :brand_id, :as => :select, :collection => Brand.all, :include_blank => false
       f.input :product_category_id, :as => :select, :collection => ProductCategory.all, :include_blank => false
     end 
     
     f.inputs t('access') do
       f.input :visible_professional      
       f.input :visible_dealer1
       f.input :visible_dealer2
       f.input :visible_dealer3
       f.input :price_professional
       f.input :price_dealer1
       f.input :price_dealer2
       f.input :price_dealer3
     end
       
     f.inputs t('procedures') do
       f.input :procedures, :as => :check_boxes
     end
     f.inputs t('cases') do
       f.input :cases, :as => :check_boxes
     end
     
     f.has_many :product_images do |attachment_form|      
       attachment_form.input :image, :as => :file, :hint => ( attachment_form.object.new_record? || !attachment_form.object.image ) ? nil : image_tag(attachment_form.object.image.url(:catalog))
       attachment_form.input :_destroy, :as => :boolean, :required => false, :label => I18n.t('destroy')
     end
     
     f.actions
   end
   
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
   
   
   
end