ActiveAdmin.register Taxon do
  menu :parent => I18n.t('catalog')
  config.batch_actions = false
  filter :taxonomy_id

   index do 
     column :title
     default_actions
   end

   form do |f|  
     f.inputs do
       f.input :title
       f.input :products, :as => :check_boxes
     end
     f.actions
   end

  show do
    attributes_table do
      row :title
    end  
   end
end
