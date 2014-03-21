# coding: utf-8

ActiveAdmin.register Taxon do
  menu :parent => I18n.t('catalog')
  config.batch_actions = false
  filter :taxonomy_id
  config.sort_order = 'lft_asc'
  sortable_tree_member_actions
  
   index do 
     sortable_tree_columns
     column :parent_id do |column|
       column.parent_id ? Taxon.find(column.parent_id).title : '-'
     end
     column :title
     
     default_actions
   end

   form do |f|  
     f.inputs do
       f.input :title
       f.input :parent_id, :as => :select, :collection => Taxon.all
       f.input :taxonomy_id, :as => :select, :collection => Taxonomy.all
       # f.input :products, :as => :check_boxes
     end
     f.actions
   end

  show do
    attributes_table do
      row :title
      row :taxonomy_id
    end  
   end
end
