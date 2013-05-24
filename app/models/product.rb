class Product < ActiveRecord::Base
  attr_accessible :title, :packing, :text, :ingredients, :brand_id, 
                  :visible_professional, :visible_dealer1, :visible_dealer2, :visible_dealer3,
                  :price_professional, :price_dealer1, :price_dealer2, :price_dealer3,
                  :procedure_ids, :case_ids, :consultation_ids, :image, :product_images_attributes, :short_description
  has_and_belongs_to_many :procedures
  has_and_belongs_to_many :cases
  has_and_belongs_to_many :consultations
  has_many :line_items
  has_many :product_images
  accepts_nested_attributes_for :product_images, :allow_destroy => true
  before_destroy :ensure_not_referenced_by_any_line_item
  
  
  private
  
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add('Line Items present')
      return false
    end
  end
end