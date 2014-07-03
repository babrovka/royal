class Procedure < ActiveRecord::Base
  attr_accessible :title, :text, :stages_attributes, :short_text, :image
  has_many :stages
  accepts_nested_attributes_for :stages, :allow_destroy => true
  has_attached_file :image, :styles => { :medium => "940x380#", :thumb => "200x100>" }
  
  
  def brand 
    if self.stages
      stages = self.stages.pluck(:id)
      substages = Substage.where(:stage_id => stages)
      if substages
        products = Product.includes(:substages).where("substages.id" => substages) 
        unless products.empty? && products.first.brand
          brand = products.first.brand
          brand
        end
      end
    end
  end
  
end
