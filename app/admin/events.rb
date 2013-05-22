ActiveAdmin.register Event do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
   index do 
     column :title
     column :date
     column :text
     default_actions
   end

   form do |f|  
     f.inputs  do
       f.input :title
       f.input :date, :as => :datepicker
       f.input :text
     end
     f.actions
   end

  show do
    attributes_table do
      row :title
      row :date
      row :text
    end  
   end 
end
