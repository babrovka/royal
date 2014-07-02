class StageImage < ActiveRecord::Base
  attr_accessible :title
  has_many :stage_stage_images
  has_many :stages, through: :stage_stage_images
end
