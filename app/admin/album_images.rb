ActiveAdmin.register AlbumImage do
  config.batch_actions = false
  config.clear_sidebar_sections!

  menu :parent => I18n.t('media')
  belongs_to :album
  navigation_menu :album
  
  controller do

    def destroy
      @album_image = AlbumImage.find(params[:id])
      @album_image.destroy
      respond_to do |format|
        format.js
      end
    end
    
  end
end
