class Procedure < ActiveRecord::Base
  attr_accessible :text, :title
  has_and_belongs_to_many :products
end
