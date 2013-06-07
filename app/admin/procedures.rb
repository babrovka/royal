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
       f.input :text, :input_html => { :rows => 5  }
       
       f.has_many :stages do |stage_fields|      
         stage_fields.input :title
         
         stage_fields.has_many :substages do |substage_fields|      
            substage_fields.input :text, :input_html => { :rows => 2  }
            substage_fields.input :product_id, :as => :select, :collection => Product.all, :include_blank => true
          end
          
       end
       
     end
     f.actions
   end

  show do |procedure|
    attributes_table do
      row :title
      row :text
    end  
    
    panel t('stages') do 
      table_for procedure.stages do 
        column :title do |stage|
          stage.title
        end
        
        column :substages do |stage|
          stage.substages.map(&:text).join(", ")
        end

        
      end
      
      
      
      
    end
    
   end
end
