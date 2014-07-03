class ProcedureCategory < ActiveRecord::Base
  attr_accessible :title, :brand_id
  has_many :procedure_procedure_categories
  has_many :procedures, through: :procedure_procedure_categories
end
