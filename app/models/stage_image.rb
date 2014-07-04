class StageImage < ActiveRecord::Base
  attr_accessible :title, :image
  has_many :stage_stage_images
  has_many :stages, through: :stage_stage_images
  
  has_attached_file :image, :styles => { :medium => "553x91#" }
end
