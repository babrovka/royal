class Taxonomy < ActiveRecord::Base
  attr_accessible :title, :seo_title, :seo_description, :seo_text
  has_many :taxons
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
end
