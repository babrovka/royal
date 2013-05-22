ActiveAdmin.register Publication do
  config.batch_actions = false
  config.clear_sidebar_sections!

  index do                            
    column :title                     
    column :image do |row|
      if row.image?
        image_tag row.image.url(:thumb)
      end
    end
    column :file do |row|
      if row.file?
        link_to row.file_file_name, row.file.url(:original, false)
      end
    end      
    default_actions                   
  end

  form do |f|  
    f.inputs do
      f.input :title
      f.input :file, :as => :file, :hint => ( f.object.new_record? || !f.object.file ) ? nil : link_to(f.object.file_file_name, f.object.file.url(:original, false), target: "_blank")
      f.input :image, :as => :file, :hint => ( f.object.new_record? || !f.object.image ) ? nil : image_tag(f.object.image.url(:thumb))
    end
    
    f.actions
  end
  
  show do
    attributes_table do
      row :title
      row :image do |row|
        if row.image?
          image_tag row.image.url(:thumb)
        end
      end
      row :file do |row|
        if row.file?
          link_to row.file_file_name, row.file.url(:original, false)
        end
      end   
   end
 end

end
