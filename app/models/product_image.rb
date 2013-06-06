class ProductImage < ActiveRecord::Base
  attr_accessible :image, :product_id
  belongs_to :product
  has_attached_file :image, :styles => { :catalog => "200x200#", :product => "300x300#", :ico => "70x70#" }
end
