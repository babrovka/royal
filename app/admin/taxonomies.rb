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
       
       f.inputs 'SEO' do
         f.input :seo_title
         f.input :seo_description,      :input_html => { :rows => 4 }
         f.input :seo_text,      :input_html => { :rows => 8 }
       end
       
       f.actions
     end

    show do
      attributes_table do
        row :title
        row :seo_title
        row :seo_description
        row :seo_text
      end  
     end
end
