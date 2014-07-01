class SubstageProduct < ActiveRecord::Base
  attr_accessible :product_id, :substage_id
  belongs_to :product
  belongs_to :substage
end
