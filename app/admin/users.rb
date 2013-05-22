ActiveAdmin.register User do
  menu :parent => I18n.t('users')
  
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  index do 
    column :email
    column :role
    column :check
    default_actions
  end
  
 form :partial => "form"
  
 show do
   attributes_table do
     row :email
     row :role
     row :check
   end  
  end
  
  controller do

    def update    
      @user = User.find(params[:id])
              
       respond_to do |format|
         if @user.update_attributes(params[:user])
           format.html { redirect_to action: "index" }
           UserMailer.confirm_email(@user).deliver
         else
           format.html { render action: "edit" }
         end
       end
      
      
    end
  end
  
end
