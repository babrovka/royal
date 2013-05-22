ActiveAdmin.register Video do
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
       f.input :youtube
     end
     f.actions
   end

  show do
    attributes_table do
      row :title
      row :youtube do |row|
        raw(youtube_embed(row.youtube))
      end
    end  
   end
end
