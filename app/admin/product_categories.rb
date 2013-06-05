ActiveAdmin.register ProductCategory do
  menu :parent => I18n.t('catalog')
  config.batch_actions = false
  config.clear_sidebar_sections!
  
   index do 
     column :brand_id do |column|
       Brand.find(column.brand_id).title
     end
     column :title
     
     default_actions
   end

   form do |f|  
     f.inputs do
       f.input :brand_id, :as => :select, :collection => Brand.all, :include_blank => true
       f.input :title
     end
     f.actions
   end

  show do
    attributes_table do
      row :brand_id
      row :title
    end  
   end
end
