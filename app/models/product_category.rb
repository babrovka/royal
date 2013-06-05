class ProductCategory < ActiveRecord::Base
  attr_accessible :brand_id, :title
  belongs_to :brand
  has_many :products
end
