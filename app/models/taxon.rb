class Taxon < ActiveRecord::Base
  attr_accessible :title, :taxonomy_id
  belongs_to :taxonomy
  has_many :product_taxons
  has_many :products, through: :product_taxons
end
