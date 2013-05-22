ActiveAdmin.register Case do
  menu :parent => I18n.t('catalog')
  
   index do 
     column :title
     column :text
     default_actions
   end

   form do |f|  
     f.inputs "Details" do
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
