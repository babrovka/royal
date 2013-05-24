ActiveAdmin.register Procedure do
  menu :parent => I18n.t('catalog')
  config.batch_actions = false
  config.clear_sidebar_sections!
  
   index do 
     column :title
     column :text
     default_actions
   end

   form do |f|  
     f.inputs do
       f.input :title
       f.input :text
     end
     f.actions
   end

  show do
    attributes_table do
      row :title
      row :text
    end  
   end
end
