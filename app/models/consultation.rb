class Consultation < ActiveRecord::Base
  attr_accessible :answer, :question, :brand_id, :case_id, :check, :product_ids
  has_and_belongs_to_many :products
  belongs_to :brand
  belongs_to :case
end