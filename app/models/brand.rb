class Brand < ActiveRecord::Base
  attr_accessible :title
  has_many :products
  has_many :consultations
  has_many :product_categories
  has_many :videos
end
