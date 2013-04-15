ActiveAdmin.register Article do
  
  
  form do |f|  
    f.inputs "Details" do
      f.input :title
      f.input :date, :as => :datepicker
      f.input :text
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
      row :text do |row|
        row.text.html_safe
      end
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
