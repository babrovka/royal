class Stage < ActiveRecord::Base
  attr_accessible :procedure_id,
                  :title,
                  :substages_attributes,
                  :stage_image_ids,
                  :position

  belongs_to :procedure
  has_many :substages
  has_many :stage_stage_images
  has_many :stage_images, through: :stage_stage_images
  accepts_nested_attributes_for :substages, :allow_destroy => true

  default_scope -> { order('position ASC') }
end
