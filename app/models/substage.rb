class Substage < ActiveRecord::Base
  attr_accessible :stage_id,
                  :text,
                  :product_ids,
                  :position

  has_many :substage_products
  has_many :products, through: :substage_products
  belongs_to :stage

  default_scope -> { order('position ASC') }
end
