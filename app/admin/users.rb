ActiveAdmin.register User do
  config.batch_actions = false
  config.clear_sidebar_sections!
  actions :all, :except => :new
  
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
  
  controller do

    def update    
      @user = User.find(params[:id])
              
       respond_to do |format|
         if @user.update_attributes(params[:user])
           format.html { redirect_to action: "index" }
         else
           format.html { render action: "edit" }
         end
       end
      
      
    end
  end
  
end
