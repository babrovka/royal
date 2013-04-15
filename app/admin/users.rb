ActiveAdmin.register User do
  actions :index, :destroy, :edit
  
   index do 
    column :email
    column :role
    default_actions
  end
  
  form do |f|  
    f.inputs "Details" do
      f.input :role, :as => :select, :collection => User::ROLES
    end
    f.actions
  end
  
 show do
   attributes_table do
     row :email
     row :role
   end  
  end
  
end
