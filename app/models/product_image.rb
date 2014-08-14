class ProductImage < ActiveRecord::Base
  attr_accessible :image, :product_id, :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  belongs_to :product
  
  has_attached_file :image, :styles: { 
                                        catalog: {geometry: "200x200#", processors: [:cropper]},
                                        product: {geometry: "300x300#"},
                                        ico: {geometry: "70x70#"},
                                        path: "/shared_images/:class/:attachment/:id_partition/:style/:filename",
                                        url: "/shared_images/:class/:attachment/:id_partition/:style/:filename"
  }
  
  after_update :reprocess_image, :if => :cropping? 
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def image_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(image.path(style))
  end
  
  
  
  private
  
  def reprocess_image
    image.assign(image)
    image.save
  end


end