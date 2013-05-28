ActiveAdmin.register Album do
  menu :parent => I18n.t('media')
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
    
    f.has_many :album_images do |attachment_form|      
      attachment_form.input :image, :as => :file, :hint => ( attachment_form.object.new_record? || !attachment_form.object.image ) ? nil : image_tag(attachment_form.object.image.url(:thumb))
      attachment_form.input :_destroy, :as => :boolean, :required => false, :label => I18n.t('destroy')
    end
    f.actions
  end
  
  show do |album|
    attributes_table do
      row :title
    end
    
    panel t('images') do 
      table_for album.album_images do 
        column :image do |column|
          if column.image?
          image_tag column.image.url(:thumb)
        end
        end
      end
    end
      
   end

end
