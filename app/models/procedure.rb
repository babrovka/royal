class Procedure < ActiveRecord::Base
  attr_accessible :title, :text, :stages_attributes, :short_text, :image
  has_many :stages
  accepts_nested_attributes_for :stages, :allow_destroy => true
  has_attached_file :image, :styles => { :medium => "940x380#", :thumb => "200x100>" }
  has_many :procedure_procedure_categories
  has_many :procedure_categories, through: :procedure_procedure_categories
  
  
  def brand 
    unless self.procedure_categories.empty?
      self.procedure_categories.first.brand if self.procedure_categories.first.brand
    end      
  end
  
end
