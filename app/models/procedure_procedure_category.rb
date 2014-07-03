class ProcedureProcedureCategory < ActiveRecord::Base
  attr_accessible :procedure_category_id, :procedure_id
  belongs_to :procedure
  belongs_to :procedure_category
end
