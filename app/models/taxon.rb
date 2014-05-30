class Taxon < ActiveRecord::Base
  attr_accessible :title, :taxonomy_id, :product_ids, :parent_id,
                  :seo_title, :seo_description, :seo_text, :seo_url
  belongs_to :taxonomy
  has_many :product_taxons
  has_many :products, through: :product_taxons
  acts_as_nested_set
  default_scope :order => 'lft ASC'
  validates :title, presence: true
  
  after_save :check_depth
  
  extend FriendlyId
  friendly_id :seo_url, use: :slugged
  
  def check_depth 
    if self.depth > 1
      self.destroy!
    end
  end
end
