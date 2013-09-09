ActiveAdmin.register Taxonomy do
    menu :parent => I18n.t('catalog')
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
       f.actions
     end

    show do
      attributes_table do
        row :title
      end  
     end
end
