class Substage < ActiveRecord::Base
  attr_accessible :product_id, :stage_id, :text
  belongs_to :product
  belongs_to :stage
end
