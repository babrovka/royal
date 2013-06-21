ActiveAdmin.register User do
  menu :parent => I18n.t('users')
  
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  index do 
    column :email
    column :role do |column|
      t(column.role)
    end
    column :check
    column :region_id do |column|
      if column.region_id?
        Region.find(column.region_id).name
      else
        "-"
      end
    end
    column :own_region
    default_actions
  end
  
 form :partial => "form"
  
 show do
   attributes_table do
     row :email
     row :role do |row|
       t(row.role)
     end
     row :check
   end  
  end
  
  controller do

    def update    
      @user = User.find(params[:id])
       
       if params[:user][:check] == "1" && @user.update_attributes(params[:user])
         redirect_to :action => :index
         UserMailer.confirm_email(@user).deliver
         flash[:notice] = t('user_approved_mail_sent')
       elsif @user.update_attributes(params[:user])
         redirect_to :action => :index
       else
         render action: "edit"
       end
      
      
    end
  end
  
end
