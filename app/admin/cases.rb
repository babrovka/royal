ActiveAdmin.register Case do
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
       f.input :short_description, :input_html => { :rows => 3 }
       f.input :text, :input_html => { :rows => 15 }
       f.input :image, :as => :file, :hint => ( f.object.new_record? || !f.object.image ) ? nil : image_tag(f.object.image.url(:medium))
     end
     f.actions
   end

  show do |product_case|
    attributes_table do
      row :title
      row :short_description do |row|
        Redcarpet.new(row.short_description, :hard_wrap).to_html.html_safe if row.short_description
      end
      row :text do |row|
        Redcarpet.new(row.text, :hard_wrap).to_html.html_safe if row.text
      end
      row :image do 
        image_tag(product_case.image.url(:medium)) if product_case.image if product_case.image
      end
    end  
   end
end
