class ProductTaxon < ActiveRecord::Base
  attr_accessible :product_id, :taxon_id
  belongs_to :product
  belongs_to :taxon
end
