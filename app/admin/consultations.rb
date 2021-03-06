ActiveAdmin.register Consultation do
  config.batch_actions = false
  config.clear_sidebar_sections!
  menu :parent => I18n.t('catalog')
  
  form do |f|  
    f.inputs do
      f.input :question, :input_html => { :rows => 3  }
      f.input :answer, :input_html => { :rows => 8  }
      f.input :brand_id, :as => :select, :collection => Brand.all
      f.input :case_id, :as => :select, :collection => Case.all, input_html: {class: 'select2able'}
      f.input :check
    end 
    
    f.inputs t('products') do
      f.input :products, :as => :check_boxes      
    end
      
    f.actions
  end

  show do |consultation|

    attributes_table do
      row :question
      row :answer
      row :brand_id
      row :case_id
      row :check
      end

    panel "Products" do 
      table_for consultation.products do 
        column :title do |column|
          link_to column.title, admin_product_path(column)
        end
      end
    end
    
   end
  
end
