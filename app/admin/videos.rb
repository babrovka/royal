ActiveAdmin.register Video do
   config.batch_actions = false
   config.clear_sidebar_sections!

   index do 
     column :title
     default_actions
   end

   form do |f|  
     f.inputs "Details" do
       f.input :title
       f.input :youtube
     end
     f.actions
   end

  show do
    attributes_table do
      row :title
    end  
   end
end
