ActiveAdmin.register Video do
  menu :parent => I18n.t('media')
   config.batch_actions = false

   index do 
     column :brand_id do |column|
       
       if column.brand_id.nil?
         t('other')
       else
         Brand.find(column.brand_id).title
       end 
       
     end
     column :title
     default_actions
   end

   form do |f|  
     f.inputs do
       f.input :brand_id, :as => :select, :collection => Brand.all, :include_blank => t('other')
       f.input :title
       f.input :youtube
     end
     f.actions
   end

  show do
    attributes_table do
      row :brand_id do |row|
        if row.brand_id.nil?
          t('other')
        else
          Brand.find(row.brand_id).title
        end
      end
      row :title
      row :youtube do |row|
        raw(youtube_embed(row.youtube))
      end
    end  
   end
end
