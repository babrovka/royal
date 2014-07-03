class Brand < ActiveRecord::Base
  attr_accessible :title, :partner_id
  has_many :products
  has_many :consultations
  has_many :product_categories
  has_many :videos
  has_many :procedure_categories
  belongs_to :partner
end
