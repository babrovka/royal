ActiveAdmin.register Article do
  config.batch_actions = false
  config.clear_sidebar_sections!
  config.sort_order = "date_desc"
  index do 
    column :title
    column :date
    column :short_text
    default_actions
  end
  
  form do |f|  
    f.inputs do
      f.input :title
      f.input :date, :as => :datepicker
      f.input :short_text, :input_html => { :rows => 2  }
      f.input :text, :as => :ckeditor, :label => false
    end
    f.has_many :article_images do |attachment_form|      
      attachment_form.input :image, :as => :file, :hint => ( attachment_form.object.new_record? || !attachment_form.object.image ) ? nil : image_tag(attachment_form.object.image.url(:thumb))
      attachment_form.input :_destroy, :as => :boolean, :required => false, :label => I18n.t('destroy')
    end
    f.actions
  end
  
  show do |article|
    
    attributes_table do
      row :title
      row :date
      row :short_text
    end
    
    panel "Images" do 
      table_for article.article_images do 
        column :image do |column|
          if column.image?
          image_tag column.image.url(:thumb)
        end
        end
      end
    end
    
   end
  
end
