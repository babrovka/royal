class Album < ActiveRecord::Base
  attr_accessible :text, :title, :album_images_attributes
  has_many :album_images
  accepts_nested_attributes_for :album_images, :allow_destroy => true
  validates :title, :presence => true
end
