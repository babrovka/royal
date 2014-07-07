# coding: utf-8

ActiveAdmin.register ProcedureCategory do
  menu :parent => I18n.t('catalog') 
  config.batch_actions = false
  config.clear_sidebar_sections!
  config.sort_order = "parent_id_asc" 
  
  
   index do 
     
     column :brand_id do |column|
       if column.brand_id 
         Brand.find(column.brand_id).try(:title)
       end
     end
     column :parent_id do |column|
       if column.parent_id 
         ProcedureCategory.find(column.parent_id).try(:title)
       end
     end
     column :title
     
     default_actions
   end

   form do |f|  
     f.inputs do
       f.input :brand_id, :as => :select, :collection => Brand.all
       f.input :parent_id, :as => :select, :collection => ProcedureCategory.where(:depth => 0)
       f.input :title
     end
     f.actions
   end

  show do |category|
    attributes_table do
      row :brand_id
      row :title
      row :parent_id
    end  
    
    panel t('procedures') do 
      table_for category.procedures do 
        column 'Название' do |column|
          column.title
        end
      end
    end
   end
end
