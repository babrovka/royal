class Procedure < ActiveRecord::Base
  attr_accessible :title, :text, :stages_attributes, :short_text, :image
  has_many :stages
  accepts_nested_attributes_for :stages, :allow_destroy => true
  has_attached_file :image, :styles => { :thumb => "940x380#" }
  
end
