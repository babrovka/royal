class ProductImage < ActiveRecord::Base
  attr_accessible :image, :product_id
  belongs_to :product
  has_attached_file :image, 
                    :url  => "/system/product_images/images/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/system/product_images/images/:id/:style_:basename.:extension",
                    :styles => { :catalog => "200x200#", :product => "300x300#", :ico => "70x70#" }
end