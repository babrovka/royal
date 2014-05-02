ActiveAdmin.register City do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
   index do 
     column :title
     default_actions
   end

   form do |f|
     f.inputs do 
       f.input :title
       
       
    
     end
   
     f.has_many :partners do |partner|

         if !partner.object.nil?
            partner.input :_destroy, :as => :boolean, :label => "Удалить?"
          end
         
         partner.input :title 
         partner.input :address 
     end
     
     f.actions
     
   end

  show do |city|
    attributes_table do
      row :title
    end  
    
    panel "Партнеры" do 
      table_for city.partners do
        column "Название" do |partner|
          partner.title
        end
        column "Адресс" do |partner|
          partner.address
        end
      end
    end
   end
   
end
