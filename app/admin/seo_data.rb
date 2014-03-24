ActiveAdmin.register SeoData do
  config.batch_actions = false
  config.clear_sidebar_sections!
  actions :index, :show, :update, :edit
   index do 
     column :page
     default_actions
   end

   form do |f|  
     f.inputs  do
       f.input :title
       f.input :description
       f.input :seo_text
     end
     f.actions
   end

  show do
    attributes_table do
      row :page
      row :title
      row :description
      row :seo_text do |row|
        Redcarpet.new(row.seo_text, :hard_wrap).to_html.html_safe
      end
    end  
   end
end
