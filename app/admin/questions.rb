ActiveAdmin.register Question do
  config.batch_actions = false
  config.clear_sidebar_sections!
  actions :index, :show, :destroy
  
  index do 
    column :name
    column :email
    column :phone
    column :text do |row|
      row.text.html_safe
    end
    default_actions
  end
  
  show do
    attributes_table do
      row :name
      row :email
      row :phone
      row :text 
    end  
   end
   
end
