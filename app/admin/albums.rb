ActiveAdmin.register Album do
  menu :parent => I18n.t('media')
  config.batch_actions = false
  config.clear_sidebar_sections!

  index do 
    column :title
    default_actions
  end

  form :partial => "form"
  
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
