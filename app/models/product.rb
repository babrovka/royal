class Product < ActiveRecord::Base
  attr_accessible :title, :packing, :text, :ingredients, :brand_id, 
                  :visible_professional, :visible_dealer1, :visible_dealer2, :visible_dealer3,
                  :price_professional, :price_dealer1, :price_dealer2, :price_dealer3,
                  :procedure_ids, :case_ids, :consultation_ids
  has_and_belongs_to_many :procedures
  has_and_belongs_to_many :cases
  has_and_belongs_to_many :consultations
end