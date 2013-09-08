class Taxonomy < ActiveRecord::Base
  attr_accessible :title
  has_many :taxons
end
