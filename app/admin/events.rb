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
       f.input :city_id, :as => :select,      :collection => City.all
       f.input :title
       f.input :date, :as => :datepicker
       f.input :text, :as => :ckeditor, :label => false
     end
     f.actions
   end

  show do
    attributes_table do
      row :city_id
      row :title
      row :date
      row :text do |row|
        row.text.html_safe
      end
    end  
   end 
end
