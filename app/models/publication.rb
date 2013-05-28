class Publication < ActiveRecord::Base
  attr_accessible :title, :file, :image, :delete_image
  has_attached_file :image, :styles => { :thumb => "159x222#" }
  has_attached_file :file
  validates :title, :image, :file, :presence => true
  
  before_validation :clear_image

  
  def delete_image=(value)
     @delete_image = !value.to_i.zero?
   end

   def delete_image
     !!@delete_image
   end
   alias_method :delete_image?, :delete_image
   
   def clear_image
     self.image = nil if delete_image? && !image.dirty?
   end
  
end
