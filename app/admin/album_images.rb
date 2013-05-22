ActiveAdmin.register AlbumImage do
  config.batch_actions = false
  config.clear_sidebar_sections!

  menu :parent => I18n.t('media')
  belongs_to :album
  navigation_menu :album
end
