ActiveAdmin.register Order do
  menu :parent => I18n.t('catalog')
  
  show do |order|
   attributes_table do
     row :user_id
     row :role do |user|
       order.user.role
     end
     row :comment
   end

   panel t('products') do 
     table_for order.line_items do 
       column :product do |column|
         link_to column.product.title, admin_product_path(column.product)
       end
       column :quantity do |column|
         column.quantity
       end
     end
   end
   
  end
   
  
end
