class Publication < ActiveRecord::Base
  attr_accessible :title, :file, :image
  has_attached_file :image, :styles => { :thumb => "150x220#" }
  has_attached_file :file
  validates :title, :image, :file, :presence => true
end
