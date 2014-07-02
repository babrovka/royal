class StageStageImage < ActiveRecord::Base
  attr_accessible :stage_id, :stage_image_id
  belongs_to :stage
  belongs_to :stage_image
end
