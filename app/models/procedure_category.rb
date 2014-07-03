class ProcedureCategory < ActiveRecord::Base
  attr_accessible :title, :brand_id
  has_many :procedure_procedure_categories
  has_many :procedures, through: :procedure_procedure_categories
  acts_as_nested_set
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :brand
end
