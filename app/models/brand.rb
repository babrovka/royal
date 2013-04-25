class Brand < ActiveRecord::Base
  attr_accessible :title
  has_many :products
  has_many :consultations
end
