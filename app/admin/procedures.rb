# coding: utf-8

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
       f.input :short_text, :input_html => { :rows => 4  }
       f.input :text, :input_html => { :rows => 5  }
       f.input :procedure_categories, :as => :select, :collection => ProcedureCategory.all.map {|p| [p.title_with_parent, p.id] } , input_html: {class: 'select2able'}
       f.input :products, :as => :select, :collection => Product.all, input_html: {class: 'select2able_max3'}
       f.input :image, :as => :file, :hint => ( f.object.new_record? || !f.object.image ) ? nil : image_tag(f.object.image.url(:thumb))
       
       f.has_many :stages do |stage_fields|      
         stage_fields.input :title
         stage_fields.input :stage_images, :as => :select, :collection => StageImage.all, input_html: {class: 'select2able'}
         
         stage_fields.has_many :substages do |substage_fields|      
            substage_fields.input :text, :input_html => { :rows => 2  }
            substage_fields.input :products, :as => :select, :collection => Product.all, input_html: {class: 'select2able'}
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
        column 'Заголовок' do |stage|
          stage.title
        end
        column 'Этапы' do |stage|
          stage.substages.map(&:text).join(", ")
        end
      end
    end
    
    panel t('categories') do 
      table_for procedure.procedure_categories do 
        column 'Заголовок' do |category|
          category.title
        end
      end
    end
    
    panel 'Рекомендованные товары' do 
      table_for procedure.products do 
        column 'Заголовок' do |product|
          product.title
        end
      end
    end
    
    
    
   end
end
