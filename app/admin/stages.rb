ActiveAdmin.register Stage do
  belongs_to :procedure
  navigation_menu :procedure 
end
