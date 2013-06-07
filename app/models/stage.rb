class Stage < ActiveRecord::Base
  attr_accessible :procedure_id, :title, :substages_attributes
  belongs_to :procedure
  has_many :substages
  accepts_nested_attributes_for :substages, :allow_destroy => true
end
