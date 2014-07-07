class ProcedureCategory < ActiveRecord::Base
  attr_accessible :title, :brand_id, :parent_id
  has_many :procedure_procedure_categories
  has_many :procedures, through: :procedure_procedure_categories
  acts_as_nested_set
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :brand
  
  def parent_category
    if self.parent_id
      ProcedureCategory.find(self.parent_id).try(:title)
    end
  end
  
  def title_with_parent
    if self.parent_id
      "#{self.parent_category} | #{self.title}"
    else
      self.title
    end
  end
end
