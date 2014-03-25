class Taxon < ActiveRecord::Base
  attr_accessible :title, :taxonomy_id, :product_ids, :parent_id,
                  :seo_title, :seo_description, :seo_text
  belongs_to :taxonomy
  has_many :product_taxons
  has_many :products, through: :product_taxons
  acts_as_nested_set
  default_scope :order => 'lft ASC'
  
  extend FriendlyId
  friendly_id :title, use: :slugged
end
