class Procedure < ActiveRecord::Base
  attr_accessible :title, :text, :stages_attributes
  has_many :stages
  accepts_nested_attributes_for :stages, :allow_destroy => true
end
