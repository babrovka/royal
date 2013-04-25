ActiveAdmin.register Product do

   form do |f|  
     f.inputs "Details" do
       f.input :title
       f.input :packing
       f.input :text, :input_html => { :rows => 8  }
       f.input :ingredients, :input_html => { :rows => 2  }
       f.input :brand_id, :as => :select, :collection => Brand.all
     end 
     
     f.inputs "Access" do
       f.input :visible_professional      
       f.input :visible_dealer1
       f.input :visible_dealer2
       f.input :visible_dealer3
       f.input :price_professional
       f.input :price_dealer1
       f.input :price_dealer2
       f.input :price_dealer3
     end
       
     f.inputs "Procedures" do
       f.input :procedures, :as => :check_boxes
     end
     f.inputs "Cases" do
       f.input :cases, :as => :check_boxes
     end
     f.actions
   end
   
   show do |product|

     attributes_table do
       row :title
       row :packing
       row :text do |row|
         row.text.html_safe
       end
       row :ingredients do |row|
         row.text.html_safe
       end
       row :brand_id
     end

     panel "Procedures" do 
       table_for product.procedures do 
         column :title do |column|
           link_to column.title, admin_procedure_path(column)
         end
       end
     end
     
     panel "Cases" do 
       table_for product.cases do 
         column :title do |column|
           link_to column.title, admin_case_path(column)
         end
       end
     end

    end
   
   
   
end