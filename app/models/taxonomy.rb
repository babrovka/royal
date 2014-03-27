class Taxonomy < ActiveRecord::Base
  attr_accessible :title
  has_many :taxons
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
end
